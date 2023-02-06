import 'package:flutter/material.dart';
import 'package:kis_survey/application.dart';
import 'package:kis_survey/signInPage.dart';
import 'package:kis_survey/companyDetailPage.dart';

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
        home: ApplicationPage(),
      // home: SignInPage(),
    );
  }
}



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
