"""
URL configuration for blood_bank_management project.

The `urlpatterns` list routes URLs to views. For more information please see:
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
from django.urls import path
from .views import signup, dashboard, edit_profile, update_pending_requests, delete_pending_requests

urlpatterns = [
    path("signup/", signup),
    path("dashboard/", dashboard),
    path("edit_profile/", edit_profile),
    path("requests/delete/<str:pk>", delete_pending_requests),
    path("requests/update/<str:pk>", update_pending_requests)
]
