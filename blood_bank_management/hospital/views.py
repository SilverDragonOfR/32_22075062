from django.shortcuts import render, redirect
from django.contrib.auth import get_user_model
from django.core.exceptions import PermissionDenied
from main.decorators import hospital_required
from .models import Hospital, Request
from main.models import City
from django.contrib.auth import login as django_login
from datetime import datetime, date
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
        return render(request, "hospital/signup.html", context)
    elif request.method == "POST":
        name, city_name, address, phone, pincode , employees, email, password = [ request.POST.get("name"),  request.POST.get("city"), request.POST.get("address"), request.POST.get("phone"), request.POST.get("pincode"), request.POST.get("employees"), request.POST.get("email"), request.POST.get("password"),]
        if User.objects.filter(username=email):
            cities = City.objects.all().values_list("city_name")
            context = {
                "wrong": True,
                "wrong_text": error_msg,
                "cities": cities
            }
            return render(request, "hospital/signup.html", context)
        user = User(username=email, email=email, is_hospital=True)
        user.set_password(password)
        city = City.objects.get(city_name=city_name)
        hospital = Hospital(user=user, name=name, city=city, address=address, phone=phone, pincode=pincode, employees=employees)
        is_donor_valid, error_msg = hospital.validate()
        if not is_donor_valid:
            cities = City.objects.all().values_list("city_name")
            context = {
                "wrong": True,
                "wrong_text": error_msg,
                "cities": cities
            }
            return render(request, "hospital/signup.html", context)
        user.save()
        hospital.save()
        django_login(request, user)
        return redirect("/hospital/dashboard/")
    else:
        raise PermissionDenied
    
@hospital_required
def dashboard(request):

    if request.method == "GET":
        user = request.user
        hospital = Hospital.objects.filter(user=user)
        requests = Request.objects.filter(hospital=hospital[0]).order_by("-request_date")
        requests_pending = [request for request in requests if (not request.is_accepted) ]
        requests_accepted = [request for request in requests if (request.is_accepted and date.today()<=request.expected_arrival_date) ]
        requests_completed = [request for request in requests if (request.is_accepted and request.expected_arrival_date<date.today()) ]
        num_of_requests_pending = len(requests_pending)
        num_of_requests_accepted = len(requests_accepted)
        num_of_requests_completed = len(requests_completed)
        sum_of_amount = sum([ request.amount for request in requests ])
        context = {
            "requests_pending" : requests_pending,
            "requests_accepted" : requests_accepted,
            "requests_completed" : requests_completed,
            "num_of_requests" : num_of_requests_pending+num_of_requests_accepted+num_of_requests_completed,
            "num_of_requests_pending" : num_of_requests_pending,
            "num_of_requests_accepted" : num_of_requests_accepted,
            "num_of_requests_completed" : num_of_requests_completed,
            "sum_of_amount" : sum_of_amount,
            "hospital" : hospital[0]
        }
        return render(request, "hospital/dashboard.html", context)
    
    elif request.method == "POST":
        bloodgroup, amount = [ request.POST.get("bloodgroup"), request.POST.get("amount"), ]
        user = User.objects.get(username=request.user.username)
        hospital = Hospital.objects.get(user=user)
        request_date = datetime.today().strftime('%Y-%m-%d')
        req = Request(hospital=hospital, request_date=request_date, blood_group=bloodgroup, amount=amount)
        req.save()
        return redirect("/hospital/dashboard/")
    else:
        raise PermissionDenied

