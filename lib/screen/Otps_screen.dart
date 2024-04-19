import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:project_cuoi_ki/controller/auth_controller.dart';
import 'package:project_cuoi_ki/widgets/custom_button.dart';

class OtpScreen extends ConsumerWidget {
  final String verificationId;
  final List<FocusNode> otpFocusNodes;
  OtpScreen({
    super.key,
    required this.verificationId,
  }) : otpFocusNodes = List.generate(6, (index) => FocusNode());

  final List<TextEditingController> textOtpController =
      List.generate(6, (_) => TextEditingController());

  void verifyOtp(WidgetRef ref, BuildContext context, String userOtp) {
    ref.read(authControllerProvider).verifyOtpInAuthController(
          context,
          userOtp,
          verificationId,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                                  focusNode: otpFocusNodes[index],
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
                                    if (value.isNotEmpty && index < 5) {
                                      FocusScope.of(context).requestFocus(
                                          otpFocusNodes[index + 1]);
                                    } else if (value.isEmpty && index > 0) {
                                      FocusScope.of(context).requestFocus(
                                          otpFocusNodes[index - 1]);
                                    }
                                    // rest of your code
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Verify',
                      onPressed: () {
                        String userOtp = '';
                        for (var element in textOtpController) {
                          userOtp += element.text;
                        }
                        userOtp = userOtp.trim();
                        if (userOtp.length == 6) {
                          verifyOtp(ref, context, userOtp);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Nhap thieu hay sai otp roi nha!'),
                            ),
                          );
                        }
                      },
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
