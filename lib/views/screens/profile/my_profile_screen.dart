import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  static const path = "/$routeName";
  static const routeName = "my-profile";

  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
