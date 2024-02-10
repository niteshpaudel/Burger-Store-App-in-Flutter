import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/components/button.dart';
import 'package:restaurant_app/theme/colors.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              'Burger Store'.toUpperCase(),
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset('assets/images/burger-4.png'),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Burger store created by nitesh'.toUpperCase(),
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Yahan Burger sirf dekhne ko milta hai, Welcome to the Burger Store!',
              style: TextStyle(
                  color: Colors.grey[200],
                  height: 2,
                  fontFamily: 'Poppins',
                  fontSize: 15),
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              text: 'Get Started',
              onTap: () {
                Navigator.pushReplacementNamed(context, '/menupage');
              },
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
