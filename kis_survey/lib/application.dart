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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: (){},
                      child: Text("        신청        ", style: TextStyle(color: Colors.black)),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(25)),
                    ),
                    OutlinedButton(
                      onPressed: (){},
                      child: Text("신청내역 조회", style: TextStyle(color: Colors.black)),
                      style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(25)),
                    ),
                  ],
                ),
              ),

              Center(
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

            ]
        )
    );
  }
}
