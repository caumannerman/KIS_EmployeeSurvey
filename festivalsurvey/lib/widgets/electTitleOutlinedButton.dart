import 'package:flutter/material.dart';


//제목을 위한 Title 버튼
class ElectTitleOutlinedButton extends StatelessWidget {
  // const ElectOutlinedButton({Key? key}) : super(key: key);
  String title;
  ElectTitleOutlinedButton(this.title);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){},
      child: Text(this.title, style: TextStyle(color: Colors.brown)),
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20)
          ),
    );
  }
}
