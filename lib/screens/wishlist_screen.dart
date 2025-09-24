import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wishlist_provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = context.watch<WishlistProvider>();
    final wishlistItems = wishlistProvider.wishlist;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA4CCF3),
        title: const Text(
          "Favorites Items",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: wishlistItems.isEmpty
          ? const Center(child: Text("No favorites yet!"))
          : ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final product = wishlistItems[index];
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
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        wishlistProvider.removeFromWishlist(product);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
