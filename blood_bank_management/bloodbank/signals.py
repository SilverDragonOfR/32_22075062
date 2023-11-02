from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Donation, BloodBank

@receiver(post_save, sender=Donation)
def update_amount_blood(sender, instance, **kwargs):
    bloodbank = instance.bloodbank
    blood_group = instance.blood_group
    amount = instance.amount

    if blood_group == "A+":
        bloodbank.a_pos += amount
    elif blood_group == "A-":
        bloodbank.a_neg += amount
    elif blood_group == "B+":
        bloodbank.b_pos += amount
    elif blood_group == "B-":
        bloodbank.b_neg += amount
    elif blood_group == "AB+":
        bloodbank.ab_pos += amount
    elif blood_group == "AB-":
        bloodbank.ab_neg += amount
    elif blood_group == "O+":
        bloodbank.o_pos += amount
    elif blood_group == "O-":
        bloodbank.o_neg += amount

    bloodbank.save()