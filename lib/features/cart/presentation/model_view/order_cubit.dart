import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/order_history.dart';

//part 'order_state.dart';

class OrderCubit extends Cubit<List<Order>> {
  OrderCubit() : super([]);

  void addOrder(Order order) {
    final updatedOrders = List<Order>.from(state);
    updatedOrders.add(order);
    emit(updatedOrders);
  }
}
