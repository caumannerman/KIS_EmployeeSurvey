import 'package:flutter/material.dart';

class BrandNameOutlinedButton extends StatelessWidget {
  String title;
  BrandNameOutlinedButton(this.title);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){},
      child: Text(this.title, style: TextStyle(color: Colors.white)),
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20)),
    );
  }
}
