import 'package:flutter/material.dart';
import 'package:kis_survey/electPage.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          body: ListView(
            children: [
              Image.asset('../assets/ci.jpeg',
                width: MediaQuery.of(context).size.width / 3,
                height: 50
              ),
              SizedBox(height: 10),

              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Image.asset('../assets/ci3.png',
                        width: MediaQuery.of(context).size.width / 3,
                        height: 50
                    ),

                    Container(
                        alignment: Alignment.center,
                        width:  MediaQuery.of(context).size.width / 3,
                        height: 50,
                        child: Text("FESTIVAL",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),



                Center(
                    child: Text("임직원 전용 신청 페이지",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold
                      ),
                    )
                ),
                ElevatedButton(
                  onPressed: () { },
                  child: Text('5월 1일(월) ~ 5월 10일(수) 17:00까지'),
                ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 2 / 5,
                          child: TextField(
                            maxLength: 6,
                            decoration: InputDecoration(
                                labelText: "주민등록번호 앞 6자리"
                            ),
                          ),
                        ),

                        SizedBox(width: 10),
                        Text(" - "),
                        SizedBox(width: 10),
                        //제품상세페이지 띄워줘야한다.
                        Container(
                          width: MediaQuery.of(context).size.width * 1 / 5,
                          child: TextField(
                            maxLength: 1,
                            decoration: InputDecoration(
                                labelText: "뒷 1자리"
                            ),
                          ),
                        ),
                      ],
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

