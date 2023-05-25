from django import views
from django.urls import  path, include

from product.views import ProductDetail, ProductList, ProductUpdateAPIView


urlpatterns = [
    path('', ProductList.as_view()),
    path('<int:pk>', ProductDetail.as_view(), name='product_detail'),
    path('edit/<int:pk>/', ProductUpdateAPIView.as_view(), name='edit_product'),
]
