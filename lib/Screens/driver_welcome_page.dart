import 'package:flutter/material.dart';
import 'package:full_circle/Screens/driver_sign_up.dart';
import 'package:full_circle/design.dart';
import 'home-page.dart';

class DriverWelcomePage extends StatelessWidget {
  const DriverWelcomePage({Key? key}) : super(key: key);
  static const String id = 'Driver_welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'images/SemiCircle.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final screenHeight = constraints.maxHeight;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pushNamed(context, HomeScreen.id);
                          },
                        ),
                      ],
                    ),
                    Text(
                      'Welcome to Full Circle Driver',
                      style: mainLogoName.copyWith(color: Colors.black),
                    ),
                    Image.asset('images/DriverSignUp.png'),
                    SizedBox(height: screenHeight * 0.09),
                    ElevatedButton(
                      style: buttonStyle.copyWith(
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(213, 50)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, DriverSignUp.id);
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
   );
  }
}
