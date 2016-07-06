from django import forms

class ContactForm(forms.Form):
	name = forms.CharField()
	title = forms.CharField()
	description = forms.CharField()
