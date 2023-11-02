from django.core.mail import send_mail
from django.conf import settings

def send_forgot_password_mail(email, token):
    subject = "Your forgot password link"
    message = f"Hello there from DonorDash, \nClick on this link to reset your password http://localhost:8000/changepassword/{token}"
    email_from = settings.EMAIL_HOST_USER
    recipient_list = [email]
    send_mail(subject, message, email_from, recipient_list)
    return True