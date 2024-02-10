import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/models/food_model.dart';

class FoodTile extends StatelessWidget {
  final FoodModel food;
  final void Function()? onTap;
  const FoodTile({Key? key, required this.food, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Expanded(
              child: Image.asset(
                food.imagePath,
              ),
            ),
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 20, color: Colors.black.withOpacity(0.8)),
            ),
            const SizedBox(height: 6,),
            SizedBox(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹${food.price}',
                    style: TextStyle(color: Colors.black.withOpacity(0.7), fontFamily: 'Poppins'),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber[400],
                      ),
                      Text(
                        food.rating,
                        style: TextStyle(color: Colors.black.withOpacity(0.6), fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
