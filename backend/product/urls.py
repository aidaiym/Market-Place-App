from django import views
from django.urls import  path, include

from product.views import ProductDetail, ProductList


urlpatterns = [
    path('', ProductList.as_view()),
    path('<int:pk>', ProductDetail.as_view(), name='product_detail'),
]
