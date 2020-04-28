from django.contrib import admin
from .models import House,Flat,Renter,RentIssue,Invoice,Payment


# Register your models here.
admin.site.register(House)
admin.site.register(Flat)
admin.site.register(Renter)
admin.site.register(RentIssue)
admin.site.register(Invoice)
admin.site.register(Payment)
