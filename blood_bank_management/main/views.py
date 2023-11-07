from django.shortcuts import render, redirect
from main.decorators import donor_required
from django.core.exceptions import PermissionDenied
from django.contrib.auth import login as django_login, authenticate, logout as django_logout
import uuid, math, random
from datetime import date
from .models import User, PasswordToken, City
from bloodbank.models import Camp
from .helpers import send_forgot_password_mail
from .data import faqs as loaded_faqs, testimonials as loaded_testimonials
from main.data import blood_quotes
from donor.models import Donor
from bloodbank.models import BloodBank, Camp
from hospital.models import Hospital, Request
from bloodbank.models import Donation
from django.db.models import Sum

NUMBER_OF_BANKS_IN_ONE_VIEW = 2

# index views
def home(request):

    testimonials = loaded_testimonials

    number_of_donors = len(Donor.objects.filter())
    amount_donated = Donation.objects.filter().aggregate(amount_donated=Sum("amount"))["amount_donated"]
    if amount_donated == None:
        amount_donated = 0
    number_of_donations = len(Donation.objects.filter())
    number_of_hospitals = len(Hospital.objects.filter())
    amount_requested = Request.objects.filter().aggregate(amount_requested=Sum("amount"))["amount_requested"]
    if amount_requested == None:
        amount_requested = 0
    number_of_requests = len(Request.objects.filter())
    number_of_bloodbanks = len(BloodBank.objects.filter())
    number_of_camps = len(Camp.objects.filter())
    number_of_cities = len(City.objects.filter())

    context = {
        "testimonials" : testimonials,
        "number_of_donors" : number_of_donors,
        "amount_donated" : amount_donated,
        "number_of_donations" : number_of_donations,
        "number_of_hospitals" : number_of_hospitals,
        "amount_requested" : amount_requested,
        "number_of_requests" :number_of_requests,
        "number_of_bloodbanks" : number_of_bloodbanks,
        "number_of_camps" : number_of_camps,
        "number_of_cities" : number_of_cities,
    }
    return render(request, "index/index.html", context)

def about(request):

    faqs = loaded_faqs

    context = {
        "faqs" : faqs
    }
    return render(request, "index/about.html", context)

def login(request):
    if request.user.is_authenticated:
        if request.user.is_donor:
            return redirect("/donor/dashboard/")
        elif request.user.is_bloodbank:
            return redirect("/bloodbank/dashboard/")
        elif request.user.is_hospital:
            return redirect("/hospital/dashboard/")
        else:
            return redirect("/admin/")
    
    if request.method == "GET":
        context = {
            "wrong": False,
            "wrong_text": ""
        }
        return render(request, "index/login.html", context)
    elif request.method == "POST":
        email, password = request.POST.get("email"), request.POST.get("password")
        user = authenticate(request, email=email, password=password)
        if user:
            django_login(request, user)
            if user.is_donor:
                return redirect("/donor/dashboard/")
            elif user.is_bloodbank:
                return redirect("/bloodbank/dashboard/")
            elif user.is_hospital:
                return redirect("/hospital/dashboard/")
            else:
                return redirect("/admin/")
        else:
            context = {
                "wrong": True,
                "wrong_text": "Wrong Email or Password"
            }
            return render(request, "index/login.html", context)
    else:
        raise PermissionDenied
    
def logout(request):
    django_logout(request)
    return redirect("/")

def change_alphanumeric(ch):
    if ch in "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM":
        return ch
    return " "

def clean_query(q):
    ql = list(q)
    for i, ch in enumerate(ql.copy()):
        ql[i] = change_alphanumeric(ch)
    return "".join(ql).split(" ")
    
def services(request):
    camps = Camp.objects.filter().order_by("-start_date")
    today_date = date.today()

    # operations
    q_old = request.GET.get("q", "")
    q = q_old.lower().strip()
    current_page_number = int(request.GET.get("pg", "1"))
    option = int(request.GET.get("op", "0"))

    if option==1:
        camps = [camp for camp in camps if today_date<camp.start_date]
    elif option==2:
        camps = [camp for camp in camps if camp.start_date<=today_date<=camp.end_date]
    elif option==3:
        camps = [camp for camp in camps if camp.end_date<today_date]
    else:
        camps = [camp for camp in camps]

    ql = clean_query(q)
    camp_list = []
    for camp in camps:
        to_add = False
        for q in ql:
            for att in [camp.name, camp.address, camp.pincode, camp.city.city_name, camp.city.state, camp.bloodbank.bloodbank_name]:
                if q in att.lower():
                    to_add = True
                    break
        if to_add: camp_list.append(camp)

    total_page_number = int(math.ceil(len(camp_list)/NUMBER_OF_BANKS_IN_ONE_VIEW))
    if not total_page_number:
        current_page_number = 0

    quote = random.choice(blood_quotes)
    context = {
        "camps": camp_list[(current_page_number-1)*NUMBER_OF_BANKS_IN_ONE_VIEW:(current_page_number)*NUMBER_OF_BANKS_IN_ONE_VIEW],
        "today_date": today_date,
        "current_page_number" : current_page_number,
        "total_page_number" : total_page_number,
        "option" : option,
        "q_old" : q_old,
        "quote" : quote
    }
    return render(request, "index/services.html", context)

def forgot_password(request):
    if request.user.is_authenticated:
        if request.user.is_donor:
            return redirect("/donor/dashboard/")
        elif request.user.is_bloodbank:
            return redirect("/bloodbank/dashboard/")
        elif request.user.is_hospital:
            return redirect("/hospital/dashboard/")
        else:
            return redirect("/admin/")
        
    if request.method == "GET":
        context = {
            "wrong": False,
            "wrong_text": ""
        }
        return render(request, "index/forgot-password.html", context)
    
    elif request.method == "POST":
        email = request.POST.get("email")
        if User.objects.filter(email=email).exists():
            user = User.objects.get(email=email)
            if PasswordToken.objects.filter(user = user).exists():
                PasswordToken.objects.filter(user = user).delete()
            token = str(uuid.uuid4())
            send_forgot_password_mail(user.email, token)
            passwordtoken = PasswordToken(user=user, forgot_password_token=token)
            passwordtoken.save()

            context = {
                "success_text":"A link has been sent to you email!",
                "wrong": False,
                "wrong_text": ""
            }
            return render(request, "index/forgot-password.html", context)
        else :
            context = {
                "wrong": True,
                "wrong_text": "Email not found!"
            }
            return render(request, "index/forgot-password.html", context)
    else :
        raise PermissionDenied

def change_password(request, token):
    if request.user.is_authenticated:
        if request.user.is_donor:
            return redirect("/donor/dashboard/")
        elif request.user.is_bloodbank:
            return redirect("/bloodbank/dashboard/")
        elif request.user.is_hospital:
            return redirect("/hospital/dashboard/")
        else:
            return redirect("/admin/")
        
    if request.method == "GET":
        if PasswordToken.objects.filter(forgot_password_token = token).exists():
            context = {
                "wrong": False,
                "wrong_text": ""
            }
            return render(request, "index/change-password.html", context)
        else:
            redirect("/forgotpassword/")
    elif request.method == "POST":
        if not PasswordToken.objects.get(forgot_password_token = token):
            context = {
                "wrong": True,
                "wrong_text": "Email not found!"
            }
            return render(request, "index/forgot-password.html", context)
        user_obj = PasswordToken.objects.get(forgot_password_token = token).user
        password = request.POST.get("password")
        user_obj.set_password(password)
        user_obj.save()
        user = authenticate(request, email=user_obj.email, password=password)
        if user:
            django_login(request, user)
            if user.is_donor:
                return redirect("/donor/dashboard/")
            elif user.is_bloodbank:
                return redirect("/bloodbank/dashboard/")
            elif user.is_hospital:
                return redirect("/hospital/dashboard/")
            else:
                return redirect("/admin/")
        else:
            context = {
                "wrong": True,
                "wrong_text": "Wrong Email or Password"
            }
            return render(request, "index/login.html", context)
        
    else:
        raise PermissionError
