import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final cartItems = cartProvider.cartItems;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA4CCF3),
        title: const Text(
          "Favorites Items",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text("Your cart is empty"))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    leading: Image.network(
                      product.image!,
                      width: 60,
                      fit: BoxFit.contain,
                    ),
                    title: Text(product.title!),
                    subtitle: Text("\$${product.price}"),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.remove_shopping_cart,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        cartProvider.removeFromCart(product);
                      },
                    ),
                  ),
                );
              },
            ),

    );
  }
}
