import 'package:flutter/material.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// setState(() {
//                           sizeCheckList1[0] = value ?? true;
//                           sizeCheck1 = 0;
//                           for( int i = 0; i < sizeCheckList1.length; i ++){
//                             if (i == 0){
//                               continue;
//                             }
//                             sizeCheckList1[i] = false;
//                           }
//                         });

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  //일반 투표용
  // var brandList = ["1","2","3","4","5"];
  // var countList = [1,2,3,4,5];\
  //결선투표용
  var brandList_final = ["1","2"];
  var countList_final = [1,2];



  var sum = "";
  var winnerIdx = -1;

  //일반투표용
  // getData() async{
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //
  //   await for (var snapshot in firebaseFirestore.collection("vote")
  //       .snapshots()) {
  //     var idx = 0;
  //     var temp_max = -1;
  //     var maxIdx = -1;
  //     for (var col in snapshot.docs){
  //       print(col?["brand"]);
  //       print(col?["count"]);
  //       // if col?["count"] >
  //       if (temp_max < col?["count"]){
  //         maxIdx = idx;
  //         temp_max = col?["count"];
  //       }
  //       setState(() {
  //         brandList[idx] = col?["brand"];
  //         countList[idx] = col?["count"];
  //       });
  //       idx += 1;
  //     }
  //
  //     setState(() {
  //       sum = countList.reduce((a,b) => a + b).toString();
  //       winnerIdx = maxIdx;
  //     });
  //   }
  // }

  //결선투표용
  getData() async{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  await for (var snapshot in firebaseFirestore.collection("vote_final")
      .snapshots()) {
  var idx = 0;
  var temp_max = -1;
  var maxIdx = -1;
  for (var col in snapshot.docs){
  print(col?["brand"]);
  print(col?["count"]);
  // if col?["count"] >
  if (temp_max < col?["count"]){
  maxIdx = idx;
  temp_max = col?["count"];
  }
  setState(() {
  brandList_final[idx] = col?["brand"];
  countList_final[idx] = col?["count"];
  });
  idx += 1;
  }

  setState(() {
  sum = countList_final.reduce((a,b) => a + b).toString();
  winnerIdx = maxIdx;
  });
  }
}


  @override
  initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    List<VBarChartModel> bardata = [
      VBarChartModel(
        index: 0,
        label: brandList_final[0],
        colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
        jumlah: double.parse(countList_final[0].toString()) / 4 ,
        tooltip: countList_final[0].toString() + "표 " + ((countList_final[0] / double.parse(sum)) * 100).toInt().toString() + "%",
      ),
      VBarChartModel(
        index: 1,
        label: brandList_final[1],
        colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
        jumlah: double.parse(countList_final[1].toString()) / 4,
        tooltip: countList_final[1].toString() + "표 " + ((countList_final[1] / double.parse(sum)) * 100).toInt().toString() + "%",
      ),



      // VBarChartModel(
      //   index: 2,
      //   label: brandList[2],
      //   colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
      //   jumlah: double.parse(countList[2].toString()) / 4,
      //   tooltip: countList[2].toString() + "표 " + ((countList[2] / double.parse(sum)) * 100).toInt().toString() + "%",
      // ),
      // VBarChartModel(
      //   index: 3,
      //   label: brandList[3],
      //   colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
      //   jumlah: double.parse(countList[3].toString()) / 4,
      //   tooltip: countList[3].toString() + "표 " + ((countList[3] / double.parse(sum)) * 100).toInt().toString() + "%",
      // ),
      // VBarChartModel(
      //   index: 4,
      //   label: brandList[4],
      //   colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
      //   jumlah: double.parse(countList[4].toString()) / 4 ,
      //   tooltip: countList[4].toString() + "표 " + ((countList[4] / double.parse(sum)) * 100).toInt().toString() + "%",
      // ),



      VBarChartModel(
        index: 5,
        label: "전체 투표수",
        colors: [Color(0xff4b3ff0), Color(0xff4b3ff0)],
        jumlah: double.parse(sum) / 6 ,
        tooltip: sum ,
      ),
      VBarChartModel(
        index: 6,
        label: "1위: " + brandList_final[winnerIdx],
        colors: [Color(0xff4b3fff), Color(0xff4b3ff0)],
        jumlah: double.parse(countList_final[winnerIdx].toString()) / 4 ,
        tooltip: countList_final[winnerIdx].toString() + "표" ,
      ),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height - 50,
            child: _buildGrafik(bardata),
          ),
        ),
      ),
    );
  }
  Widget _buildGrafik(List<VBarChartModel> bardata) {
    return VerticalBarchart(
      background: Colors.transparent,
      labelColor: Color(0xff283137),
      tooltipColor: Color(0xff8e97a0),
      maxX: 600,
      data: bardata,
      barStyle: BarStyle.DEFAULT,
    );
  }
}

//
// class AdminPage extends StatelessWidget {
//   // const AdminPage({Key? key}) : super(key: key);
//   var brandList = ["1","2","3","4","5","6"];
//   var countList = ["1","2","3","4","5","6"];
//
//   getData() async{
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//
//     await for (var snapshot in firebaseFirestore.collection("vote")
//         .snapshots()) {
//       for (var col in snapshot.docs){
//         print(col?["brand"]);
//         print(col?["count"]);
//         brandList.add(col?["brand"]);
//         brandList.add(col?["count"]);
//       }
//     }
//
//   }
//
//     AdminPage() {
//       getData();
//     }
//
//     @override
//     Widget build(BuildContext context) {
//       List<VBarChartModel> bardata = [
//         VBarChartModel(
//           index: 0,
//           label: brandList[0],
//           colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
//           jumlah: double.parse(countList[0]),
//           tooltip: countList[0] + "개",
//         ),
//         VBarChartModel(
//           index: 1,
//           label: brandList[1],
//           colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
//           jumlah: double.parse(countList[1]),
//           tooltip: countList[1] + "개",
//         ),
//         VBarChartModel(
//           index: 2,
//           label: brandList[2],
//           colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
//           jumlah: double.parse(countList[2]),
//           tooltip: countList[2] + "개",
//         ),
//         VBarChartModel(
//           index: 3,
//           label: brandList[3],
//           colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
//           jumlah: double.parse(countList[3]),
//           tooltip: countList[3] + "개",
//         ),
//         VBarChartModel(
//           index: 4,
//           label: brandList[4],
//           colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
//           jumlah: double.parse(countList[4]),
//           tooltip: countList[4] + "개",
//         ),
//         VBarChartModel(
//           index: 5,
//           label: brandList[5],
//           colors: [Color(0xfff93f5b), Color(0xfff93f5b)],
//           jumlah: double.parse(countList[5]),
//           tooltip: countList[5] + "개",
//         ),
//       ];
//       return Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
//             child: Container(
//               width: MediaQuery
//                   .of(context)
//                   .size
//                   .width,
//               height: MediaQuery
//                   .of(context)
//                   .size
//                   .height - 50,
//               child: _buildGrafik(bardata),
//             ),
//           ),
//         ),
//       );
//     }
//     Widget _buildGrafik(List<VBarChartModel> bardata) {
//       return VerticalBarchart(
//         background: Colors.transparent,
//         labelColor: Color(0xff283137),
//         tooltipColor: Color(0xff8e97a0),
//         maxX: 400,
//         data: bardata,
//         barStyle: BarStyle.DEFAULT,
//       );
//     }
//   }
