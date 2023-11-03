from django.shortcuts import render, redirect
from django.contrib.auth import get_user_model
from django.core.exceptions import PermissionDenied, BadRequest
from main.decorators import donor_required
from .models import Donor
from main.models import City
from bloodbank.models import Donation
from django.contrib.auth import login as django_login
from datetime import date, datetime
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
        return render(request, "donor/signup.html", context)
    elif request.method == "POST":
        name, blood_group, date_of_birth, gender, city_name , phone, email, password = [ request.POST.get("name"), request.POST.get("bloodgroup"), request.POST.get("birthday"), request.POST.get("gender"), request.POST.get("city"), request.POST.get("phone"), request.POST.get("email"), request.POST.get("password"),]
        image = request.FILES["image"]
        if User.objects.filter(username=email):
            cities = City.objects.all().values_list("city_name")
            context = {
                "wrong": True,
                "wrong_text": "Email already exists",
                "cities": cities
            }
            return render(request, "donor/signup.html", context)
        user = User(username=email, email=email, is_donor=True)
        user.set_password(password)
        city = City.objects.get(city_name=city_name)
        donor = Donor(user=user, name=name, blood_group=blood_group, date_of_birth=date_of_birth, gender=gender, city=city, phone=phone)
        is_donor_valid, error_msg = donor.validate(current_date=date.today())
        if not is_donor_valid:
            cities = City.objects.all().values_list("city_name")
            context = {
                "wrong": True,
                "wrong_text": error_msg,
                "cities": cities
            }
            return render(request, "donor/signup.html", context)
        user.save()
        donor.save()
        donor.image.save(image.name, image)
        django_login(request, user)
        return redirect("/donor/dashboard/")
    else:
        raise PermissionDenied
    
@donor_required
def dashboard(request):
    user = request.user
    donor = Donor.objects.filter(user=user)
    donations = Donation.objects.filter(donor=donor[0]).order_by("-donation_date")
    donations_new = [donation for donation in donations if not donation.is_seen ]
    donations_old = [donation for donation in donations if donation.is_seen ]
    num_of_donations_new = len(donations_new)
    num_of_donations_old = len(donations_old)
    sum_of_amount = sum([ donation.amount for donation in donations ])
    cities = City.objects.all().values_list("city_name")
    user_dob_str = donor[0].date_of_birth.strftime("%Y-%m-%d")
    context = {
        "donations_new" : donations_new,
        "donations_old" : donations_old,
        "num_of_donations" : num_of_donations_new+num_of_donations_old,
        "num_of_donations_new" : num_of_donations_new,
        "num_of_donations_old" : num_of_donations_old,
        "sum_of_amount" : sum_of_amount,
        "donor" : donor[0],
        "cities": cities,
        "user_dob_str" : user_dob_str
    }
    return render(request, "donor/dashboard.html", context)

@donor_required
def edit_profile(request):
    if request.method == "POST":
        user = request.user
        name, city_name, dob, phone = [ request.POST.get("name"),  request.POST.get("city"), request.POST.get("dob"), request.POST.get("phone"),]
        image = request.FILES["image"]
        city = City.objects.get(city_name=city_name)
        donor = Donor.objects.get(user=user)
        donor.name, donor.city, donor.date_of_birth, donor.phone = name, city, dob, phone
        is_donor_valid, error_msg = donor.validate(current_date=date.today())
        if not is_donor_valid:
            cities = City.objects.all().values_list("city_name")
            context = {
                "wrong": True,
                "wrong_text": error_msg,
                "cities": cities
            }
            return render(request, "donor/signup.html", context)
        donor.save()
        donor.image.save(image.name, image)
        return redirect("/donor/dashboard/")
    else:
        raise PermissionDenied