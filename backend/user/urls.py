from django.urls import  path

from user.views import RegisterAPI, LoginAPI, UsersList


urlpatterns = [
    path('users/', UsersList.as_view(), name='users'),
    path('register/', RegisterAPI.as_view(), name='register'),
    path('login/', LoginAPI.as_view(), name='login'),
]
