import 'package:flutter/material.dart';

import '../utils/responsive.dart';

class Propertylist extends StatefulWidget {
  const Propertylist({Key? key}) : super(key: key);

  @override
  State<Propertylist> createState() => _PropertylistState();
}

class _PropertylistState extends State<Propertylist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: getHeight(context),
      width: 330,
    );
  }
}
