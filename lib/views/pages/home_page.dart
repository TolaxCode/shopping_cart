import 'package:e_commerc_sneaker/constant/colors.dart';
import 'package:e_commerc_sneaker/views/widget/categories_widget.dart';
import 'package:flutter/material.dart';
import '../../constant/fonts.dart';
import '../widget/highlight_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorContrainer,
                image: const DecorationImage(
                  image: AssetImage('assets/image/s1.png'),
                ),
              ),
            ),
            //Categories
            MyCategoriesWidget(height: height, width: width),
            //
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Arrivals',
                    style: fontHighlight,
                  ),
                  const Text(
                    'See more',
                  ),
                ],
              ),
            ),
            //list
            MyHighLightWidget(height: height, width: width),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Treads',
                    style: fontHighlight,
                  ),
                  const Text(
                    'See more',
                  ),
                ],
              ),
            ),
            MyHighLightWidget(height: height, width: width),
          ],
        ),
      ),
    );
  }
}
