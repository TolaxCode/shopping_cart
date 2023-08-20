import 'package:e_commerc_sneaker/constant/colors.dart';
import 'package:e_commerc_sneaker/constant/fonts.dart';
import 'package:e_commerc_sneaker/constant/route.dart';
import 'package:e_commerc_sneaker/views/pages/nike_page.dart';
import 'package:flutter/material.dart';

class MyCategoriesWidget extends StatefulWidget {
  const MyCategoriesWidget({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;

  @override
  State<MyCategoriesWidget> createState() => _MyCategoriesWidgetState();
}

class _MyCategoriesWidgetState extends State<MyCategoriesWidget> {
  int isSelect = 0;
  List<String> listCategories = [
    'Home',
    'Nike',
    'Vans',
    'Adiddas',
    'Puma',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.height * 0.03,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            listCategories.length,
            (index) {
              return Padding(
                padding: EdgeInsets.only(left: widget.width * 0.03),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelect = index;
                    });
                    //route to nike page
                    if (index == 1) {
                      nextScreen(context, const NikePage());
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: isSelect == index
                          ? Colors.grey[300]
                          : colorContrainer,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widget.width * 0.06,
                        vertical: widget.height * 0.01,
                      ),
                      child: Text(
                        listCategories[index],
                        style:
                            isSelect == index ? fontCategorie : fontCategories,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
