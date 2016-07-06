from __future__ import unicode_literals
from ckeditor.fields import RichTextField
from django.conf import settings
from django.db import models

class Member(models.Model):
	name = models.CharField(max_length=100,null=True)
	instrument = models.CharField(max_length=40,null=True)
	description = RichTextField(null=True,blank=True)
	image = models.ImageField(upload_to='members',blank=True,null=True)
	active = models.BooleanField(default=False)

	def __unicode__(self):
		return self.name or 'Blank Name'

	def get_absolute_url(self):
		path = settings.SERVER + '/media/'
		return "%s/%s" % (path,self.image)