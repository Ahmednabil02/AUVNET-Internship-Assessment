import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import this for Bloc access
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../cart/presentation/model_view/cart_cubit.dart';
import '../../../data/models/ProductModel.dart';

class ProductDetailScreen extends StatelessWidget {
  final Data product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product
            .name), // Optional: uncomment if you want to show the product name in the app bar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'product_image_${product.id}',
              child: Container(
                height: 400, // Custom height
                width: double.infinity, // Custom width
                child: Image.network(
                  product.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '\$${product.price}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Product Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              product.description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            AppTextButton(
              backgroundColor: Colors.red,
              buttonText: 'Add to Cart',
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              onPressed: () {
                // Call the CartCubit to add the product to the cart
                BlocProvider.of<CartCubit>(context).addProduct(product);
                // Optionally, show a SnackBar or a dialog to confirm the addition
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} added to cart!'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
