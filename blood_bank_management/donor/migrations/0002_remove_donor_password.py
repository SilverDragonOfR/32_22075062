# Generated by Django 4.2.3 on 2023-10-28 14:12

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ("donor", "0001_initial"),
    ]

    operations = [
        migrations.RemoveField(
            model_name="donor",
            name="password",
        ),
    ]