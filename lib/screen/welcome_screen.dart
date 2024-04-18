import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../widgets/custom_button.dart';
import 'register_screen.dart';

class WelComeScreen extends StatefulWidget {
  const WelComeScreen({super.key});

  @override
  State<WelComeScreen> createState() => _WelComeScreenState();
}

class _WelComeScreenState extends State<WelComeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                  'https://lottie.host/557e90c7-bf22-4360-ac5a-e7e1de7fe343/HeUUMct5D0.json',
                  height: 250,
                ),
                const Text(
                  'Let\'s get started',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'Grow your focus tree and be more productive!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const RegisterScreen(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = const Offset(0.0, 1.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                        transitionDuration: const Duration(
                            seconds:
                                2), 
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
