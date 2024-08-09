import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/data/models/ProductModel.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  List<Data> _products = [];

  CartCubit() : super(CartEmpty());

  void addProduct(Data product) {
    if (state is CartEmpty) {
      _products = [product];
    } else if (state is CartLoaded) {
      _products.add(product);
    }

    emit(CartLoaded(products: _products, totalPrice: _calculateTotal()));
  }

  void removeProduct(Data product) {
    _products.remove(product);
    if (_products.isEmpty) {
      emit(CartEmpty());
    } else {
      emit(CartLoaded(products: _products, totalPrice: _calculateTotal()));
    }
  }

  double _calculateTotal() {
    return _products.fold(0, (total, product) => total + product.price);
  }
}
