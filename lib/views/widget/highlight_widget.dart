import 'package:e_commerc_sneaker/constant/colors.dart';
import 'package:e_commerc_sneaker/constant/fonts.dart';
import 'package:e_commerc_sneaker/model/product_model.dart';
import 'package:flutter/material.dart';

// import '../../constant/fonts.dart';
// import '../../model/product_model.dart';

class MyHighLightWidget extends StatelessWidget {
  const MyHighLightWidget(
      {super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.28,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: width * 0.03,
            ),
            child: SizedBox(
              height: height * 0.28,
              width: width * 0.35,
              //color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //size
                  Container(
                    alignment: Alignment.topRight,
                    height: height * 0.2,
                    width: width * 0.35,
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
                      icon: const Icon(Icons.favorite_border),
                    ),
                  ),
                  //Product name
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.006,
                      left: width * 0.01,
                    ),
                    child: Text(
                      product[index].name,
                      style: fontProduct,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  //Product price
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.01,
                    ),
                    child: Text(
                      '\$ ${product[index].price}',
                      style: fontPrice,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
