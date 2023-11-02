"""
URL configuration for blood_bank_management project.

The urlpatterns list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from .views import post_seen_update, post_like_update, get_bloodcamps_by_city, post_cities_by_distance, health, notauthenticated, notfound, get_donor_profile, update_donor_is_verified, get_donor_history, get_donor_bloodbanks, get_bloodbank_profile, get_bloodbank_donations, get_bloodbank_camps, post_bloodbank_camps, delete_bloodbank_camps, update_bloodbank_camps

urlpatterns = [
    path("", health),
    path("notfound/", notfound),
    path("notauthenticated/", notauthenticated),
    path("cities_by_distance/", post_cities_by_distance), 
    path("bloodcamps_by_city/<int:pk>", get_bloodcamps_by_city), 

    # donor path
    path("donor/", get_donor_profile),
    path("donor/history", get_donor_history),
    path("donor/verification_update", update_donor_is_verified),
    path("donor/bloodbanks", get_donor_bloodbanks),

    # donation path
    path("donation/post_like_update", post_like_update),
    path("donation/post_seen_update", post_seen_update),

    # bloodbank path
    path("bloodbank/", get_bloodbank_profile),
    path("bloodbank/donations", get_bloodbank_donations),
    path("bloodbank/camps/", get_bloodbank_camps),
    path("bloodbank/camps/create", post_bloodbank_camps),
    path("bloodbank/camps/update/<int:pk>", update_bloodbank_camps),
    path("bloodbank/camps/delete/<int:pk>", delete_bloodbank_camps),
]