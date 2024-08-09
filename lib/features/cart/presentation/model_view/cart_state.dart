part of 'cart_cubit.dart';

abstract class CartState {}

class CartEmpty extends CartState {}

class CartLoaded extends CartState {
  final List<Data> products;
  final double totalPrice;

  CartLoaded({required this.products, required this.totalPrice});
}
