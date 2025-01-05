import 'package:flutter/material.dart';

class VerifyOtpScreen extends StatefulWidget {
  static const path = "/$routeName";
  static const routeName = "verify-otp";

  final String email;
  final String nextScreen;

  const VerifyOtpScreen({super.key, required this.email, required this.nextScreen});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
