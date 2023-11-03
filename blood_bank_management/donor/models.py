from django.db import models
from main.models import City, User
from datetime import datetime
from django.contrib.staticfiles.storage import staticfiles_storage

# Options
GENDER_CHOICES = [("M", "M"), ("F", "F")]
BLOOD_GROUP_CHOICES = [("A+", "A+"), ("B+", "B+"), ("AB+", "AB+"), ("O+", "O+"), ("A-", "A-"), ("B-", "B-"), ("AB-", "AB-"), ("O-", "O-"),]

# Create your models here.
class Donor(models.Model):

    # Creating table
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, related_name='donor', default=None)
    name = models.CharField(max_length=100)
    image = models.ImageField(upload_to='signup/', default=None)
    blood_group = models.CharField(max_length=3, choices=BLOOD_GROUP_CHOICES)
    date_of_birth = models.DateField()
    gender = models.CharField(max_length=6, choices=GENDER_CHOICES)
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    phone = models.CharField(max_length=10)
    
    def validate(self, current_date):
        is_validate = True
        error_msg = None
        if len(str(self.phone))!=10:
            is_validate = False
            error_msg = "Phone number must contain 10 digits"
        dob = datetime.strptime(self.date_of_birth, '%Y-%m-%d').date()
        age = current_date.year - dob.year - ((current_date.month, current_date.day) < (dob.month, dob.day))
        if age<18:
            is_validate = False
            error_msg = "Age must not be less than 18 years"

        return (is_validate, error_msg)
        

    def __str__(self):
        return self.name
    
