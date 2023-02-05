import 'package:flutter/material.dart';
import 'package:kis_survey/application.dart';
import 'package:kis_survey/widgets/electExplanationOutlinedButton.dart';
import 'package:kis_survey/widgets/electTitleOutlinedButton.dart';
import 'package:kis_survey/adminPage.dart';
import 'package:kis_survey/widgets/electionColumnOutlinedButton.dart';

class ElectPage extends StatefulWidget {
  const ElectPage({Key? key}) : super(key: key);

  @override
  State<ElectPage> createState() => _ElectPageState();
}

class _ElectPageState extends State<ElectPage> {

  var isCheckedList = [false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
            children: [
            Image.asset('../assets/ci.jpeg',
            width: MediaQuery.of(context).size.width / 3,
            height: 50
        ),
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
              Center(
                  child: Column(
                    children: [
                      SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: ElectionColumnOutlinedButton("브랜드"),
                              flex: 5,
                          ),
                          Expanded(
                              child:  ElectionColumnOutlinedButton("설명"),
                              flex: 3
                          ),
                          Expanded(
                              child: ElectionColumnOutlinedButton("선택"),
                              flex: 2
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElectTitleOutlinedButton("나이키"),
                            flex: 5,
                          ),
                          Expanded(
                              child:  ElectExplanationOutlinedButton("보기"),
                              flex: 3
                          ),
                          Expanded(
                              child: Checkbox(
                                        activeColor: Colors.white,
                                        checkColor: Colors.red,
                                        value: isCheckedList[0],
                                        onChanged: (value) {
                                          setState(() {
                                            isCheckedList[0] = value ?? true;
                                            for( int i = 0; i < isCheckedList.length; i ++){
                                              if (i == 0){
                                                continue;
                                              }
                                              isCheckedList[i] = false;
                                            }
                                          });
                                        },
                                      ),
                              flex: 2
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ElectTitleOutlinedButton("아디다스"),
                            flex: 5,
                          ),
                          Expanded(
                              child:  ElectExplanationOutlinedButton("보기"),
                              flex: 3
                          ),
                          Expanded(
                              child: Checkbox(
                                activeColor: Colors.white,
                                checkColor: Colors.red,
                                value: isCheckedList[1],
                                onChanged: (value) {
                                  setState(() {
                                    isCheckedList[1] = value ?? true;
                                    for( int i = 0; i < isCheckedList.length; i ++){
                                      if (i == 1){
                                        continue;
                                      }
                                      isCheckedList[i] = false;
                                    }
                                  });
                                },
                              ),
                              flex: 2
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Expanded(
                            child: ElectTitleOutlinedButton("아디다스"),
                            flex: 5,
                          ),
                          Expanded(
                              child:  ElectExplanationOutlinedButton("보기"),
                              flex: 3
                          ),
                          Expanded(
                              child: Checkbox(
                                activeColor: Colors.white,
                                checkColor: Colors.red,
                                value: isCheckedList[2],
                                onChanged: (value) {
                                  setState(() {
                                    isCheckedList[2] = value ?? true;
                                    for( int i = 0; i < isCheckedList.length; i ++){
                                      if (i == 2){
                                        continue;
                                      }
                                      isCheckedList[i] = false;
                                    }
                                  });
                                },
                              ),
                              flex: 2
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          Expanded(
                            child: ElectTitleOutlinedButton("아디다스"),
                            flex: 5,
                          ),
                          Expanded(
                              child:  ElectExplanationOutlinedButton("보기"),
                              flex: 3
                          ),
                          Expanded(
                              child: Checkbox(
                                activeColor: Colors.white,
                                checkColor: Colors.red,
                                value: isCheckedList[3],
                                onChanged: (value) {
                                  setState(() {
                                    isCheckedList[3] = value ?? true;
                                    for( int i = 0; i < isCheckedList.length; i ++){
                                      if (i == 3){
                                        continue;
                                      }
                                      isCheckedList[i] = false;
                                    }
                                  });
                                },
                              ),
                              flex: 2
                          ),
                        ],
                      ),

                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElectTitleOutlinedButton("아디다스"),
                            flex: 5,
                          ),
                          Expanded(
                              child:  ElectExplanationOutlinedButton("보기"),
                              flex: 3
                          ),
                          Expanded(
                              child: Checkbox(
                                activeColor: Colors.white,
                                checkColor: Colors.red,
                                value: isCheckedList[4],
                                onChanged: (value) {
                                  setState(() {
                                    isCheckedList[4] = value ?? true;
                                    for( int i = 0; i < isCheckedList.length; i ++){
                                      if (i == 4){
                                        continue;
                                      }
                                      isCheckedList[i] = false;
                                    }
                                  });
                                },
                              ),
                              flex: 2
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElectTitleOutlinedButton("아디다스"),
                            flex: 5,
                          ),
                          Expanded(
                              child:  ElectExplanationOutlinedButton("보기"),
                              flex: 3
                          ),
                          Expanded(
                              child: Checkbox(
                                activeColor: Colors.white,
                                checkColor: Colors.red,
                                value: isCheckedList[5],
                                onChanged: (value) {
                                  setState(() {
                                    isCheckedList[5] = value ?? true;
                                    for( int i = 0; i < isCheckedList.length; i ++){
                                      if (i == 5){
                                        continue;
                                      }
                                      isCheckedList[i] = false;
                                    }
                                  });
                                },
                              ),
                              flex: 2
                          ),
                        ],
                      ),

                      // Container(
                      //     height: 100,
                      //     color: Colors.white,
                      //     child: Row(
                      //       children: [
                      //         Flexible(flex: 5, child: Container(color: Colors.blue,)),
                      //         Flexible(flex: 3, child: Container(color: Colors.red,)),
                      //         Flexible(flex: 2, child: Container(color: Colors.green,))
                      //       ],
                      //     )
                      // ),




                      OutlinedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => AdminPage()
                          ));
                        },
                        child: Text("제출하기(임시 관리p)", style: TextStyle(color: Colors.brown)),
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.greenAccent,
                            padding: const EdgeInsets.all(25)),
                      ),
                    ],
                  )
              )
        ]
      )
    );
  }
}

//Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Flexible(
//                                 child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       ElectionColumnOutlinedButton("브랜드"),
//                                       ElectTitleOutlinedButton("아디다스"),
//                                       ElectTitleOutlinedButton("나이키"),
//                                       ElectTitleOutlinedButton("밀레"),
//                                       ElectTitleOutlinedButton("K2"),
//                                       ElectTitleOutlinedButton("Reebok"),
//                                       ElectTitleOutlinedButton("CHANEL")
//                                     ]
//                                 ),
//                                 flex: 5
//                             ),
//                             Flexible(
//                                 child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//
//                                       ElectionColumnOutlinedButton("설명"),
//                                       ElectExplanationOutlinedButton("설명1"),
//                                       ElectExplanationOutlinedButton("설명2"),
//                                       ElectExplanationOutlinedButton("설명3"),
//                                       ElectExplanationOutlinedButton("설명4"),
//                                       ElectExplanationOutlinedButton("설명5"),
//                                       ElectExplanationOutlinedButton("설명6")
//                                     ]
//                                 ),
//                                 flex: 3
//                             ),
//                             Flexible(
//                                 child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                                     mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       ElectionColumnOutlinedButton("선택"),
//                                       Checkbox(
//                                         activeColor: Colors.white,
//                                         checkColor: Colors.red,
//                                         value: isCheckedList[0],
//                                         onChanged: (value) {
//                                           setState(() {
//                                             isCheckedList[0] = value ?? false;
//                                             for( int i = 0; i < isCheckedList.length; i ++){
//                                               if (i == 0){
//                                                 continue;
//                                               }
//                                               isCheckedList[i] = false;
//                                             }
//                                           });
//                                         },
//                                       ),
//                                       Checkbox(
//                                         activeColor: Colors.white,
//                                         checkColor: Colors.red,
//                                         value: isCheckedList[1],
//                                         onChanged: (value) {
//                                           setState(() {
//                                             isCheckedList[1] = value ?? true;
//                                             for( int i = 0; i < isCheckedList.length; i ++){
//                                               if (i == 1){
//                                                 continue;
//                                               }
//                                               isCheckedList[i] = false;
//                                             }
//                                           });
//                                         },
//                                       ),
//                                       Checkbox(
//                                         activeColor: Colors.white,
//                                         checkColor: Colors.red,
//                                         value: isCheckedList[2],
//                                         onChanged: (value) {
//                                           setState(() {
//                                             isCheckedList[2] = value ?? false;
//                                             for( int i = 0; i < isCheckedList.length; i ++){
//                                               if (i == 2){
//                                                 continue;
//                                               }
//                                               isCheckedList[i] = false;
//                                             }
//                                           });
//                                         },
//                                       ),
//                                       Checkbox(
//                                         activeColor: Colors.white,
//                                         checkColor: Colors.red,
//                                         value: isCheckedList[3],
//                                         onChanged: (value) {
//                                           setState(() {
//                                             isCheckedList[3] = value ?? false;
//                                             for( int i = 0; i < isCheckedList.length; i ++){
//                                               if (i == 3){
//                                                 continue;
//                                               }
//                                               isCheckedList[i] = false;
//                                             }
//                                           });
//                                         },
//                                       ),
//                                       Checkbox(
//                                         activeColor: Colors.white,
//                                         checkColor: Colors.red,
//                                         value: isCheckedList[4],
//                                         onChanged: (value) {
//                                           setState(() {
//                                             isCheckedList[4] = value ?? false;
//                                             for( int i = 0; i < isCheckedList.length; i ++){
//                                               if (i == 4){
//                                                 continue;
//                                               }
//                                               isCheckedList[i] = false;
//                                             }
//                                           });
//                                         },
//                                       ),
//                                       Checkbox(
//                                         activeColor: Colors.white,
//                                         checkColor: Colors.red,
//                                         value: isCheckedList[5],
//                                         onChanged: (value) {
//                                           setState(() {
//                                             isCheckedList[5] = value ?? false;
//                                             for( int i = 0; i < isCheckedList.length; i ++){
//                                               if (i == 5){
//                                                 continue;
//                                               }
//                                               isCheckedList[i] = false;
//                                             }
//                                           });
//                                         },
//                                       ),
//                                     ]
//                                 ),
//                                 flex: 2
//                             )
//                           ]
//                       ),