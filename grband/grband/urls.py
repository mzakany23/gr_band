from django.conf.urls import patterns, include, url
from django.contrib import admin
from home.views import HomeView
from api.home.views import APIContactForm
from django.conf import settings

admin.site.site_header = 'Golden Retrievers Cleveland'

(r'^ckeditor/', include('ckeditor_uploader.urls')),

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'grband.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
)

# home
urlpatterns += patterns('home.views',
	url(r'^$', HomeView.as_view(),name='home'),
)

# api
urlpatterns += patterns('api.views',
	url(r'^api/home/contact/$', APIContactForm.as_view()),
)

# media
urlpatterns += patterns('',
    (r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT})
)
