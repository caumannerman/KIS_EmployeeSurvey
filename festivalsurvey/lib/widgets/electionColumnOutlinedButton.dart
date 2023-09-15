import 'package:flutter/material.dart';

class ElectionColumnOutlinedButton extends StatelessWidget {
  String title;
  ElectionColumnOutlinedButton(this.title);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){},
      child: Text(this.title, style: TextStyle(
          color: Color(0xFF222222),
        fontWeight: FontWeight.w500,
        fontSize: 12
      )),
      style: OutlinedButton.styleFrom(
          foregroundColor:  Color(0xFF222222),
          backgroundColor: Color(0xFFDDDDDD),
          disabledBackgroundColor: Color(0xFFDDDDDD),
          disabledForegroundColor: Color(0xFF222222),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(width: 1.0, color: Color(0xFFF1F1F1)),
          ),
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20)),
    );
  }
}
