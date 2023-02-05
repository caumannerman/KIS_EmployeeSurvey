import 'package:flutter/material.dart';
import 'package:kis_survey/companyDetailPage.dart';

//설명 + 모달띄우기 위한 Title 버튼
class ElectExplanationOutlinedButton extends StatelessWidget {
  // const ElectOutlinedButton({Key? key}) : super(key: key);
  String title;
  ElectExplanationOutlinedButton(this.title);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CompanyDetailPage()
        ));

      },
      child: Text(this.title, style: TextStyle(color: Colors.brown)),
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(25)),
    );
  }
}
