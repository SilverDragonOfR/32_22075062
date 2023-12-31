# Generated by Django 4.2.3 on 2023-10-28 12:53

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    initial = True

    dependencies = [
        ("donor", "__first__"),
        ("main", "__first__"),
    ]

    operations = [
        migrations.CreateModel(
            name="BloodBank",
            fields=[
                (
                    "user",
                    models.OneToOneField(
                        default=None,
                        on_delete=django.db.models.deletion.CASCADE,
                        primary_key=True,
                        related_name="bloodbank",
                        serialize=False,
                        to=settings.AUTH_USER_MODEL,
                    ),
                ),
                ("bloodbank_name", models.CharField(max_length=100)),
                ("address", models.CharField(max_length=200)),
                ("pincode", models.CharField(max_length=6)),
                ("employees", models.IntegerField()),
                ("phone", models.CharField(max_length=10)),
                ("is_verified", models.BooleanField(default=False)),
                ("password", models.CharField(max_length=100)),
                ("manager_name", models.CharField(max_length=100)),
                ("a_neg", models.IntegerField()),
                ("a_pos", models.IntegerField()),
                ("b_neg", models.IntegerField()),
                ("b_pos", models.IntegerField()),
                ("ab_neg", models.IntegerField()),
                ("ab_pos", models.IntegerField()),
                ("o_neg", models.IntegerField()),
                ("o_pos", models.IntegerField()),
                (
                    "city",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="main.city"
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Donation",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("donation_date", models.DateField()),
                ("amount", models.IntegerField()),
                (
                    "blood_group",
                    models.CharField(
                        choices=[
                            ("A+", "A+"),
                            ("B+", "B+"),
                            ("AB+", "AB+"),
                            ("O+", "O+"),
                            ("A-", "A-"),
                            ("B-", "B-"),
                            ("AB-", "AB-"),
                            ("O-", "O-"),
                        ],
                        max_length=3,
                    ),
                ),
                ("pct_contamination", models.IntegerField()),
                ("glucose", models.IntegerField()),
                ("platelet_count", models.IntegerField()),
                (
                    "info",
                    models.CharField(
                        choices=[
                            ("Good", "Good"),
                            ("Normal", "Normal"),
                            ("Bad", "Bad"),
                        ],
                        max_length=10,
                    ),
                ),
                (
                    "bloodbank",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="bloodbank.bloodbank",
                    ),
                ),
                (
                    "donor",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="donor.donor"
                    ),
                ),
            ],
        ),
        migrations.CreateModel(
            name="Camp",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=100)),
                ("start_date", models.DateField()),
                ("end_date", models.DateField(null=True)),
                ("address", models.CharField(max_length=200)),
                ("pincode", models.CharField(max_length=6)),
                (
                    "bloodbank",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="bloodbank.bloodbank",
                    ),
                ),
                (
                    "city",
                    models.ForeignKey(
                        on_delete=django.db.models.deletion.CASCADE, to="main.city"
                    ),
                ),
            ],
        ),
    ]
