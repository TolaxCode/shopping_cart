import 'package:e_commerc_sneaker/constant/colors.dart';
import 'package:e_commerc_sneaker/constant/fonts.dart';
import 'package:e_commerc_sneaker/constant/route.dart';
import 'package:e_commerc_sneaker/controller/db_controller.dart';
import 'package:e_commerc_sneaker/controller/provider_controller.dart';
import 'package:e_commerc_sneaker/model/cart.dart';
import 'package:e_commerc_sneaker/model/product_model.dart';
import 'package:e_commerc_sneaker/views/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NikePage extends StatefulWidget {
  const NikePage({super.key});

  @override
  State<NikePage> createState() => _NikePageState();
}

CartProvider cartProvider = CartProvider();
DBController dbController = DBController();

class _NikePageState extends State<NikePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final cart = Provider.of<CartProvider>(context);
    //method add to database
    void saveData(int index) {
      dbController
          .insert(Cart(
              id: index,
              productId: index.toString(),
              productName: product[index].name,
              initialPrice: product[index].price.toInt(),
              productPrice: product[index].price.toInt(),
              unitTag: product[index].unit.toString(),
              image: product[index].image,
              quantity: ValueNotifier(1)))
          .then((value) {
        cart.addTotolPrice(product[index].price.toDouble());
        cart.addCounter();
        const ScaffoldMessenger(
          child: SnackBar(
            content: Text('Add Sucessfull'),
          ),
        );
      }).onError((error, stackTrace) {
        debugPrint(error.toString());
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        //name shop
        centerTitle: true,
        title: Text(
          'Sneaker',
          style: fontTitle,
        ),
        //shopping
        actions: [
          IconButton(
            onPressed: () => nextScreen(context, const CartPage()),
            icon: const Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      //Grid View
      body: Consumer<CartProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.58,
              crossAxisSpacing: 8,
            ),
            itemCount: product.length,
            itemBuilder: (context, index) {
              //big size of container
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //size
                  Container(
                    alignment: Alignment.topRight,
                    height: height * 0.28,
                    // width: width * 0.35,
                    //imageProduct

                    decoration: BoxDecoration(
                      color: colorContrainer,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage(
                          product[index].image,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                    //Icon favourite
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                      ),
                    ),
                  ),
                  //Product name
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.01,
                      left: width * 0.01,
                    ),
                    child: Text(
                      product[index].name,
                      style: fontProduct,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  //Product price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * 0.01,
                          top: height * 0.009,
                        ),
                        child: Text(
                          '\$ ${product[index].price}',
                          style: fontPrice,
                        ),
                      ),
                      //Button add to cart
                      GestureDetector(
                        onTap: () async {
                          saveData(index);
                        },
                        child: Container(
                          width: width * 0.09,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
