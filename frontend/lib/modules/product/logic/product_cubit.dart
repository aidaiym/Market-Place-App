import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../models/models.dart';
import '../service/product_service.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productService) : super(const ProductState());

  final ProductService productService;

  Future<void> getPost() async {
    final products = await productService.getAllProducts();
    if (products != null) {
      emit(state.copyWith(status: FetchStatus.success, products: products));
    } else {
      emit(state.copyWith(status: FetchStatus.error));
    }
  }
}
