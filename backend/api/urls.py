from django import views
from django.urls import  path, include

from api.views import ProductDetail, ProductList


urlpatterns = [
    path('products', ProductList.as_view()),
    path('products/<int:pk>', ProductDetail.as_view(), name='product_detail'),
]
