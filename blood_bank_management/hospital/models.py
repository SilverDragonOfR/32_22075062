from django.db import models
from main.models import City, User
from bloodbank.models import BloodBank
from django.core.exceptions import ValidationError
from datetime import date, datetime

BLOOD_GROUP_CHOICES = [("A+", "A+"), ("B+", "B+"), ("AB+", "AB+"), ("O+", "O+"), ("A-", "A-"), ("B-", "B-"), ("AB-", "AB-"), ("O-", "O-"),]

# Create your models here.
class Hospital(models.Model):

    # Creating table
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, related_name='hospital', default=None)
    name = models.CharField(max_length=100)
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    address = models.CharField(max_length=200)
    phone = models.CharField(max_length=10)
    pincode = models.CharField(max_length=6)
    employees = models.IntegerField()

    def validate(self):
        is_validate = True
        error_msg = None
        if len(str(self.phone))!=10:
            is_validate = False
            error_msg = "Phone number must contain 10 digits"
        if len(str(self.pincode))!=6:
            is_validate = False
            error_msg = "Pincode must contain 6 digits"
        if len(self.employees)<=0:
            is_validate = False
            error_msg = "Number of employees must be more than 1"

        return (is_validate, error_msg)
        

    def _str_(self):
        return self.name
    
class Request(models.Model):

    # Creating table
    hospital = models.ForeignKey(Hospital, on_delete=models.CASCADE)
    request_date = models.DateField()
    expected_arrival_date = models.DateField(default=None, blank=True, null=True)
    blood_group = models.CharField(max_length=3, choices=BLOOD_GROUP_CHOICES)
    amount = models.IntegerField()
    is_accepted = models.BooleanField(default=False)
    blood_bank = models.ForeignKey(BloodBank, on_delete=models.CASCADE, default=None, blank=True ,null=True)

    def validate(self):
        is_validate = True
        error_msg = None
        arrivaldate = datetime.strptime(self.expected_arrival_date, '%Y-%m-%d').date()
        if arrivaldate < date.today():
            is_validate = False
            error_msg = "Date shouldn't be earlier than today"
        if self.amount<0:
            is_validate = False
            error_msg = "Amount cannot be negetive"
        
        return (is_validate, error_msg) 

    def str(self):
        return f"{self.hospital} | {self.request_date}"