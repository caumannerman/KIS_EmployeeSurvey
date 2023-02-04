import 'package:flutter/material.dart';
import 'package:kis_survey/electPage.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(),
            body: ListView(
              children: [
                Text("안녕하세요",  style: TextStyle(color: Color(0xffb17fc8)), ),

                // 이름 입력
                Center(
                  child: Padding(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "이름"
                      ),
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                ),

                // 사번
                Center(
                  child: Padding(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "사번"
                      ),
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                ),

                // 주민등록번호 앞 6자리, 뒷 1자리
                Center(
                  child: Padding(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "주민등록번호 앞 6자리"
                      ),
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                ),

                //임직원 인증
                Center(
                  child: OutlinedButton(
                    onPressed: (){

                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) => ChartPage()
                      // ));

                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ElectPage()
                      ));


                      // showModalBottomSheet(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //   return Container(
                      //     height: 300, // 모달 높이 크기
                      //     margin: const EdgeInsets.only(
                      //       left: 25,
                      //       right: 25,
                      //       bottom: 40,
                      //     ), // 모달 좌우하단 여백 크기
                      //     decoration: const BoxDecoration(
                      //       color: Colors.white, // 모달 배경색
                      //       borderRadius: BorderRadius.all(
                      //         Radius.circular(20), // 모달 전체 라운딩 처리
                      //       ),
                      //     ),
                      //     child: Text("짠~"), // 모달 내부 디자인 영역
                      //   );
                      // },
                      //   backgroundColor: Colors.transparent,
                      // );



                    },
                    child: Text("임직원 인증", style: TextStyle(color: Colors.brown)),
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.greenAccent,
                        padding: const EdgeInsets.all(25)),

                  ),
                ),

                const Center(
                    child: Text("담당자 : 총무부 XXX(02-3276-XXXX)",  style: TextStyle(color: Color(0xffb17fc8)), )
                ),

                const Center(
                    child: Text("WEB SERVICE 기획 : 채용교육부",  style: TextStyle(color: Color(0xff000000)), )
                ),

                const Center(
                    child: Text("만든이 : FY2022 하반기 Digital 신입사원",  style: TextStyle(color: Color(0xff000000)), )
                )

              ],

              // height: 150,
              // padding: EdgeInsets.all(10),
            )
        )
    );
  }
}

