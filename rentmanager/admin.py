from django.contrib import admin
from .models import House,Flat,VacancyStatus,Renter


# Register your models here.
admin.site.register(House)
admin.site.register(Flat)
admin.site.register(VacancyStatus)
admin.site.register(Renter)
