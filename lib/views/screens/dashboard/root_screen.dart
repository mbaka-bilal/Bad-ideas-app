import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  static const path = "/$routeName";
  static const routeName = "rootScreen";

  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
