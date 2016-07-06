from django.shortcuts import render
from django.views.generic import View
from grband.env import SOUNDCLOUD
from member.models import Member

class HomeView(View):
	def get(self,request):
		items = {}
		items.update(SOUNDCLOUD)
		try:
			members = Member.objects.filter(active=True)
		except:
			members = None
		
		items.update({'members' : members})
		return render(request,'home/index.html',items)
