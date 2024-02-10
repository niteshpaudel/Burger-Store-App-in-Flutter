import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/models/food_model.dart';
import 'package:restaurant_app/theme/colors.dart';

class FoodDetails extends StatefulWidget {
  final FoodModel food;
  const FoodDetails({Key? key, required this.food}) : super(key: key);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantityCount = 1;

  void decrementQuantity() {
    if (quantityCount > 1) {
      setState(() {
        quantityCount--;
      });
    }
  }

  void incrementQuantity() {
    if (quantityCount < 100) {
      setState(() {
        quantityCount++;
      });
    }
  }

  void addToCart(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,

        foregroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagePath,
                    height: 190,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber[400],
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 28, color: Colors.black.withOpacity(0.8)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'I admit it, another ho got me finished Broke my heart, oh, no, you didn\'t Fuck sippin\', I\'ma down a whole bottle Hard liquor, hard truth, can\'t swallow Need a bartender, put me out my sorrow Wake up the next day in the Monte Carlo With a new woman, tell me she from Colorado And she love women, she\'ll be gone by tomorrow Who am I kiddin\'?\n\n',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.6),
                        height: 1.8),
                  ),
    
                ],
              ),
            ),
          ),
          
          Container(
            color: primaryColor,
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹${(double.parse(widget.food.price)*quantityCount).toStringAsFixed(2)}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Poppins'),
                  ),
                  Row(
                    children: [
                      Container(
                          width: 40,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            highlightColor: primaryColor.withOpacity(0.5),
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                            onPressed: decrementQuantity,
                          )),
                      SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(
                            quantityCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          highlightColor: primaryColor.withOpacity(0.5),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: incrementQuantity,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              MyButton(
                text: 'Add to cart',
                onTap: addToCart,
              )
            ]),
          )
        ],
      ),
    );
  }
}
