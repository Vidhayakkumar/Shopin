import 'package:addlens_assign/providers/cart_provider.dart';
import 'package:addlens_assign/providers/product_provider.dart';
import 'package:addlens_assign/providers/wishlist_provider.dart';
import 'package:addlens_assign/res/routes/app_.routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ProductProvider>(context, listen: false).getProductList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    final cartProvider = context.watch<CartProvider>();
    final wishlistProvider = context.watch<WishlistProvider>();
    final products = productProvider.products;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA4CCF3),
        title:  Text(
          "Smart Shop",
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: wishlistProvider.wishlistCount > 0
                ? Icon(Icons.favorite, color: Colors.red)
                : Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(
                context,
               AppRoutes.wishlistScreen,
              );
            },
          ),

          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                     AppRoutes.cartScreen,
                    );
                  },
                ),
                if (cartProvider.cartCount > 0)
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.green,
                    child: Text(
                      cartProvider.cartCount.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: productProvider.isLoading?Center(child: CircularProgressIndicator(),): GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final inCart = cartProvider.isInCart(product);
          final inWishlist = wishlistProvider.isInWishlist(product);

          return Card(
            elevation: 0.7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.network(product.image!, fit: BoxFit.contain),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.title!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "\₹${product.price}",
                    style:  TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        inCart
                            ? Icons.remove_shopping_cart
                            : Icons.add_shopping_cart,
                        color: inCart ? Colors.red : Colors.green,
                      ),
                      onPressed: () {
                        if (inCart) {
                          cartProvider.removeFromCart(product);
                        } else {
                          cartProvider.addToCart(product);
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        inWishlist ? Icons.favorite : Icons.favorite_border,
                        color: inWishlist ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        if (inWishlist) {
                          wishlistProvider.removeFromWishlist(product);
                        } else {
                          wishlistProvider.addToWishlist(product);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
