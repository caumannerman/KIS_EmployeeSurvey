import 'package:flutter/material.dart';
import 'package:festivalsurvey/companyDetailPage.dart';

//설명 + 모달띄우기 위한 Title 버튼
class ElectExplanationOutlinedButton extends StatelessWidget {
  // const ElectOutlinedButton({Key? key}) : super(key: key);
  String title;
  // 보기 버튼을 누르면 어떤 것을 누른 것인지에 대한 정보도 보내줘야하므로
  String ticker;
  ElectExplanationOutlinedButton(this.title, this.ticker);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        print("현재의 title과 ticker = " + this.title + this.ticker);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CompanyDetailPage(ticker)
        ));

      },
      child: Text(this.title, style: TextStyle(color: Colors.brown)),
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20)
        ),
    );
  }
}
