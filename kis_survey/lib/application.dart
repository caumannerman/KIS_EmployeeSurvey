import 'package:flutter/material.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  final _companyList = ["한국금융지주", "한국투자증권", "한국투자부동산신탁","한국투자리얼에셋"];
  var _selectedCompany = "한국금융지주";
  var selectedIndex = 0;
  var applySelected = true;
  var applyInfoSelected = false;

  var sizeCheckList1 = [false, false, false, false, false];
  var sizeCheck1 = 0;

  var sizeCheckList2 = [false, false, false, false, false];
  var sizeCheck2 = 0;

  var sizeCheckList3 = [false, false, false, false, false];
  var sizeCheck3 = 0;

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

              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: (){
                        setState(() {
                          if (applySelected){
                            return;
                          }
                          applySelected = true;
                          applyInfoSelected = false;
                        });
                      },

                      child: Text("        신청        ",
                          style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal
                      ),
                      ),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: applySelected ? Colors.lightBlueAccent : Colors.white70,
                          padding: const EdgeInsets.all(25)),
                    ),
                    flex: 1,
                  ),
                  // ApplyButton(),
                  Expanded(
                      child:  OutlinedButton(
                        onPressed: (){
                          setState(() {
                            if (applyInfoSelected){
                              return;
                            }
                            applySelected = false;
                            applyInfoSelected = true;
                          });
                        },
                        child: Text("신청내역 조회",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal
                            ),
                        ),
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: applyInfoSelected ?  Colors.lightBlueAccent : Colors.white70,
                            padding: const EdgeInsets.all(25)),
                      ),
                      flex: 1
                  ),
                ],
              ),


              Visibility(
                visible: applySelected,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DropdownButton(
                      value: _selectedCompany,
                      items: _companyList.map(
                          (value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          },
                      ).toList(),
                      onChanged: (value){
                        setState(
                            (){
                              _selectedCompany = value ?? "한국투자증권";
                            }
                        );
                      },
                    ),
                  )
                ),
              ),


              Visibility(
                visible: applySelected,
                child: Center(
                  child: Padding(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "이름"
                      ),
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                ),
              ),

              // 사번
               Visibility(
                visible: applySelected,
                child: Center(
                  child: Padding(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "사번"
                      ),
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                ),
              ),

              // 주민등록번호 앞 6자리, 뒷 1자리
              Visibility(
                visible: applySelected,
                child: Center(
                  child: Padding(
                    child: TextField(
                      decoration: InputDecoration(
                          labelText: "주민등록번호 앞 6자리"
                      ),
                    ),
                    padding: EdgeInsets.all(20.0),
                  ),
                ),
              ),

              //임직원 인증
              Visibility(
                visible: applySelected,
                child: Center(
                  child: OutlinedButton(
                    onPressed: (){

                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) => ChartPage()
                      // ));

                    },
                    child: Text("임직원 인증", style: TextStyle(color: Colors.brown)),
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.greenAccent,
                        padding: const EdgeInsets.all(25)),

                  ),
                ),
              ),

              Visibility(
                visible: applyInfoSelected,
                child: SizedBox(height: 30)
              ),

              ////////////////////// 여기부터 사이즈 선택 / 신청내역 조회 에 사용할 Widget
              Visibility(
                visible: applyInfoSelected,
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                      height: 60,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text("단체복 신청",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold
                        ),
                      )
                  ),
                ),
              ),


              Visibility(
                visible: applyInfoSelected,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        // width: MediaQuery.of(context).size.width / 2,
                        height: 60,
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        child: Text("1.밀레 남성 기능성 자켓",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                    SizedBox(width: 20),
                    //제품상세페이지 띄워줘야한다.
                    OutlinedButton(
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) => ChartPage()
                        // ));
                      },
                      child: Text("제품상세", style: TextStyle(color: Colors.black)),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.lightGreenAccent,
                          padding: const EdgeInsets.all(5)
                      ),
                    ),
                  ],
                ),
              ),


              Visibility(
                visible: applyInfoSelected,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Image.asset('../assets/splash2.png',
                          // width: MediaQuery.of(context).size.width / 4,
                          height: 200
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        child:  Container(
                          // width: MediaQuery.of(context).size.width / 2,
                            height: 200,
                            color: Colors.greenAccent
                        ),
                        flex: 3
                    ),
                  ],
                ),
              ),


              Visibility(
                visible: applyInfoSelected,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // width: MediaQuery.of(context).size.width / 2,
                        height: 60,
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        child: Text("사이즈 선택",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                    SizedBox(width: 10),
                    Text("90",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.red,
                      value: sizeCheckList1[0],
                      onChanged: (value) {
                        setState(() {
                          sizeCheckList1[0] = value ?? true;
                          sizeCheck1 = 0;
                          for( int i = 0; i < sizeCheckList1.length; i ++){
                            if (i == 0){
                              continue;
                            }
                            sizeCheckList1[i] = false;
                          }
                        });
                      },
                    ),
                    Text("95",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 10),
                    Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.red,
                      value: sizeCheckList1[1],
                      onChanged: (value) {
                        setState(() {
                          sizeCheckList1[1] = value ?? true;
                          sizeCheck1 = 1;
                          for( int i = 0; i < sizeCheckList1.length; i ++){
                            if (i == 1){
                              continue;
                            }
                            sizeCheckList1[i] = false;
                          }
                        });
                      },
                    ),
                    Text("100",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.red,
                      value: sizeCheckList1[2],
                      onChanged: (value) {
                        setState(() {
                          sizeCheckList1[2] = value ?? true;
                          sizeCheck1 = 2;
                          for( int i = 0; i < sizeCheckList1.length; i ++){
                            if (i == 2){
                              continue;
                            }
                            sizeCheckList1[i] = false;
                          }
                        });
                      },
                    ),
                    Text("105",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.red,
                      value: sizeCheckList1[3],
                      onChanged: (value) {
                        setState(() {
                          sizeCheckList1[3] = value ?? true;
                          sizeCheck1 = 3;
                          for( int i = 0; i < sizeCheckList1.length; i ++){
                            if (i == 3){
                              continue;
                            }
                            sizeCheckList1[i] = false;
                          }
                        });
                      },
                    ),
                    Text("110",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),

                    Checkbox(
                      activeColor: Colors.white,
                      checkColor: Colors.red,
                      value: sizeCheckList1[4],
                      onChanged: (value) {
                        setState(() {
                          sizeCheckList1[4] = value ?? true;
                          sizeCheck1 = 4;
                          for( int i = 0; i < sizeCheckList1.length; i ++){
                            if (i == 4){
                              continue;
                            }
                            sizeCheckList1[i] = false;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),

              Visibility(
                  visible: applyInfoSelected,
                  child: SizedBox(height: 20)
              ),


              Visibility(
                visible: applyInfoSelected,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // width: MediaQuery.of(context).size.width / 2,
                        height: 60,
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        child: Text("2.밀레 남성 카라 티셔츠",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                    SizedBox(width: 20),
                    //제품상세페이지 띄워줘야한다.
                    OutlinedButton(
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) => ChartPage()
                        // ));
                      },
                      child: Text("제품상세", style: TextStyle(color: Colors.black)),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.lightGreenAccent,
                          padding: const EdgeInsets.all(5)
                      ),
                    ),
                  ],
                ),
              ),

              Visibility(
                visible: applyInfoSelected,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Image.asset('../assets/splash2.png',
                          // width: MediaQuery.of(context).size.width / 4,
                          height: 200
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        child:  Container(
                          // width: MediaQuery.of(context).size.width / 2,
                            height: 200,
                            color: Colors.blueAccent
                        ),
                        flex: 3
                    ),
                  ],
                ),
              ),

              Visibility(
                  visible: applyInfoSelected,
                  child: SizedBox(height: 20)
              ),

              Visibility(
                visible: applyInfoSelected,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // width: MediaQuery.of(context).size.width / 2,
                        height: 60,
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        child: Text("3.밀레 남성 바지",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                    SizedBox(width: 20),
                    //제품상세페이지 띄워줘야한다.
                    OutlinedButton(
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) => ChartPage()
                        // ));
                      },
                      child: Text("제품상세", style: TextStyle(color: Colors.black)),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.lightGreenAccent,
                          padding: const EdgeInsets.all(5)
                      ),
                    ),
                  ],
                ),
              ),

              Visibility(
                visible: applyInfoSelected,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Image.asset('../assets/splash2.png',
                          // width: MediaQuery.of(context).size.width / 4,
                          height: 200
                      ),
                      flex: 2,
                    ),
                    Expanded(
                        child:  Container(
                          // width: MediaQuery.of(context).size.width / 2,
                            height: 200,
                            color: Colors.orangeAccent
                        ),
                        flex: 3
                    ),
                  ],
                ),
              ),

              Visibility(
                  visible: applyInfoSelected,
                  child: SizedBox(height: 20)
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

            ]
        )
    );
  }
}
