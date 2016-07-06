from __future__ import unicode_literals

from django.db import models

class Message(models.Model):
	name = models.CharField(max_length=140)
	title = models.CharField(max_length=140)
	description = models.TextField(max_length=1200)

	def __unicode__(self):
		return self.name
	
