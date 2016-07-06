from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from forms import ContactForm
from message.models import Message 
# one url
class APIContactForm(APIView):

	def post(self,request,format=None):	
		form = ContactForm(request.POST or None)
		if not form.is_valid():
			return Response(form.errors.as_json(),status=status.HTTP_401_UNAUTHORIZED)

		name = request.POST['name']
		title = request.POST['title']
		description = request.POST['description']

		message = Message.objects.create(
			name=name,
			title=title,
			description=description
		)

		return Response('Message was successfully submitted',status=status.HTTP_200_OK)