# Generated by Django 4.2.3 on 2023-11-01 20:30

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("bloodbank", "0005_donation_is_seen"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="bloodbank",
            name="is_verified",
        ),
    ]