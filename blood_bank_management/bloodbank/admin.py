from django.contrib import admin
from .models import BloodBank, Camp, Donation

# Register your models here.
admin.site.register([BloodBank, Camp, Donation])