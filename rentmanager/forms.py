from django import forms
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit
from .models import House, Flat,Renter,RentIssue,Invoice,Payment


class HouseForm(forms.ModelForm):
    class Meta:
        model = House
        fields = ('name', 'address_line_1', 'address_line_2',
                  'city', 'country', 'zipcode')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.add_input(Submit('submit', 'Save'))


class FlatForm(forms.ModelForm):
    class Meta:
        model = Flat
        fields = ('name','floor','house')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.add_input(Submit('submit', 'Save'))


class RenterForm(forms.ModelForm):
    class Meta:
        model = Renter
        fields = ('name', 'nid', 'passport', 'email', 'mobile', 'nationality',
                  'gender', 'address_line_1', 'address_line_2', 'city', 'country', 'zipcode')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.add_input(Submit('submit', 'Save'))
        
class RentIssueForm(forms.ModelForm):
    class Meta:
        model = RentIssue
        fields = ('flat','renter','start_date','rent')

    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['flat'].queryset = Flat.objects.filter(vacancy_status=True)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.add_input(Submit('submit', 'Save'))

class InvoiceForm(forms.ModelForm):
    class Meta:
        model = Invoice
        fields = ('rent_issue','month','year','electricity_bill','gas_bill','water_bill','service_charge')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.add_input(Submit('submit', 'Save'))

class PaymentForm(forms.ModelForm):
    class Meta:
        model = Payment
        fields = ('invoice','payment_type','bank_name','cheque_number','paid_amount')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.add_input(Submit('submit', 'Save'))