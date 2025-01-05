import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  static const path = "/$routeName";
  static const routeName = "dashboard";

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
