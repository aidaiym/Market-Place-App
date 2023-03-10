// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_cubit.dart';

class ProductState extends Equatable {
  const ProductState({
    this.status = FetchStatus.loading,
    this.products,
  });

  final FetchStatus status;
  final List<ProductModel>? products;

  @override
  List<Object?> get props => [status];

  ProductState copyWith({FetchStatus? status, List<ProductModel>? products}) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
}
