import 'package:flutter/material.dart';


//설명 + 모달띄우기 위한 Title 버튼
class ElectExplanationOutlinedButton extends StatelessWidget {
  // const ElectOutlinedButton({Key? key}) : super(key: key);
  String title;
  ElectExplanationOutlinedButton(this.title);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 300, // 모달 높이 크기
              margin: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 40,
              ), // 모달 좌우하단 여백 크기
              decoration: const BoxDecoration(
                color: Colors.white, // 모달 배경색
                borderRadius: BorderRadius.all(
                  Radius.circular(20), // 모달 전체 라운딩 처리
                ),
              ),
              child: Text(this.title + "!!"), // 모달 내부 디자인 영역
            );
          },
          backgroundColor: Colors.transparent,
        );
      },
      child: Text(this.title, style: TextStyle(color: Colors.brown)),
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(25)),
    );
  }
}
