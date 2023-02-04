import 'package:flutter/material.dart';
import 'package:kis_survey/widgets/electExplanationOutlinedButton.dart';
import 'package:kis_survey/widgets/electTitleOutlinedButton.dart';
import 'package:kis_survey/adminPage.dart';

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
        body: Center(
            child: Column(
              children: [
                Row(
                    children: [
                      Flexible(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ElectTitleOutlinedButton("브랜드"),
                                ElectTitleOutlinedButton("아디다스"),
                                ElectTitleOutlinedButton("나이키"),
                                ElectTitleOutlinedButton("밀레"),
                                ElectTitleOutlinedButton("K2"),
                                ElectTitleOutlinedButton("Reebok"),
                                ElectTitleOutlinedButton("CHANEL")
                              ]
                          ),
                          flex: 5
                      ),
                      Flexible(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ElectExplanationOutlinedButton("설명"),
                                ElectExplanationOutlinedButton("설명1"),
                                ElectExplanationOutlinedButton("설명2"),
                                ElectExplanationOutlinedButton("설명3"),
                                ElectExplanationOutlinedButton("설명4"),
                                ElectExplanationOutlinedButton("설명5"),
                                ElectExplanationOutlinedButton("설명6")
                              ]
                          ),
                          flex: 3
                      ),
                      Flexible(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ElectExplanationOutlinedButton("선택"),
                                Checkbox(
                                  activeColor: Colors.white,
                                  checkColor: Colors.red,
                                  value: isCheckedList[0],
                                  onChanged: (value) {
                                    setState(() {
                                      isCheckedList[0] = value ?? false;
                                      for( int i = 0; i < isCheckedList.length; i ++){
                                        if (i == 0){
                                          continue;
                                        }
                                        isCheckedList[i] = false;
                                      }
                                    });
                                  },
                                ),
                                Checkbox(
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
                                Checkbox(
                                  activeColor: Colors.white,
                                  checkColor: Colors.red,
                                  value: isCheckedList[2],
                                  onChanged: (value) {
                                    setState(() {
                                      isCheckedList[2] = value ?? false;
                                      for( int i = 0; i < isCheckedList.length; i ++){
                                        if (i == 2){
                                          continue;
                                        }
                                        isCheckedList[i] = false;
                                      }
                                    });
                                  },
                                ),
                                Checkbox(
                                  activeColor: Colors.white,
                                  checkColor: Colors.red,
                                  value: isCheckedList[3],
                                  onChanged: (value) {
                                    setState(() {
                                      isCheckedList[3] = value ?? false;
                                      for( int i = 0; i < isCheckedList.length; i ++){
                                        if (i == 3){
                                          continue;
                                        }
                                        isCheckedList[i] = false;
                                      }
                                    });
                                  },
                                ),
                                Checkbox(
                                  activeColor: Colors.white,
                                  checkColor: Colors.red,
                                  value: isCheckedList[4],
                                  onChanged: (value) {
                                    setState(() {
                                      isCheckedList[4] = value ?? false;
                                      for( int i = 0; i < isCheckedList.length; i ++){
                                        if (i == 4){
                                          continue;
                                        }
                                        isCheckedList[i] = false;
                                      }
                                    });
                                  },
                                ),
                                Checkbox(
                                  activeColor: Colors.white,
                                  checkColor: Colors.red,
                                  value: isCheckedList[5],
                                  onChanged: (value) {
                                    setState(() {
                                      isCheckedList[5] = value ?? false;
                                      for( int i = 0; i < isCheckedList.length; i ++){
                                        if (i == 5){
                                          continue;
                                        }
                                        isCheckedList[i] = false;
                                      }
                                    });
                                  },
                                ),
                              ]
                          ),
                          flex: 3
                      )
                    ]
                ),
                OutlinedButton(
                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (context) => ChartPage()
                    // ));
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
    );
  }
}
