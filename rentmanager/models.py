from django.db import models
from django.utils import timezone
# Create your models here.


class House(models.Model):
    name = models.CharField(max_length=100)
    address_line_1 = models.TextField(max_length=250)
    address_line_2 = models.TextField(max_length=250, blank=True)
    city = models.CharField(max_length=100)
    country = models.CharField(max_length=100)
    zipcode = models.CharField(max_length=100)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name


class Flat(models.Model):
    floor_choices = (
        (1, '1'),
        (2, '2'),
        (3, '3'),
        (4, '4'),
        (5, '5'),
        (6, '6'),
        (7, '7'),
        (8, '8'),
        (9, '9'),
    )
    name = models.CharField(max_length=100)
    floor = models.IntegerField(choices=floor_choices,default=1)
    vacancy_status = models.BooleanField(default=True)
    created = models.DateTimeField(auto_now_add=True)
    house = models.ForeignKey(House, on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class Renter(models.Model):
    MALE = 'Male'
    FEMALE = 'Female'
    OTHER = 'Other'
    gender_choices = (
        (MALE, 'Male'),
        (FEMALE, 'Female'),
        (OTHER, 'Other'),
    )
    name = models.CharField(max_length=100,default='')
    nid = models.CharField(max_length=100, blank=True)
    passport = models.CharField(max_length=100, blank=True)
    #image = models.ImageField()
    email = models.CharField(max_length=100, blank=True)
    mobile = models.CharField(max_length=100)
    nationality = models.CharField(max_length=100)
    gender = models.CharField(
        max_length=100, choices=gender_choices, default='Select Gender')
    address_line_1 = models.TextField(max_length=250)
    address_line_2 = models.TextField(max_length=250, blank=True)
    city = models.CharField(max_length=100)
    country = models.CharField(max_length=100)
    zipcode = models.CharField(max_length=100)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name



class RentIssue(models.Model):
    name = models.CharField(max_length=100,default='')
    flat = models.ForeignKey(Flat,on_delete=models.CASCADE)
    renter = models.ForeignKey(Renter, on_delete=models.CASCADE)
    start_date = models.DateField(auto_now=False, auto_now_add=False)
    rent = models.IntegerField(default=10000)
    created = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.name


class Invoice(models.Model):

    Months = (('January','January'),
    (('February','February')),
    (('March','March')),
    (('April','April')),
    (('May','May')),
    (('June','June')),
    (('July','July')),
    (('August','August')),
    (('September','September')),
    (('October','October')),
    (('November','November')),
    (('December','December')),
    
    )

    name = models.CharField(default='',max_length=100)
    rent_issue = models.ForeignKey(RentIssue,on_delete=models.CASCADE)
    month = models.CharField(default='January',choices=Months,max_length=100)
    year = models.IntegerField(default=2020)
    electricity_bill = models.IntegerField(default=0)
    gas_bill = models.IntegerField(default=0)
    water_bill = models.IntegerField(default=0)
    service_charge = models.IntegerField(default=0)
    paid = models.BooleanField(default=False)
    total_payable = models.FloatField(default=0)
    created = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name


class Payment(models.Model):

    payment_types = (('Cash','Cash'),('Cheque','Cheque'))

    name = models.CharField(max_length=50)
    invoice = models.ForeignKey(Invoice,on_delete=models.CASCADE)
    payment_type = models.CharField(choices=payment_types, max_length=50)
    bank_name = models.CharField(blank=True, max_length=50)
    cheque_number = models.CharField(blank=True, max_length=50)
    paid_amount = models.IntegerField(default=0)
    due_amount = models.IntegerField(default=0,blank=True)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
