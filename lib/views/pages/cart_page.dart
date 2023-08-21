import 'package:e_commerc_sneaker/constant/fonts.dart';
import 'package:e_commerc_sneaker/controller/provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = CartProvider();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        //name shop
        centerTitle: true,
        title: Text(
          'My Shopping Cart',
          style: fontTitle,
        ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, value, child) => Card(
          child: ListTile(
            tileColor: Colors.brown[50],
            leading: Image.asset('assets/image/s1.png'),
            title: Text(
              'Nike',
              style: fontProduct,
            ),
            subtitle: Text(
              '\$ 90.99',
              style: fontPrice,
            ),
            trailing: Icon(
              Icons.highlight_remove_rounded,
              color: Colors.red[900],
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
