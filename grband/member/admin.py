from django.contrib import admin
from models import Member 

class MemberAdmin(admin.ModelAdmin): 
	list_display = ['name','instrument','active']
	list_editable  =['active']
	class Meta:
		model = Member

admin.site.register(Member,MemberAdmin)

