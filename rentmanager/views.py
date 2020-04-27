from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
import random
from .models import House,Flat
from .forms import HouseForm,FlatForm


# Create your views here.
def signinuser(request):
    if request.method == 'GET':
        return render(request, 'rentmanager/signin.html')
    else:
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(request, username=username, password=password)
        if user is None:
            return render(request, 'rentmanager/signin.html', {'error': 'Username or Password didn\'t match'})
        else:
            login(request, user)
            return redirect('home')


@login_required
def home(request):
    data = []
    for i in range(10):
        data.append(tuple((i+1, random.randint(0, 200))))

    return render(request, 'rentmanager/dashboard.html', {'data': data})


@login_required
def logoutuser(request):
    if request.method == 'POST':
        logout(request)
        return redirect('signinuser')


# --------------------------------- house section start ------------------------------------


@login_required
def houses(request):
    houses = House.objects.all()
    return render(request, 'rentmanager/houses/houses.html', {'houses': houses})


@login_required
def createhouse(request):
    if request.method == 'GET':
        form = HouseForm()
        return render(request, 'rentmanager/houses/createhouse.html', {'form': form})
    else:
        try:
            form = HouseForm(request.POST)
            house = form.save(commit=False)
            house.save()
            return redirect('houses')
        except ValueError:
            return render(request, 'rentmanager/houses/createhouse.html', {'form': form, 'error': 'Invalid Value'})


@login_required
def viewhouse(request, house_id):
    house = get_object_or_404(House, pk=house_id)
    if request.method == 'GET':
        form = HouseForm(instance=house)
        return render(request, 'rentmanager/houses/viewhouse.html', {'form': form, 'instance': house})
    else:
        form = HouseForm(request.POST,instance=house)
        form.save()
        return redirect('houses')

@login_required
def deletehouse(request,house_id):        
    house = get_object_or_404(House, pk=house_id)
    
    if request.method == 'POST':
        house.delete()
        return redirect('houses')

# --------------------------------- house section end ------------------------------------

# --------------------------------- flat section start ------------------------------------

@login_required
def flats(request):
    flats = Flat.objects.all()
    return render(request, 'rentmanager/flats/flats.html',{'flats':flats})

@login_required
def createflat(request):
    if request.method == 'GET':
        form = FlatForm()
        return render(request, 'rentmanager/flats/createflat.html', {'form': form})
    else:
        try:
            form = FlatForm(request.POST)
            flat = form.save(commit=False)
            flat.save()
            return redirect('flats')
        except ValueError:
            return render(request, 'rentmanager/flats/createflats.html', {'form': form, 'error': 'Invalid Value'})


@login_required
def viewflat(request, flat_id):
    flat = get_object_or_404(Flat, pk=flat_id)
    if request.method == 'GET':
        form = FlatForm(instance=flat)
        return render(request, 'rentmanager/flats/viewflat.html', {'form': form, 'instance': flat})
    else:
        form = FlatForm(request.POST,instance=flat)
        form.save()
        return redirect('flats')

@login_required
def deleteflat(request,flat_id):        
    flat = get_object_or_404(Flat, pk=flat_id)
    
    if request.method == 'POST':
        flat.delete()
        return redirect('flats')

# --------------------------------- flat section end ------------------------------------

@login_required
def renters(request):
    return render(request, 'rentmanager/renters/renters.html')


@login_required
def rentissues(request):
    return render(request, 'rentmanager/rentissues/rentissues.html')


@login_required
def payments(request):
    return render(request, 'rentmanager/payments/payments.html')


@login_required
def invoices(request):
    return render(request, 'rentmanager/invoices/invoices.html')
