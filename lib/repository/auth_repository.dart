import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screen/Otps_screen.dart';
import '../screen/user_information_screen.dart';
import '../widgets/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    firebaseAuth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance,
  ),
);

class AuthRepository {
  //*tao ra 1 instance cua firebase auth
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  AuthRepository({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });
  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted:
            (PhoneAuthCredential emailGoogleFacebookRegisterCredential) async {
          await firebaseAuth
              .signInWithCredential(emailGoogleFacebookRegisterCredential);
        },
        verificationFailed: (FirebaseAuthException error) => {
          showSnackBar(
            context: context,
            message: error.message.toString(),
          )
        },
        codeSent: (String verificationId, int? resendingToken) async {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  OtpScreen(
                verificationId: verificationId,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = const Offset(0.0, 1.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(
                  CurveTween(curve: curve),
                );

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
              transitionDuration: const Duration(seconds: 2),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          showSnackBar(
            context: context,
            message:
                'Sms đã đăng suất khỏi thế giới(ở auth_repository.dart nha)',
          );
        },
      );
    } catch (e) {
      showSnackBar(
        context: context,
        message: e.toString(),
      );
    }
  }

  void verifyOtp({
    required BuildContext context,
    required String verificationId,
    required String userOtp,
  }) async {
    try {
      //*phoneAuthProvider.credential co the tao ra 1 instance cua phoneAuthCredential
      PhoneAuthCredential credentialInverifyOtp = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOtp,
      );
      await firebaseAuth.signInWithCredential(credentialInverifyOtp);
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const UserInformationScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      showSnackBar(
        context: context,
        message: e.toString(),
      );
    }
  }
}
