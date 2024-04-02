import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/components/food_tile.dart';
import 'package:restaurant_app/pages/food_details.dart';
import 'package:restaurant_app/models/food_model.dart';
import 'package:restaurant_app/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List foodMenu = [
    FoodModel(
        name: 'Veggie Burger',
        price: "99.99",
        imagePath: 'assets/images/burger-4.png',
        rating: '4.7'),
    FoodModel(
        name: 'Deluxe Burger',
        price: '199.99',
        imagePath: 'assets/images/burger-2.png',
        rating: '4.8'),
    FoodModel(
        name: 'Chicken Burger',
        price: '299.99',
        imagePath: 'assets/images/burger-3.png',
        rating: '4.5'),
    FoodModel(
        name: 'Burger Fries',
        price: '399.99',
        imagePath: 'assets/images/burger-1.png',
        rating: '4.1'),
    FoodModel(
        name: 'Cheeseburger',
        price: '499.99',
        imagePath: 'assets/images/burger-5.png',
        rating: '4.6'),
    FoodModel(
        name: 'Crispy Burger',
        price: '599.99',
        imagePath: 'assets/images/burger-6.png',
        rating: '4.3')
  ];

  void navigateToFoodDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetails(
          food: foodMenu[index],
        ),
      ),
    );
  }

  IconData favIcon = Icons.favorite_outline;
  void toggleFavoriteIcon() {
    if (favIcon == Icons.favorite_outline) {
      favIcon = Icons.favorite;
    } else {
      favIcon = Icons.favorite_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[50],
      appBar: appBar(),
      body: myBody(),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Icon(
        Icons.menu,
        color: primaryColor,
      ),
      title: Text(
        'BURGER STORE',
        style: TextStyle(color: primaryColor, fontFamily: 'Poppins'),
      ),
    );
  }

  Column myBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Get 0% Discount",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(text: 'Order Now', onTap: () {})
                ],
              ),
              Image.asset(
                'assets/images/burger-2.png',
                height: 120,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: searchField(), //TextField(
          //   decoration: InputDecoration(
          //     focusedBorder: OutlineInputBorder(
          //       borderSide: const BorderSide(color: Colors.green),
          //       borderRadius: BorderRadius.circular(20)
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderSide: BorderSide(color: primaryColor),
          //       borderRadius: BorderRadius.circular(5),
          //     )
          //   ),
          // ),
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            'Burger Menu',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: primaryColor,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(right: 25),
            scrollDirection: Axis.horizontal,
            itemCount: foodMenu.length,
            itemBuilder: (context, index) => FoodTile(
              food: foodMenu[index],
              onTap: () => navigateToFoodDetails(index),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(5),
          ),
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          padding: const EdgeInsets.all(20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/burger-1.png',
                  height: 70,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Burger Fries',
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 19, color: Colors.black.withOpacity(0.8)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '₹399.99',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: 'Poppins'),
                    )
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  toggleFavoriteIcon();
                });
              },
              child: Icon(
                favIcon,
                color: Colors.red[300],
                size: 28,
              ),
            )
          ]),
        )
      ],
    );
  }
}

Container searchField() {
  return Container(
    margin: const EdgeInsets.only(left: 5, right: 5),
    child: TextField(
        cursorColor: primaryColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(5),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
          suffixIcon: SizedBox(
            width: 100,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    color: primaryColor,
                    indent: 13,
                    endIndent: 13,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      'assets/icons/Filter.svg',
                      height: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
  );
}
