from django import forms
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit
from .models import House,Flat


class HouseForm(forms.ModelForm):
    class Meta:
        model = House
        fields = ('name','address_line_1','address_line_2','city','country','zipcode')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.add_input(Submit('submit', 'Update'))

class FlatForm(forms.ModelForm):
    class Meta:
        model = Flat
        fields = ('name','house')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.add_input(Submit('submit', 'Update'))