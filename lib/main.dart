import 'package:addlens_assign/providers/cart_provider.dart';
import 'package:addlens_assign/providers/product_provider.dart';
import 'package:addlens_assign/providers/wishlist_provider.dart';
import 'package:addlens_assign/res/routes/app_.routes.dart';
import 'package:addlens_assign/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>ProductProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner:false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
         initialRoute: AppRoutes.login,
          onGenerateRoute: AppRoutes.generateRoute,
        ),
      ),
    );
  }
}
