import 'package:flutter/material.dart';

class ElectionColumnOutlinedButton extends StatelessWidget {
  String title;
  ElectionColumnOutlinedButton(this.title);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){},
      child: Text(this.title, style: TextStyle(color: Colors.white)),
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.lightBlue,
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20)),
    );
  }
}
