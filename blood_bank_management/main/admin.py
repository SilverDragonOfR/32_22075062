from django.contrib import admin
from .models import City, User, PasswordToken

# Register your models here.
admin.site.register([City, User, PasswordToken])