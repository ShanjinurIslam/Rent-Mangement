from django.db import models

# Create your models here.
class House(models.Model):
    name = models.CharField(max_length=100)
    address_line_1 = models.TextField(max_length=250)
    address_line_2 = models.TextField(max_length=250,blank=True)
    city = models.CharField(max_length=100)
    country = models.CharField(max_length=100)
    zipcode = models.CharField(max_length=100)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name

class Flat(models.Model):
    name = models.CharField(max_length=100)
    created = models.DateTimeField(auto_now_add=True)
    house = models.ForeignKey(House,on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class VacancyStatus(models.Model):
    status = models.BooleanField()
    flat = models.ForeignKey(Flat,on_delete=models.CASCADE)

    def __str__(self):
        return self.flat.name + '_' + str(self.status)

class Renter(models.Model):
    name = models.CharField(max_length=100)
    nid = models.CharField(max_length=100,blank=True)
    passport = models.CharField(max_length=100,blank=True)
    #image = models.ImageField()
    email = models.CharField(max_length=100,blank=True)
    mobile = models.CharField(max_length=100)
    nationality = models.CharField(max_length=100)
    gender = models.CharField(max_length=100)
    address_line_1 = models.TextField(max_length=250)
    address_line_2 = models.TextField(max_length=250,blank=True)
    city = models.CharField(max_length=100)
    country = models.CharField(max_length=100)
    zipcode = models.CharField(max_length=100)
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
