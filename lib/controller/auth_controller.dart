import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_cuoi_ki/repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  //*Priveder.of<AuthRepository>(context);
  return AuthController(authRepository: authRepository);
});

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});
  void signInWithPhoneInAuthController(
      BuildContext context, String phoneNumber) async {
    authRepository.signInWithPhone(context, phoneNumber);
  }

  void verifyOtpInAuthController(
      BuildContext context, String userOtp, String verificationId) async {
    authRepository.verifyOtp(
      context: context,
      userOtp: userOtp,
      verificationId: verificationId,
    );
  }
}
