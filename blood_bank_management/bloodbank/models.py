from django.db import models
from main.models import City, User
from donor.models import Donor
from datetime import date, datetime

# Options
BLOOD_GROUP_CHOICES = [("A+", "A+"), ("B+", "B+"), ("AB+", "AB+"), ("O+", "O+"), ("A-", "A-"), ("B-", "B-"), ("AB-", "AB-"), ("O-", "O-")]
INFO_CHOICES = [("Good", "Good"), ("Normal", "Normal"), ("Bad", "Bad")]

# Create your models here.

class BloodBank(models.Model):

    # Creating table
    user = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True, related_name='bloodbank', default=None)
    bloodbank_name = models.CharField(max_length=100)
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    address = models.CharField(max_length=200)
    pincode = models.CharField(max_length=6)
    employees = models.IntegerField()
    phone = models.CharField(max_length=10)
    manager_name = models.CharField(max_length=100)
    a_neg = models.IntegerField(default=0)
    a_pos = models.IntegerField(default=0)
    b_neg = models.IntegerField(default=0)
    b_pos = models.IntegerField(default=0)
    ab_neg = models.IntegerField(default=0)
    ab_pos = models.IntegerField(default=0)
    o_neg = models.IntegerField(default=0)
    o_pos = models.IntegerField(default=0)

    def validate(self):
        is_validate = True
        error_msg = None
        if len(str(self.phone))!=10:
            is_validate = False
            error_msg = "Phone number must contain 10 digits"
        if len(str(self.pincode))!=6:
            is_validate = False
            error_msg = "Pincode must contain 6 digits"
        if int(self.employees)<=0:
            is_validate = False
            error_msg = "Number of employees must be more than 1"
        if int(self.a_pos)<0 or int(self.a_neg)<0 or int(self.b_pos)<0 or int(self.b_neg)<0 or int(self.ab_pos)<0 or int(self.ab_neg)<0 or int(self.o_pos)<0 or int(self.o_neg)<0:
            is_validate = False
            error_msg = "Blood must be positive"

        return (is_validate, error_msg)

    def _str_(self):
        return self.bloodbank_name
    
class Camp(models.Model):

# Creating table
    name = models.CharField(max_length=100)
    bloodbank = models.ForeignKey(BloodBank, on_delete=models.CASCADE)
    start_date = models.DateField()
    end_date = models.DateField(null=True)
    city = models.ForeignKey(City, on_delete=models.CASCADE)
    address = models.CharField(max_length=200)
    pincode = models.CharField(max_length=6)

    def validate(self):
        is_validate = True
        error_msg = None
        startdate = datetime.strptime(self.start_date, '%Y-%m-%d').date()
        if len(str(self.pincode))!=6:
            is_validate = False
            error_msg = "Pincode must contain 6 digits"
        if self.end_date and self.end_date < self.start_date:
            is_validate = False
            error_msg = "End date must be after Start date"
        if startdate < date.today():
            is_validate = False
            error_msg = "Start date must be later than yesterday"

        return (is_validate, error_msg)
        
    def _str_(self):
        return self.name
    
class Donation(models.Model):
    donor = models.ForeignKey(Donor, on_delete=models.CASCADE)
    bloodbank = models.ForeignKey(BloodBank, on_delete=models.CASCADE)
    donation_date = models.DateField()
    amount = models.IntegerField()
    blood_group = models.CharField(max_length=3, choices=BLOOD_GROUP_CHOICES)
    pct_contamination = models.IntegerField()
    glucose = models.IntegerField()
    platelet_count = models.IntegerField()
    info = models.CharField(max_length=10, choices=INFO_CHOICES)
    is_liked = models.BooleanField(default=False)
    is_seen = models.BooleanField(default=False)

    def validate(self):
        is_validate = True
        error_msg = None
        donationdate = datetime.strptime(self.donation_date, '%Y-%m-%d').date()
        if donationdate > date.today() :
            is_validate = False
            error_msg = "Invalid date"
        if self.amount<0:
            is_validate = False
            error_msg = "Amount cannot be negetive"
        if self.pct_contamination<0 or self.pct_contamination>100:
            is_validate = False
            error_msg = "Percent contamination should be from 0-100"
        if self.glucose<0:
            is_validate = False
            error_msg = "Glucose cannot be negetive"
        if self.platelet_count<0:
            is_validate = False
            error_msg = "Platelet count cannot be negetive"

        return (is_validate, error_msg)       
        
    def _str_(self):
        return f"{self.donor} @ {self.bloodbank} | {self.donation_date}"