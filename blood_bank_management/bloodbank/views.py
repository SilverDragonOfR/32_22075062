from django.shortcuts import render, redirect
from django.contrib.auth import get_user_model
from django.core.exceptions import PermissionDenied
from main.decorators import bloodbank_required
from .models import BloodBank, Donation, Camp
from donor.models import Donor
from main.models import City
from hospital.models import Request
from django.contrib.auth import login as django_login
from datetime import date
# Create your views here.

User = get_user_model()

def signup(request):
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
        cities = City.objects.all().values_list("city_name")
        context = {
            "wrong": False,
            "wrong_text": "",
            "cities": cities
        }
        return render(request, "bloodbank/signup.html", context)
    elif request.method == "POST":
        bloodbank_name, city_name, address, pincode, employees, phone, manager_name, email, password = [ request.POST.get("name"), request.POST.get("city"), request.POST.get("address"), request.POST.get("pincode"), request.POST.get("employees"), request.POST.get("phone"), request.POST.get("manager"), request.POST.get("email"), request.POST.get("password"),]
        if User.objects.filter(username=email):
            cities = City.objects.all().values_list("city_name")
            context = {
                "wrong": True,
                "wrong_text": "Email already exists",
                "cities": cities
            }
            return render(request, "bloodbank/signup.html", context)
        user = User(username=email, email=email, is_bloodbank=True)
        user.set_password(password)
        city = City.objects.get(city_name=city_name)
        bloodbank = BloodBank(user=user, bloodbank_name=bloodbank_name, city=city, address=address, pincode=pincode, employees=employees, phone=phone, manager_name=manager_name)
        is_bloodbank_valid, error_msg = bloodbank.validate()
        if not is_bloodbank_valid:
            cities = City.objects.all().values_list("city_name")
            context = {
                "wrong": True,
                "wrong_text": error_msg,
                "cities": cities
            }
            return render(request, "bloodbank/signup.html", context)
        user.save()
        bloodbank.save()
        django_login(request, user)
        return redirect("/bloodbank/dashboard/")
    else:
        raise PermissionDenied
    
@bloodbank_required
def dashboard(request):
    if request.method == "GET":
        user = request.user
        bloodbank = BloodBank.objects.filter(user=user)
        amount_a_pos, amount_b_pos, amount_ab_pos, amount_o_pos, amount_a_neg, amount_b_neg, amount_ab_neg, amount_o_neg = bloodbank[0].a_pos, bloodbank[0].b_pos, bloodbank[0].ab_pos, bloodbank[0].o_pos, bloodbank[0].a_neg, bloodbank[0].b_neg, bloodbank[0].ab_neg, bloodbank[0].o_neg
        mx_amount = max(amount_a_pos, amount_b_pos, amount_ab_pos, amount_o_pos, amount_a_neg, amount_b_neg, amount_ab_neg, amount_o_neg)+0.1
        height_a_pos, height_b_pos, height_ab_pos, height_o_pos, height_a_neg, height_b_neg, height_ab_neg, height_o_neg = 128*(amount_a_pos/mx_amount), 128*(amount_b_pos/mx_amount), 128*(amount_ab_pos/mx_amount), 128*(amount_o_pos/mx_amount), 128*(amount_a_neg/mx_amount), 128*(amount_b_neg/mx_amount), 128*(amount_ab_neg/mx_amount), 128*(amount_o_neg/mx_amount)
        today_date = date.today()
        camps = Camp.objects.filter(bloodbank=bloodbank[0]).order_by("-start_date")
        scheduled = [ camp for camp in camps if camp.start_date > today_date ][::-1]
        ongoing = [ camp for camp in camps if (camp.start_date <= today_date) and (camp.end_date >= today_date) ]
        past = [ camp for camp in camps if camp.end_date < today_date ]
        num_of_scheduled = len(scheduled)
        num_of_ongoing = len(ongoing)
        num_of_past = len(past)
        cities = City.objects.all().values_list("city_name")
        context = {
            "wrong": False,
            "wrong_text": "",            
            "amount_a_pos" : amount_a_pos,
            "amount_b_pos" : amount_b_pos,
            "amount_ab_pos" : amount_ab_pos,
            "amount_o_pos" : amount_o_pos,
            "amount_a_neg" : amount_a_neg,
            "amount_b_neg" : amount_b_neg,
            "amount_ab_neg" : amount_ab_neg,
            "amount_o_neg" : amount_o_neg,
            "height_a_pos" : height_a_pos,
            "height_b_pos" : height_b_pos,
            "height_ab_pos" : height_ab_pos,
            "height_o_pos" : height_o_pos,
            "height_a_neg" : height_a_neg,
            "height_b_neg" : height_b_neg,
            "height_ab_neg" : height_ab_neg,
            "height_o_neg" : height_o_neg,
            "bloodbank" : bloodbank[0],
            "scheduled" : scheduled,
            "ongoing" : ongoing,
            "past" : past,
            "num_of_scheduled" : num_of_scheduled,
            "num_of_ongoing" : num_of_ongoing,
            "num_of_past" : num_of_past,
            "cities" : cities
        }
        return render(request, "bloodbank/dashboard.html", context)
    
    elif request.method == "POST":
        name, start_date, end_date, address, city_name, pincode = [ request.POST.get("name"), request.POST.get("startdate"), request.POST.get("enddate"), request.POST.get("address"), request.POST.get("city"),  request.POST.get("pincode") ]
        bloodbank = BloodBank.objects.get(user=request.user)
        city = City.objects.get(city_name=city_name)
        camp = Camp(name=name, bloodbank=bloodbank, start_date=start_date, end_date=end_date, address=address, city=city, pincode=pincode)
        is_camp_validate, error_msg = camp.validate()
        if not is_camp_validate:
            bloodbank = BloodBank.objects.filter(user=request.user)
            amount_a_pos, amount_b_pos, amount_ab_pos, amount_o_pos, amount_a_neg, amount_b_neg, amount_ab_neg, amount_o_neg = bloodbank[0].a_pos, bloodbank[0].b_pos, bloodbank[0].ab_pos, bloodbank[0].o_pos, bloodbank[0].a_neg, bloodbank[0].b_neg, bloodbank[0].ab_neg, bloodbank[0].o_neg
            mx_amount = max(amount_a_pos, amount_b_pos, amount_ab_pos, amount_o_pos, amount_a_neg, amount_b_neg, amount_ab_neg, amount_o_neg)+0.1
            height_a_pos, height_b_pos, height_ab_pos, height_o_pos, height_a_neg, height_b_neg, height_ab_neg, height_o_neg = 128*(amount_a_pos/mx_amount), 128*(amount_b_pos/mx_amount), 128*(amount_ab_pos/mx_amount), 128*(amount_o_pos/mx_amount), 128*(amount_a_neg/mx_amount), 128*(amount_b_neg/mx_amount), 128*(amount_ab_neg/mx_amount), 128*(amount_o_neg/mx_amount)
            today_date = date.today()
            camps = Camp.objects.filter(bloodbank=bloodbank[0]).order_by("-start_date")
            scheduled = [ camp for camp in camps if camp.start_date > today_date ]
            ongoing = [ camp for camp in camps if (camp.start_date <= today_date) and (camp.end_date >= today_date) ]
            past = [ camp for camp in camps if camp.end_date < today_date ]
            num_of_scheduled = len(scheduled)
            num_of_ongoing = len(ongoing)
            num_of_past = len(past)
            cities = City.objects.all().values_list("city_name")
            context = {
                "wrong": True,
                "wrong_text": error_msg,            
                "amount_a_pos" : amount_a_pos,
                "amount_b_pos" : amount_b_pos,
                "amount_ab_pos" : amount_ab_pos,
                "amount_o_pos" : amount_o_pos,
                "amount_a_neg" : amount_a_neg,
                "amount_b_neg" : amount_b_neg,
                "amount_ab_neg" : amount_ab_neg,
                "amount_o_neg" : amount_o_neg,
                "height_a_pos" : height_a_pos,
                "height_b_pos" : height_b_pos,
                "height_ab_pos" : height_ab_pos,
                "height_o_pos" : height_o_pos,
                "height_a_neg" : height_a_neg,
                "height_b_neg" : height_b_neg,
                "height_ab_neg" : height_ab_neg,
                "height_o_neg" : height_o_neg,
                "bloodbank" : bloodbank,
                "scheduled" : scheduled,
                "ongoing" : ongoing,
                "past" : past,
                "num_of_scheduled" : num_of_scheduled,
                "num_of_ongoing" : num_of_ongoing,
                "num_of_past" : num_of_past,
                "cities" : cities
            }
            return render(request, "bloodbank/dashboard.html", context)
        camp.save()
        
        return redirect("/bloodbank/dashboard")
    else:
        raise PermissionDenied
    



@bloodbank_required
def donations(request):
    if request.method == "GET":
        user = request.user
        bloodbank = BloodBank.objects.filter(user=user)
        donations = Donation.objects.filter(bloodbank=bloodbank[0]).order_by("-donation_date")
        context = {
            "wrong": False,
            "wrong_text": "",
            "bloodbank": bloodbank[0],
            "donations": donations
        }
        return render(request, "bloodbank/donations.html", context)
    

    
    elif request.method == "POST":
        donor_email, donation_date, amount,  pct_contamination,  glucose, platelet_count, info = [ request.POST.get("donoremail"), request.POST.get("birthday"), int(request.POST.get("amount")),  int(request.POST.get("pctcontamination")),int(request.POST.get("glucose")), int(request.POST.get("plateletcount")), request.POST.get("info")]
        bloodbank = BloodBank.objects.get(user=request.user)
        if not User.objects.filter(email=donor_email).exists():
            donations = Donation.objects.filter(bloodbank=bloodbank[0]).order_by("-donation_date")
            context = {
                "wrong": True,
                "wrong_text": "No such donor exists",
                "bloodbank": bloodbank,
                "donations": donations
            }
            return render(request, "bloodbank/donations.html", context)
        elif not Donor.objects.filter(user=User.objects.get(email=donor_email)).exists():
            donations = Donation.objects.filter(bloodbank=bloodbank[0]).order_by("-donation_date")
            context = {
                "wrong": True,
                "wrong_text": "No such donor exists",
                "bloodbank": bloodbank,
                "donations": donations
            }
            return render(request, "bloodbank/donations.html", context)
            
        donor_user = User.objects.get(email=donor_email)
        donor = Donor.objects.get(user=donor_user)
        blood_group = donor.blood_group

        donation = Donation(donor=donor, bloodbank=bloodbank, donation_date=donation_date, amount=amount, blood_group=blood_group, pct_contamination=pct_contamination, glucose=glucose, platelet_count=platelet_count, info=info)
        is_donation_valid, error_msg = donation.validate()
        if not is_donation_valid:
            donations = Donation.objects.filter(bloodbank=bloodbank[0]).order_by("-donation_date")
            context = {
                "wrong": True,
                "wrong_text": error_msg,
                "bloodbank": bloodbank,
                "donations": donations
            }
            return render(request, "bloodbank/donations.html", context)
        donation.save()
        
        return redirect("/bloodbank/donations/") 
    

    else:
        raise PermissionDenied
    

    
@bloodbank_required
def pending_requests(request):
    if request.method == "GET":
        user = request.user
        bloodbank = BloodBank.objects.filter(user=user)
        requests = Request.objects.filter().order_by("-request_date")
        pending = [ blood_request for blood_request in requests if (not blood_request.is_accepted) ]
        accepted = [ blood_request for blood_request in requests if ( blood_request.blood_bank == bloodbank[0]) and blood_request.is_accepted and (blood_request.expected_arrival_date >= date.today()) ]
        completed = [ blood_request for blood_request in requests if ( blood_request.blood_bank == bloodbank[0]) and blood_request.is_accepted and (blood_request.expected_arrival_date < date.today()) ]
        num_of_pending = len(pending)
        num_of_accepted = len(accepted)
        num_of_completed = len(completed)

        context = {
            "wrong": False,
            "wrong_text": "",
            "bloodbank" : bloodbank[0],
            "pending" : pending,
            "accepted" : accepted,
            "completed" : completed,
            "num_of_pending" : num_of_pending,
            "num_of_accepted" : num_of_accepted,
            "num_of_completed" : num_of_completed
        }
        return render(request, "bloodbank/requests.html", context)
    


    elif request.method == "POST":
        user = request.user
        bloodbank = BloodBank.objects.filter(user=user)
        expect_arrival_date, requestpk = [ request.POST.get("expectedarrivaldate"), request.POST.get("requestpk") ]
        blood_request = Request.objects.get(pk=requestpk)
        blood_group = blood_request.blood_group
        amount = blood_request.amount

        err = False
        if blood_group == "A+":
            if bloodbank[0].a_pos < amount:
                err = True
        elif blood_group == "A-":
            if bloodbank[0].a_neg < amount:
                err = True
        elif blood_group == "B+":
            if bloodbank[0].b_pos < amount:
                err = True
        elif blood_group == "B-":
            if bloodbank[0].b_neg < amount:
                err = True
        elif blood_group == "AB+":
            if bloodbank[0].ab_pos < amount:
                err = True
        elif blood_group == "AB-":
            if bloodbank[0].ab_neg < amount:
                err = True
        elif blood_group == "O+":
            if bloodbank[0].o_pos < amount:
                err = True
        elif blood_group == "O-":
            if bloodbank[0].o_neg < amount:
                err = True
        if err:

            requests = Request.objects.filter().order_by("-request_date")
            pending = [ blood_request for blood_request in requests if (not blood_request.is_accepted) ]
            accepted = [ blood_request for blood_request in requests if ( blood_request.blood_bank == bloodbank[0]) and blood_request.is_accepted and (blood_request.expected_arrival_date >= date.today()) ]
            completed = [ blood_request for blood_request in requests if ( blood_request.blood_bank == bloodbank[0]) and blood_request.is_accepted and (blood_request.expected_arrival_date < date.today()) ]
            num_of_pending = len(pending)
            num_of_accepted = len(accepted)
            num_of_completed = len(completed)
            context = {
            "wrong": True,
            "wrong_text": "You don't have enough blood to accept that request",
            "bloodbank" : bloodbank,
            "pending" : pending,
            "accepted" : accepted,
            "completed" : completed,
            "num_of_pending" : num_of_pending,
            "num_of_accepted" : num_of_accepted,
            "num_of_completed" : num_of_completed
            }
            return render(request, "bloodbank/requests.html", context)
        
        blood_request.is_accepted = True
        blood_request.expected_arrival_date = expect_arrival_date
        blood_request.blood_bank = bloodbank[0]
        is_bloodrequest_valid, error_msg = blood_request.validate()
        if not is_bloodrequest_valid:
            requests = Request.objects.filter().order_by("-request_date")
            pending = [ blood_request for blood_request in requests if (not blood_request.is_accepted) ]
            accepted = [ blood_request for blood_request in requests if ( blood_request.blood_bank == bloodbank[0]) and blood_request.is_accepted and (blood_request.expected_arrival_date >= date.today()) ]
            completed = [ blood_request for blood_request in requests if ( blood_request.blood_bank == bloodbank[0]) and blood_request.is_accepted and (blood_request.expected_arrival_date < date.today()) ]
            num_of_pending = len(pending)
            num_of_accepted = len(accepted)
            num_of_completed = len(completed)
            context = {
            "wrong": True,
            "wrong_text": error_msg,
            "bloodbank" : bloodbank,
            "pending" : pending,
            "accepted" : accepted,
            "completed" : completed,
            "num_of_pending" : num_of_pending,
            "num_of_accepted" : num_of_accepted,
            "num_of_completed" : num_of_completed
            }
            return render(request, "bloodbank/requests.html", context)

        blood_request.save()

        return redirect("/bloodbank/pendingrequests")     


    else:
        raise PermissionDenied