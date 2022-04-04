import 'package:flutter/material.dart';

class CustomePage extends StatefulWidget {
  Widget child;
   CustomePage({required this.child});

  @override
  State<CustomePage> createState() => _CustomePageState();
}

class _CustomePageState extends State<CustomePage> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
