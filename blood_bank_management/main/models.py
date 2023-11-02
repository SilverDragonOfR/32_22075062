from django.db import models
from django.contrib.auth.models import AbstractUser, BaseUserManager, PermissionsMixin

# Create your models here.
class City(models.Model):
    city_name = models.CharField(max_length=100)
    latitude = models.DecimalField(max_digits=6, decimal_places=1)
    longitude = models.DecimalField(max_digits=6, decimal_places=1)
    state = models.CharField(max_length=50)

    def __str__(self):
        return self.city_name

class User(AbstractUser):
    email = models.EmailField(unique=True)
    is_donor = models.BooleanField(default=False)
    is_bloodbank = models.BooleanField(default=False)
    is_hospital = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']

class PasswordToken(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    forgot_password_token = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    