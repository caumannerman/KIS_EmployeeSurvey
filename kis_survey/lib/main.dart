import 'package:flutter/material.dart';
import 'package:kis_survey/election.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//Image.asset('assets/download.png')
    //Container(width: 50, height: 50, color: Colors.blue)
    //Container(
    //           width: 50, height: 50, color: Colors.blue,
    //           margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
    //           decoration: BoxDecoration(
    //             border: Border.all(color: Colors.black)
    //           ),
    //         )
    //Text("안녕하세요",  style: TextStyle(color: Color(0xffb17fc8)), )
    //SizedBox(
    //           child: ElevatedButton(
    //             child: Text("글자"),
    //             onPressed: (){},
    //             style: ButtonStyle()
    //           )
    //         )


    //Row(
    //           children: [
    //             Flexible(child: Container(color: Colors.blue), flex: 3),
    //             Flexible(child: Container(color: Colors.green), flex: 7),
    //             Flexible(child: Container(color: Colors.red), flex: 7),
    //           ]
    //         )
    return MaterialApp(
        home: SignInPage(),
    );
  }
}

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
                        child: Text("짠~"), // 모달 내부 디자인 영역
                      );
                    },
                      backgroundColor: Colors.transparent,
                    );



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



class ChartPage extends StatelessWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Row(
            children: [
              Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("브랜드"),
                              Text("아디다스"),
                              Text("나이키"),
                              Text("밀레"),
                              Text("K2"),
                              Text("Reebok"),
                              Text("CHANEL")
                            ]
                          ),
                          flex: 5
                      ),
              Flexible(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("설명"),
                        Text("설명1"),
                        Text("설명2"),
                        Text("설명3"),
                        Text("설명4"),
                        Text("설명5"),
                        Text("설명6")
                      ]
                  ),
                  flex: 3
              ),
              Flexible(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("설명"),
                        Text("설명1"),
                        Text("설명2"),
                        Text("설명3"),
                        Text("설명4"),
                        Text("설명5"),
                        Text("설명6")
                      ]
                  ),
                  flex: 3
              )
            ]
          )
        )
      );
  }
}

//child: Row(
//                     children: [
//                       Flexible(
//                           child: Image.asset('splash2.png'),
//                           flex: 5
//                       ),........................................................................................................0000000000000000000000000000000..............................................................................................................................................................................................................................................................................................................................................................................................................
//                       Flexible(
//                           child: Container(
//                               width: 600,
//                               color: Colors.red,
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text("카메라 팝니다"),
//                                     Text("금호동 3가"),
//                                     Text("7000원"),
//                                     Text("아이콘이랑 글자"),
//                                     Row(
//                                         mainAxisAlignment: MainAxisAlignment.end,
//                                         children: [
//                                           Icon(Icons.favorite),
//                                           Text("4")
//                                         ]
//                                     )
//                                   ]
//                               )
//                           ), flex: 5
//                       )
//                     ]
//                 )

//DataTable(
//             columns: [
//               DataColumn(label: Text('브랜드')),
//               DataColumn(label: Text('설명')),
//             ],
//             rows: [
//               DataRow(
//                   cells: [
//                     DataCell(OutlinedButton(
//                       onPressed: (){
//                         Navigator.push(context, MaterialPageRoute(
//                             builder: (context) => ChartPage()
//                         ));
//
//                       },
//                       child: Text("임직원 인증", style: TextStyle(color: Colors.brown)),
//                       style: OutlinedButton.styleFrom(
//                           foregroundColor: Colors.black,
//                           backgroundColor: Colors.greenAccent,
//                           padding: const EdgeInsets.all(25)),
//
//                     )),
//                     DataCell(Text('B1')),
//                   ]
//               ),
//               DataRow(
//                   cells: [
//                     DataCell(Text('A2')),
//                     DataCell(Text('B2')),
//                   ]
//               ),
//             ],
//           )