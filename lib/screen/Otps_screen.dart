import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:lottie/lottie.dart';
import 'package:project_cuoi_ki/widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> textOtpController =
      List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Lottie.network(
                  'https://lottie.host/557e90c7-bf22-4360-ac5a-e7e1de7fe343/HeUUMct5D0.json',
                ),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withOpacity(0.0),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Enter OTP',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          6,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: SizedBox(
                              width: 40,
                              child: TextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: textOtpController[index],
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  counter: Offstage(),
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    if (index != 5) {
                                      FocusScope.of(context)
                                          .nextFocus(); // move focus to next
                                    } else {
                                      FocusScope.of(context)
                                          .unfocus(); // remove focus
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Verify',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
