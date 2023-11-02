from django.contrib import admin
from .models import Hospital, Request

# Register your models here.
admin.site.register([Hospital, Request])