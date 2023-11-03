# Generated by Django 4.2.3 on 2023-11-02 17:02

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("donor", "0005_donor_image"),
    ]

    operations = [
        migrations.AlterField(
            model_name="donor",
            name="image",
            field=models.ImageField(
                default="/static/images/dummy-avatar.jpg", upload_to="signup/"
            ),
        ),
    ]
