import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService
{
  static final _firebaseAuth = FirebaseAuth.instance;

  static String verifyId = '';
  static Future sendOtp(String phoneNumber) async
  {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) async {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        print('Code sent');
        verifyId=verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) async {
        print('Time out');
      },
    );
  }
}