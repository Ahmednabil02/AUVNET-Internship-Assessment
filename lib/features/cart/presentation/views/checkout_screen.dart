import 'package:ecommerce/features/cart/data/order_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model_view/cart_cubit.dart';
import '../../../home/presentation/views/home_screen.dart';
import '../model_view/order_cubit.dart';
import 'order_screen.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Checkout'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartEmpty) {
            return Center(child: Text('Your cart is empty.'));
          } else if (state is CartLoaded) {
            final cartItems = state.products;
            final totalPrice = state.totalPrice;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final product = cartItems[index];

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.error),
                            ),
                            title: Text(product.name),
                            subtitle: Text(
                              '\$${product.price}',
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () {
                                context
                                    .read<CartCubit>()
                                    .removeProduct(product);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total: \$${totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final cartState = context.read<CartCubit>().state;
                            if (cartState is CartLoaded) {
                              final order = Order(
                                products: cartState.products,
                                totalPrice: cartState.totalPrice,
                                orderDate: DateTime.now(),
                              );
                              context.read<OrderCubit>().addOrder(order);

                              // Clear the cart and show a confirmation message
                              context.read<CartCubit>().emit(CartEmpty());
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('Order placed successfully!')),
                              );

                              // Optionally, navigate to the Order History screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            }
                          },
                          child: Text('Place Order'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('Unexpected state!'));
          }
        },
      ),
    );
  }
}
