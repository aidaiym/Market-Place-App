from django import views
from django.urls import  path, include

from user.views import RegisterAPI, LoginAPI, UserAPI


urlpatterns = [
    path('', RegisterAPI.as_view()),
    path('LoginAPI', LoginAPI.as_view(), name='login'),
    path('LoginAPI', UserAPI.as_view(), name='user'),

]
