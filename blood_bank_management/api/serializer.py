from rest_framework import serializers
from donor.models import Donor
from bloodbank.models import Donation, BloodBank, Camp
from main.models import City

class CitySerializer(serializers.ModelSerializer):

    class Meta:
        model = City
        fields = ("pk", "city_name", "latitude", "longitude", "state")

class CitySerializer_name(serializers.ModelSerializer):

    class Meta:
        model = City
        fields = ("city_name",)

class DonorSerializer(serializers.ModelSerializer):

    city = CitySerializer_name()

    class Meta:
        model = Donor
        fields = ('user','name', "blood_group", "date_of_birth", "gender", "city", "phone", "is_verified")

class BloodBankSerializer(serializers.ModelSerializer):

    city = CitySerializer_name()

    class Meta:
        model = BloodBank
        fields = ("user", "bloodbank_name", "city", "address", "pincode", "employees", "phone", "is_verified", "manager_name", "a_neg", "a_pos", "b_neg", "b_pos", "ab_neg", "ab_pos", "o_neg", "o_pos")

class BloodBankSerializer_name_city(serializers.ModelSerializer):

    city = CitySerializer_name()

    class Meta:
        model = BloodBank
        fields = ("bloodbank_name", "city")

class DonationSerializerForDonor(serializers.ModelSerializer):

    bloodbank = BloodBankSerializer_name_city()

    class Meta:
        model = Donation
        fields = ("bloodbank", "donation_date", "amount", "blood_group", "pct_contamination", "glucose", "platelet_count", "info")

class DonationSerializerForBloodBank(serializers.ModelSerializer):

    donor = DonorSerializer()

    class Meta:
        model = Donation
        fields = ("donor", "donation_date", "amount", "blood_group", "pct_contamination", "glucose", "platelet_count", "info")

class CampSerializer(serializers.ModelSerializer):

    city = CitySerializer_name()

    class Meta:
        model = Camp
        fields = ("name", "start_date", "end_date", "city", "address", "pincode")