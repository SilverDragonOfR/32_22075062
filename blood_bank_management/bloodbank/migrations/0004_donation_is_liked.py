# Generated by Django 4.2.3 on 2023-10-31 17:28

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("bloodbank", "0003_alter_bloodbank_a_neg_alter_bloodbank_a_pos_and_more"),
    ]

    operations = [
        migrations.AddField(
            model_name="donation",
            name="is_liked",
            field=models.BooleanField(default=False),
        ),
    ]