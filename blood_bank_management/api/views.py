from django.shortcuts import render
from django.core.exceptions import PermissionDenied
from django.http import JsonResponse
from rest_framework.response import Response
from main.decorators import api_authenticated_required, donor_required, bloodbank_required
from donor.models import Donor
from bloodbank.models import Donation, BloodBank, Camp
from main.models import User, City
import json, math
from rest_framework.decorators import api_view
from django.db.models import FloatField, Value, F
from .serializer import CitySerializer, DonorSerializer, DonationSerializerForDonor, BloodBankSerializer, DonationSerializerForBloodBank, CampSerializer

# Create your views here.

# Test APIs
def notfound(request):
    return JsonResponse({"status" : "not found", "code" : 404})

def notauthenticated(request):
    return JsonResponse({"status" : "not authenticated", "code" : 401})

@api_authenticated_required
def health(request):
    return JsonResponse({"status" : "healthy", "code" : 200})

# Helper Functions
def get_distance(city_lat, city_lon, user_lat, user_lon):
    return ((float(city_lat)-float(user_lat))**2+(float(city_lon)-float(user_lon))**2)**0.5

def getDistanceFromLatLonInKm(city_lat, city_lon, user_lat, user_lon):
    city_lat, city_lon, user_lat, user_lon = float(city_lat), float(city_lon), float(user_lat), float(user_lon)
    R = 6371
    dLat = deg2rad(user_lat-city_lat)
    dLon = deg2rad(user_lon-city_lon)
    a = math.sin(dLat/2) * math.sin(dLat/2) + math.cos(deg2rad(city_lat)) * math.cos(deg2rad(user_lat)) * math.sin(dLon/2) * math.sin(dLon/2)
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a))
    d = R * c
    return d

def deg2rad(deg):
    return deg * (math.pi/180)

# Main APIs
@api_view(['POST'])
def post_cities_by_distance(request):
    body = request.data
    user_lat, user_lon = body[0]["user_lat"], body[0]["user_lon"]
    citys = City.objects.filter()
    citys = sorted(citys, key=lambda city: getDistanceFromLatLonInKm(city.latitude, city.longitude, user_lat, user_lon))
    serializer = CitySerializer(citys, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_bloodcamps_by_city(request, pk):
    city = City.objects.filter(pk=pk)
    camps = Camp.objects.filter(city=city[0])
    serializer = CampSerializer(camps, many=True)
    return Response(serializer.data)

# Donor APIs
@api_authenticated_required
@donor_required
@api_view(['GET'])
def get_donor_profile(request):
    donor = Donor.objects.filter(user=request.user)
    serializer = DonorSerializer(donor, many=True)
    return Response(serializer.data)

@api_authenticated_required
@donor_required
@api_view(['POST'])
def post_like_update(request):
    body = request.data
    pk = body[0]["pk"]
    donation = Donation.objects.get(pk=pk)
    donation.is_liked = not donation.is_liked
    donation.save()
    return Response({"is_liked" : donation.is_liked})

@api_authenticated_required
@donor_required
@api_view(['POST'])
def post_seen_update(request):
    body = request.data
    pk = body[0]["pk"]
    donation = Donation.objects.get(pk=pk)
    donation.is_seen = True
    donation.save()
    return Response({"is_seen" : donation.is_seen})

@api_authenticated_required
@donor_required
@api_view(['GET'])
def get_donor_history(request):
    donor = Donor.objects.filter(user=request.user)
    donations = Donation.objects.filter(donor=donor[0])
    serializer = DonationSerializerForDonor(donations, many=True)
    return Response(serializer.data)

@api_authenticated_required
@donor_required
@api_view(['GET'])
def get_donor_bloodbanks(request):
    bloodbanks = BloodBank.objects.filter()
    serializer = BloodBankSerializer(bloodbanks, many=True)
    return Response(serializer.data)

# BloodBank APIs
@api_authenticated_required
@bloodbank_required
@api_view(['GET'])
def get_bloodbank_profile(request):
    bloodbank = BloodBank.objects.filter(user=request.user)
    serializer = BloodBankSerializer(bloodbank, many=True)
    return Response(serializer.data)

@api_authenticated_required
@bloodbank_required
@api_view(['GET'])
def get_bloodbank_donations(request):
    bloodbank = BloodBank.objects.filter(user=request.user)
    donations = Donation.objects.filter(bloodbank=bloodbank[0])
    serializer = DonationSerializerForBloodBank(donations, many=True)
    return Response(serializer.data)

@api_authenticated_required
@bloodbank_required
@api_view(['GET'])
def get_bloodbank_camps(request):
    bloodbank = BloodBank.objects.filter(user=request.user)
    camps = Camp.objects.filter(bloodbank=bloodbank[0])
    serializer = CampSerializer(camps, many=True)
    return Response(serializer.data)

@api_authenticated_required
@bloodbank_required
@api_view(['POST'])
def post_bloodbank_camps(request):
    body = request.data
    bloodbank = BloodBank.objects.filter(user=request.user)
    city = City.objects.filter(city_name=body[0]["city_name"])
    camps = Camp.objects.filter()
    camp = camps.create(name=body[0]["name"], bloodbank=bloodbank[0], start_date=body[0]["start_date"], end_date=body[0]["end_date"], city=city[0], address=body[0]["address"], pincode=body[0]["pincode"])
    serializer = CampSerializer(camp, many=True)
    return Response(serializer.data)

@api_authenticated_required
@bloodbank_required
@api_view(['DELETE'])
def delete_bloodbank_camps(request, pk):
    camp = Camp.objects.filter(pk=pk)
    camp.delete()
    serializer = CampSerializer(camp, many=True)
    return Response(serializer.data)

@api_authenticated_required
@bloodbank_required
@api_view(['PUT'])
def update_bloodbank_camps(request, pk):
    body = json.loads(request.body)
    camp = Camp.objects.filter(pk=pk)
    bloodbank = BloodBank.objects.filter(user=request.user)
    city = City.objects.filter(city_name=body[0]["city_name"])
    camp.update(name=body[0]["name"], bloodbank=bloodbank[0], start_date=body[0]["start_date"], end_date=body[0]["end_date"], city=city[0], address=body[0]["address"], pincode=body[0]["pincode"])
    serializer = CampSerializer(camp, many=True)
    return Response(serializer.data)

@api_authenticated_required
@bloodbank_required
@api_view(['PUT'])
def update_donor_is_verified(request):
    body = json.loads(request.body)
    user = User.objects.filter(email=body[0]["email"])
    donor = Donor.objects.filter(user=user)
    donor.update(is_verified=body[0]["is_verified"])
    serializer = DonorSerializer(donor, many=True)
    return Response(serializer.data)