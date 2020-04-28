from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from .models import House,Flat,Renter,RentIssue,Invoice,Payment
from .forms import HouseForm,FlatForm,RenterForm,RentIssueForm,InvoiceForm,PaymentForm


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
    flats = Flat.objects.all()
    rentissues = RentIssue.objects.all()
    invoices = Invoice.objects.filter(paid=False).order_by('-created')
    return render(request, 'rentmanager/dashboard.html', {'rentissues':rentissues,'invoices':invoices,'flats':flats})


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
            flat.name = flat.name + " " + str(flat.house)
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
# --------------------------------- renter section end ------------------------------------


@login_required
def renters(request):
    renters = Renter.objects.all()
    return render(request, 'rentmanager/renters/renters.html',{'renters':renters})

@login_required
def createrenter(request):
    if request.method == 'GET':
        form = RenterForm()
        return render(request, 'rentmanager/renters/createrenter.html', {'form': form})
    else:
        try:
            form = RenterForm(request.POST)
            renter = form.save(commit=False)
            renter.save()
            return redirect('renters')
        except ValueError:
            return render(request, 'rentmanager/renters/createrenters.html', {'form': form, 'error': 'Invalid Value'})


@login_required
def viewrenter(request, renter_id):
    renter = get_object_or_404(Renter, pk=renter_id)
    if request.method == 'GET':
        form = RenterForm(instance=renter)
        return render(request, 'rentmanager/renters/viewrenter.html', {'form': form, 'instance': renter})
    else:
        form = RenterForm(request.POST,instance=renter)
        form.save()
        return redirect('renters')

@login_required
def deleterenter(request,renter_id):        
    renter = get_object_or_404(Renter, pk=renter_id)
    
    if request.method == 'POST':
        renter.delete()
        return redirect('renters')

# --------------------------------- renter section end ------------------------------------
# --------------------------------- rentissue section start ------------------------------------


@login_required
def rentissues(request):
    rentissues = RentIssue.objects.all()
    return render(request, 'rentmanager/rentissues/rentissues.html',{'rentissues':rentissues})

@login_required
def createrentissue(request):
    if request.method == 'GET':
        form = RentIssueForm()
        return render(request, 'rentmanager/rentissues/createrentissue.html', {'form': form})
    else:
        try:
            form = RentIssueForm(request.POST)
            rentissue = form.save(commit=False)

            flat = get_object_or_404(Flat,name=str(rentissue.flat))
            flat.vacancy_status = False
            flat.save()

            rentissue.name = str(rentissue.flat) + "_" + str(rentissue.renter) + "_" + str(rentissue.rent)
            rentissue.save()
            return redirect('rentissues')
        except ValueError:
            return render(request, 'rentmanager/rentissues/createrentissue.html', {'form': form, 'error': 'Invalid Value'})


@login_required
def viewrentissue(request, rentissue_id):
    rentissue = get_object_or_404(RentIssue, pk=rentissue_id)
    if request.method == 'GET':
        form = RentIssueForm(instance=rentissue)
        return render(request, 'rentmanager/rentissues/viewrentissue.html', {'form': form, 'instance': rentissue})
    else:
        form = RentIssueForm(request.POST,instance=rentissue)
        form.save()
        return redirect('rentissues')

@login_required
def deleterentissue(request,rentissue_id):        
    rentIssue = get_object_or_404(RentIssue, pk=rentissue_id)
    
    if request.method == 'POST':
        flat = get_object_or_404(Flat,name=str(rentIssue.flat))
        flat.vacancy_status = True
        flat.save()
        rentIssue.delete()
        return redirect('rentissues')

# --------------------------------- rentissue section start ------------------------------------



@login_required
def invoices(request):
    invoices = Invoice.objects.all()
    return render(request, 'rentmanager/invoices/invoices.html',{'invoices':invoices})


@login_required
def createinvoice(request):
    if request.method == 'GET':
        form = InvoiceForm()
        return render(request, 'rentmanager/invoices/createinvoice.html', {'form': form})
    else:
        try:
            form = InvoiceForm(request.POST)
            invoice = form.save(commit=False)

            rentissue = get_object_or_404(RentIssue,name=str(invoice.rent_issue))
            invoice.total_payable = float(rentissue.rent) + invoice.electricity_bill + invoice.gas_bill + invoice.water_bill + invoice.service_charge
            invoice.name = str(rentissue.name) + " " + invoice.month + ' ' + str(invoice.year)
            invoice.save()


            return redirect('invoices')
        except ValueError:
            return render(request, 'rentmanager/invoices/createinvoice.html', {'form': form, 'error': 'Invalid Value'})


@login_required
def viewinvoice(request, invoice_id):
    invoice = get_object_or_404(Invoice, pk=invoice_id)
    if request.method == 'GET':
        form = InvoiceForm(instance=invoice)
        return render(request, 'rentmanager/invoices/viewinvoice.html', {'form': form, 'instance': invoice})
    else:
        form = InvoiceForm(request.POST,instance=invoice)
        invoice = form.save(commit=False)
        rentissue = get_object_or_404(RentIssue,name=str(invoice.rent_issue))
        invoice.total_payable = float(rentissue.rent) + invoice.electricity_bill + invoice.gas_bill + invoice.water_bill + invoice.service_charge
        invoice.save()
        return redirect('invoices')

@login_required
def deleteinvoice(request,invoice_id):        
    invoice = get_object_or_404(Invoice, pk=invoice_id)
    
    if request.method == 'POST':
        invoice.delete()
        return redirect('invoices')



@login_required
def payments(request):
    payments = Payment.objects.all().order_by('-created')
    return render(request, 'rentmanager/payments/payments.html',{'payments':payments})

@login_required
def createpayment(request):
    if request.method == 'GET':
        form = PaymentForm()
        return render(request, 'rentmanager/payments/createpayment.html', {'form': form})
    else:
        try:
            form = PaymentForm(request.POST)
            payment = form.save(commit=False)

            invoice = get_object_or_404(Invoice,name=payment.invoice)
            invoice.paid = True 
            invoice.save()
            
            payment.name = invoice.name + "_"+ str(payment.paid_amount)
            total_payable = invoice.total_payable
            due_amount = total_payable-payment.paid_amount
            payment.due_amount = due_amount
            payment.save()

            return redirect('payments')
        except ValueError:
            return render(request, 'rentmanager/payments/createpayment.html', {'form': form, 'error': 'Invalid Value'})


@login_required
def viewpayment(request, payment_id):
    payment = get_object_or_404(Payment, pk=payment_id)
    if request.method == 'GET':
        form = PaymentForm(instance=payment)
        return render(request, 'rentmanager/payments/viewpayment.html', {'form': form, 'instance': payment})
    else:
        form = PaymentForm(request.POST,instance=payment)
        payment = form.save(commit=False)
        payment.save()
        return redirect('payments')

@login_required
def deletepayment(request,payment_id):        
    payment = get_object_or_404(Payment, pk=payment_id)
    invoice = get_object_or_404(Invoice,name=payment.invoice)
    invoice.paid = False 
    invoice.save()

    if request.method == 'POST':
        payment.delete()
        return redirect('payments')


