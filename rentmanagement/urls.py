"""rentmanagement URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from rentmanager import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',views.signinuser,name='signinuser'),
    path('home/', views.home,name='home'),
    path('logout/',views.logoutuser,name='logoutuser'),
    path('houses/',views.houses,name='houses'),
    path('createhouse/',views.createhouse,name='createhouse'),
    path('house/<int:house_id>',views.viewhouse,name='viewhouse'),
    path('deletehouse/<int:house_id>',views.deletehouse,name='deletehouse'),

    path('flats/',views.flats,name='flats'),
    path('createflat/',views.createflat,name='createflat'),
    path('flat/<int:flat_id>',views.viewflat,name='viewflat'),
    path('deleteflat/<int:flat_id>',views.deleteflat,name='deleteflat'),

    path('renters/',views.renters,name='renters'),
    path('createrenter/',views.createrenter,name='createrenter'),
    path('renter/<int:renter_id>',views.viewrenter,name='viewrenter'),
    path('deleterenter/<int:renter_id>',views.deleterenter,name='deleterenter'),

    path('rentissues/',views.rentissues,name='rentissues'),
    path('createrentissue/',views.createrentissue,name='createrentissue'),
    path('rentissue/<int:rentissue_id>',views.viewrentissue,name='viewrentissue'),
    path('deleterentissue/<int:rentissue_id>',views.deleterentissue,name='deleterentissue'),

    path('invoices/',views.invoices,name='invoices'),
    path('createinvoice/',views.createinvoice,name='createinvoice'),
    path('invoice/<int:invoice_id>',views.viewinvoice,name='viewinvoice'),
    path('deleteinvoice/<int:invoice_id>',views.deleteinvoice,name='deleteinvoice'),

    path('payments/',views.payments,name='payments'),
    path('createpayment/',views.createpayment,name='createpayment'),
    path('payment/<int:payment_id>',views.viewpayment,name='viewpayment'),
    path('deletepayment/<int:payment_id>',views.deletepayment,name='deletepayment'),
]
