import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festivalsurvey/companyDetailPage.dart';
import 'package:festivalsurvey/companyPage.dart';
import 'package:flutter/material.dart';
import 'package:festivalsurvey/application.dart';
import 'package:festivalsurvey/widgets/electExplanationOutlinedButton.dart';
import 'package:festivalsurvey/widgets/electTitleOutlinedButton.dart';
import 'package:festivalsurvey/adminPage.dart';
import 'package:festivalsurvey/widgets/electionColumnOutlinedButton.dart';
import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:localstorage/localstorage.dart';
// import 'package:cross_local_storage/cross_local_storage.dart';

class ElectPage extends StatefulWidget {
  // const ElectPage({Key? key}) : super(key: key);

  //전 페이지에서 로그인 하면, 사번 받아와야함
  // 사번
  var sabun = "";
  var isAdmin = "";
  var voteStatus = "";

  ElectPage(String sb, String adm, String sts){
    sabun = sb;
    // 1이면 admin, 0이면 일반
    isAdmin = adm;
    // false면 이미 투표 해서 더 못하는 경우. true면 아직 안했기 때문에 투표할 수 있는 상태
    voteStatus = sts;
  }

  // init(String sb){
  //   final firebaseFirestore = FirebaseFirestore.instance;
  //   sabun = sb;
  //   //.instance.collection('user').doc("113223").snapshots();
  //   // print(collectionStream);
  // }

  @override
  State<ElectPage> createState() => _ElectPageState();
}

class _ElectPageState extends State<ElectPage> {
  var electCompleted = false;

  var companyList = [ "EIDER","FILA", "MILLET","NATGEO","WDANGL" ];
  var isCheckedList = [false, false, false, false, false];
  //현재 선택한 것의 인덱스
  var nowCheckedIndex = -1;

  // init(){
  //   var aa = {widget.sabun};
  // }
  // @override
  // initState(){
  //   super.initState();
  //   electCompleted = false;
  // }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;


  putCache() async{
    print("캐시설정");
    await DefaultCacheManager().getSingleFile("y", key: "file1");
    print("캐시설정 완료");
    return;
  }

  Future<void> getData() async{

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    print("사번 받아온 것");
    print(widget.sabun);

    var now_admin = "";
    var now_status = "";

    await for (var snapshot in firebaseFirestore.collection("user").where("eid", isEqualTo: widget.sabun).snapshots()) {
      var now = snapshot.docs[0];
      print("----------await안쪽 시작----------");
      print(now?["admin"]);
      print(now?["eid"]);
      print(now?["works"]);
      print(now?["status"]);
      now_admin = now?["admin"];
      now_status = now?["status"];
      print("----------await안쪽 끝남----------");
    }

    print("await끝나고 이제 if문 시작!");
    print(now_admin);
    print(now_status);
    //여기부터 setState
  }

  // 투표했으면 투표했다고 해당 사번 status를 false로 바꿈
  void updatePersonalVote(String eid) async {
    await( FirebaseFirestore.instance.collection("user").doc(eid).update({
      "status": "false"
    })
    );
  }

  // 투표하면 해당 브랜드에 대해 count를 1 추가
  void updateCount(String brand) async {
    await( FirebaseFirestore.instance.collection("vote_final").doc(brand).update(
        {
          // "brand": companyList[nowCheckedIndex],
          "count": FieldValue.increment(1)
        })
    );
  }

   void updateView() async {

    setState(() {
      electCompleted = true;
    });


    // await( FirebaseFirestore.instance.collection("vote").doc(companyList[nowCheckedIndex]).update(
    //     {
    //       // "brand": companyList[nowCheckedIndex],
    //       "count": FieldValue.increment(1)
    //     })
    // );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(


        backgroundColor:  Color(0xFFF5F5F5),
        body: ListView(

            children: [

              Container(
                color: Color(0xFFFFFFFF),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Image.network('https://firebasestorage.googleapis.com/v0/b/kisfestival-a86f4.appspot.com/o/ci2.png?alt=media&token=528bdce9-207f-4bad-8840-0ac953f6fbed',
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
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                  ],
                ),
              ),

              Container(
                color: Color(0xFFFFFFFF),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,16,0, 16),
                  child: Center(
                      child: Text("단체복 선정 투표",
                        style: TextStyle(
                            color: Color(0xFF222222),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600
                        ),
                      )
                  ),
                ),
              ),

              SizedBox(
                  height: 24
              ),

              Visibility(
                visible: !electCompleted,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width  - 48,
                    height: 52,
                    child: TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(
                          foregroundColor: Color(0xFF208ADD),
                          backgroundColor: Color(0xFFFFFFFF),
                          disabledForegroundColor: Color(0xFF208ADD),
                          disabledBackgroundColor:  Color(0xFFFFFFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            side: BorderSide(width: 1.0, color: Color(0xFFA5D7FF)),
                          )
                      ),
                      // child: Text('3월 2일(목) ~ 3월 3일(금) 16:00까지'),
                      child: Text('3월 8일(수) 09:00 ~ 16:00까지'),
                    ),
                  ),
                ),
              ),

              SizedBox(
                  height: 40
              ),

              Center(
                  child: Column(
                    children: [
                      Visibility(
                        visible: !electCompleted,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width  - 48,
                          height: 48,

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child:  TextButton(
                                    onPressed: null,
                                    style: TextButton.styleFrom(
                                        foregroundColor:  Color(0xFF222222),
                                        backgroundColor: Color(0xFFDDDDDD),
                                        disabledBackgroundColor: Color(0xFFDDDDDD),
                                        disabledForegroundColor: Color(0xFF222222),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0)),
                                          side: BorderSide(width: 1.0, color: Color(0xFFF1F1F1)),
                                        ),
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)

                                    ),
                                    child: Text("선택", style: TextStyle(
                                        color: Color(0xFF222222),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12
                                    ),
                                    ),
                                  ),
                                  flex: 3,
                              ),
                              Expanded(
                                  child: TextButton(
                                    onPressed: null,
                                    style: TextButton.styleFrom(
                                        foregroundColor:  Color(0xFF222222),
                                        backgroundColor: Color(0xFFDDDDDD),
                                        disabledBackgroundColor: Color(0xFFDDDDDD),
                                        disabledForegroundColor: Color(0xFF222222),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(4.0)),
                                          side: BorderSide(width: 1.0, color: Color(0xFFF1F1F1)),
                                        ),
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)

                                    ),
                                    child: Text("브랜드", style: TextStyle(
                                        color: Color(0xFF222222),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12
                                    ),
                                  ),
                                  ),
                                  flex: 13
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Visibility(
                      //   visible: !electCompleted,
                      //   child: SizedBox(
                      //     width: MediaQuery.of(context).size.width  - 48,
                      //     height: 74,
                      //
                      //     child: Row(
                      //       crossAxisAlignment: CrossAxisAlignment.stretch,
                      //       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         Expanded(
                      //           child:  TextButton(
                      //             onPressed: null,
                      //             child:  Checkbox(
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.circular(30)
                      //               ),
                      //               activeColor: Colors.white,
                      //               checkColor: Color(0xFF222222),
                      //               value: isCheckedList[0],
                      //               onChanged: (value) {
                      //                 setState(() {
                      //                   isCheckedList[0] = value ?? true;
                      //                   if (value == true){
                      //                     nowCheckedIndex = 0;
                      //                   }else{
                      //                     nowCheckedIndex = -1;
                      //                   }
                      //
                      //                   for( int i = 0; i < isCheckedList.length; i ++){
                      //                     if (i == 0){
                      //                       continue;
                      //                     }
                      //                     isCheckedList[i] = false;
                      //                   }
                      //                 });
                      //               },
                      //             ),
                      //               style: TextButton.styleFrom(
                      //                   foregroundColor:  Color(0xFF222222),
                      //                   backgroundColor: Color(0xFFFFFFFF),
                      //                   disabledBackgroundColor: Color(0xFFFFFFFF),
                      //                   disabledForegroundColor: Color(0xFF222222),
                      //                   shape: RoundedRectangleBorder(
                      //                     side: BorderSide(width: 1.0, color: Color(0xFFEAEAEA)),
                      //                   ),
                      //                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0)
                      //               )
                      //           ),
                      //
                      //           flex: 3,
                      //         ),
                      //         Expanded(
                      //             child:  TextButton(
                      //               onPressed: (){
                      //                 Navigator.push(context, MaterialPageRoute(
                      //                     builder: (context) => CompanyPage(companyList[0])
                      //                 ));
                      //               },
                      //               child: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                 children: [
                      //                   Text("아이더",
                      //                       textAlign: TextAlign.start,
                      //                       style: TextStyle(
                      //                         color: Color(0xFF222222),
                      //                         fontWeight: FontWeight.w700,
                      //                         fontSize: 16,
                      //                       )),
                      //                   Icon(Icons.chevron_right)
                      //                 ],
                      //               ),
                      //
                      //               style: TextButton.styleFrom(
                      //                   foregroundColor:  Color(0xFF222222),
                      //                   backgroundColor: Color(0xFFFFFFFF),
                      //                   disabledBackgroundColor: Color(0xFFFFFFFF),
                      //                   disabledForegroundColor: Color(0xFF222222),
                      //                   shape: RoundedRectangleBorder(
                      //
                      //                     side: BorderSide(width: 1.0, color: Color(0xFFEAEAEA)),
                      //                   ),
                      //                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 0)
                      //                   // padding: const EdgeInsets.symmetric(vertical: 0)
                      //               ),
                      //             ),
                      //             flex: 13
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      //
                      // Visibility(
                      //   visible: !electCompleted,
                      //   child: SizedBox(
                      //     width: MediaQuery.of(context).size.width  - 48,
                      //     height: 74,
                      //
                      //     child: Row(
                      //       crossAxisAlignment: CrossAxisAlignment.stretch,
                      //       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         Expanded(
                      //           child:  TextButton(
                      //               onPressed: null,
                      //               child:  Checkbox(
                      //                 shape: RoundedRectangleBorder(
                      //                     borderRadius: BorderRadius.circular(30)
                      //                 ),
                      //                 activeColor: Colors.white,
                      //                 checkColor: Color(0xFF222222),
                      //                 value: isCheckedList[1],
                      //                 onChanged: (value) {
                      //                   setState(() {
                      //                     isCheckedList[1] = value ?? true;
                      //                     if (value == true){
                      //                       nowCheckedIndex = 1;
                      //                     }else{
                      //                       nowCheckedIndex = -1;
                      //                     }
                      //                     for( int i = 0; i < isCheckedList.length; i ++){
                      //                       if (i == 1){
                      //                         continue;
                      //                       }
                      //                       isCheckedList[i] = false;
                      //                     }
                      //                   });
                      //                 },
                      //               ),
                      //               style: TextButton.styleFrom(
                      //                 foregroundColor:  Color(0xFF222222),
                      //                 backgroundColor: Color(0xFFFFFFFF),
                      //                 disabledBackgroundColor: Color(0xFFFFFFFF),
                      //                 disabledForegroundColor: Color(0xFF222222),
                      //                 shape: RoundedRectangleBorder(
                      //                   side: BorderSide(width: 1.0, color: Color(0xFFEAEAEA)),
                      //                 ),
                      //                   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)
                      //               )
                      //           ),
                      //
                      //           flex: 3,
                      //         ),
                      //         Expanded(
                      //             child:  TextButton(
                      //               onPressed: (){
                      //                 Navigator.push(context, MaterialPageRoute(
                      //                     builder: (context) => CompanyPage(companyList[1])
                      //                 ));
                      //               },
                      //               child: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                 children: [
                      //                   Text("휠라",
                      //                       textAlign: TextAlign.start,
                      //                       style: TextStyle(
                      //                         color: Color(0xFF222222),
                      //                         fontWeight: FontWeight.w700,
                      //                         fontSize: 16,
                      //                       )),
                      //                   Icon(Icons.chevron_right)
                      //                 ],
                      //               ),
                      //
                      //               style: TextButton.styleFrom(
                      //                 foregroundColor:  Color(0xFF222222),
                      //                 backgroundColor: Color(0xFFFFFFFF),
                      //                 disabledBackgroundColor: Color(0xFFFFFFFF),
                      //                 disabledForegroundColor: Color(0xFF222222),
                      //                 shape: RoundedRectangleBorder(
                      //
                      //                   side: BorderSide(width: 1.0, color: Color(0xFFEAEAEA)),
                      //                 ),
                      //                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 0)
                      //               ),
                      //             ),
                      //             flex: 13
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),


                      Visibility(
                        visible: !electCompleted,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width  - 48,
                          height: 74,

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child:  TextButton(
                                    onPressed: null,
                                    child:  Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)
                                      ),
                                      activeColor: Colors.white,
                                      checkColor: Color(0xFF222222),
                                      value: isCheckedList[2],
                                      onChanged: (value) {
                                        setState(() {
                                          isCheckedList[2] = value ?? true;
                                          if (value == true){
                                            nowCheckedIndex = 2;
                                          }else{
                                            nowCheckedIndex = -1;
                                          }
                                          for( int i = 0; i < isCheckedList.length; i ++){
                                            if (i == 2){
                                              continue;
                                            }
                                            isCheckedList[i] = false;
                                          }
                                        });
                                      },
                                    ),
                                    style: TextButton.styleFrom(
                                      foregroundColor:  Color(0xFF222222),
                                      backgroundColor: Color(0xFFFFFFFF),
                                      disabledBackgroundColor: Color(0xFFFFFFFF),
                                      disabledForegroundColor: Color(0xFF222222),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1.0, color: Color(0xFFEAEAEA)),
                                      ),
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)
                                    )
                                ),

                                flex: 3,
                              ),
                              Expanded(
                                  child:  TextButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => CompanyPage(companyList[2])
                                      ));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("밀레",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Color(0xFF222222),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                            )),
                                        Icon(Icons.chevron_right)
                                      ],
                                    ),

                                    style: TextButton.styleFrom(
                                      foregroundColor:  Color(0xFF222222),
                                      backgroundColor: Color(0xFFFFFFFF),
                                      disabledBackgroundColor: Color(0xFFFFFFFF),
                                      disabledForegroundColor: Color(0xFF222222),
                                      shape: RoundedRectangleBorder(

                                        side: BorderSide(width: 1.0, color: Color(0xFFEAEAEA)),
                                      ),
                                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0)
                                    ),
                                  ),
                                  flex: 13
                              ),
                            ],
                          ),
                        ),
                      ),

                      Visibility(
                        visible: !electCompleted,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width  - 48,
                          height: 74,

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child:  TextButton(
                                    onPressed: null,
                                    child:  Checkbox(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30)
                                      ),
                                      activeColor: Colors.white,
                                      checkColor: Color(0xFF222222),
                                      value: isCheckedList[3],
                                      onChanged: (value) {
                                        setState(() {
                                          isCheckedList[3] = value ?? true;
                                          if (value == true){
                                            nowCheckedIndex = 3;
                                          }else{
                                            nowCheckedIndex = -1;
                                          }
                                          for( int i = 0; i < isCheckedList.length; i ++){
                                            if (i == 3){
                                              continue;
                                            }
                                            isCheckedList[i] = false;
                                          }
                                        });
                                      },
                                    ),
                                    style: TextButton.styleFrom(
                                      foregroundColor:  Color(0xFF222222),
                                      backgroundColor: Color(0xFFFFFFFF),
                                      disabledBackgroundColor: Color(0xFFFFFFFF),
                                      disabledForegroundColor: Color(0xFF222222),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1.0, color: Color(0xFFEAEAEA)),
                                      ),
                                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)
                                    )
                                ),

                                flex: 3,
                              ),
                              Expanded(
                                  child:  TextButton(
                                    onPressed: (){

                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => CompanyPage(companyList[3])
                                      ));

                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("내셔널 지오그래픽",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Color(0xFF222222),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                            )),
                                        Icon(Icons.chevron_right)
                                      ],
                                    ),

                                    style: TextButton.styleFrom(
                                      foregroundColor:  Color(0xFF222222),
                                      backgroundColor: Color(0xFFFFFFFF),
                                      disabledBackgroundColor: Color(0xFFFFFFFF),
                                      disabledForegroundColor: Color(0xFF222222),
                                      shape: RoundedRectangleBorder(

                                        side: BorderSide(width: 1.0, color: Color(0xFFEAEAEA)),
                                      ),
                                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0)
                                    ),
                                  ),
                                  flex: 13
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Visibility(
                      //   visible: !electCompleted,
                      //   child: SizedBox(
                      //     width: MediaQuery.of(context).size.width  - 48,
                      //     height: 74,
                      //
                      //     child: Row(
                      //       crossAxisAlignment: CrossAxisAlignment.stretch,
                      //       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       children: [
                      //         Expanded(
                      //           child:  TextButton(
                      //               onPressed: null,
                      //               child:  Checkbox(
                      //                 shape: RoundedRectangleBorder(
                      //                     borderRadius: BorderRadius.circular(30)
                      //                 ),
                      //
                      //                 activeColor: Colors.white,
                      //                 checkColor: Color(0xFF222222),
                      //                 value: isCheckedList[4],
                      //                 onChanged: (value) {
                      //                   setState(() {
                      //                     isCheckedList[4] = value ?? true;
                      //                     if (value == true){
                      //                       nowCheckedIndex = 4;
                      //                     }else{
                      //                       nowCheckedIndex = -1;
                      //                     }
                      //                     for( int i = 0; i < isCheckedList.length; i ++){
                      //                       if (i == 4){
                      //                         continue;
                      //                       }
                      //                       isCheckedList[i] = false;
                      //                     }
                      //                   });
                      //                 },
                      //               ),
                      //               style: TextButton.styleFrom(
                      //                 foregroundColor:  Color(0xFF222222),
                      //                 backgroundColor: Color(0xFFFFFFFF),
                      //                 disabledBackgroundColor: Color(0xFFFFFFFF),
                      //                 disabledForegroundColor: Color(0xFF222222),
                      //                 shape: RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.0)),
                      //                   side: BorderSide(width: 1.0, color: Color(0xFFEAEAEA)),
                      //                 ),
                      //                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)
                      //               )
                      //           ),
                      //
                      //           flex: 3,
                      //         ),
                      //         Expanded(
                      //             child:  TextButton(
                      //               onPressed: (){
                      //                 Navigator.push(context, MaterialPageRoute(
                      //                     builder: (context) => CompanyPage(companyList[4])
                      //                 ));
                      //               },
                      //
                      //               child: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                 children: [
                      //                   Text("와이드 앵글",
                      //                       textAlign: TextAlign.start,
                      //                       style: TextStyle(
                      //                         color: Color(0xFF222222),
                      //                         fontWeight: FontWeight.w700,
                      //                         fontSize: 16,
                      //                       )),
                      //                   Icon(Icons.chevron_right)
                      //                 ],
                      //               ),
                      //
                      //               style: TextButton.styleFrom(
                      //                 foregroundColor:  Color(0xFF222222),
                      //                 backgroundColor: Color(0xFFFFFFFF),
                      //                 disabledBackgroundColor: Color(0xFFFFFFFF),
                      //                 disabledForegroundColor: Color(0xFF222222),
                      //                 shape: RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(4.0)),
                      //                   side: BorderSide(width: 1.0, color: Color(0xFFEAEAEA)),
                      //                 ),
                      //                   padding: const EdgeInsets.fromLTRB(8, 0, 8, 0)
                      //               ),
                      //             ),
                      //             flex: 13
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                  Visibility(
                    visible: !electCompleted,
                    child: SizedBox(
                      height: 4
                    )
                  ),

                  // Visibility(
                  //   visible: !electCompleted,
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width  - 60,
                  //     child: Expanded(
                  //       child: SizedBox(
                  //
                  //           width: MediaQuery.of(context).size.width  - 48,
                  //           height: 74,
                  //         child: Text("* 투표시 수정이 불가하므로 신중하게 투표해주세요",
                  //           textAlign: TextAlign.start,
                  //           style: TextStyle(
                  //               color: Color(0xFFEA3535),
                  //               fontSize: 12.0,
                  //               fontWeight: FontWeight.w500
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),





                      // Visibility(
                      //   visible: !electCompleted,
                      //   child: Container(
                      //     height: 70,
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //       crossAxisAlignment: CrossAxisAlignment.stretch,
                      //
                      //       children: [
                      //         Expanded(
                      //           child: ElectTitleOutlinedButton(companyList[2]),
                      //           flex: 6,
                      //         ),
                      //         Expanded(
                      //             child:  ElectExplanationOutlinedButton("보기","EIDER"),
                      //             flex: 4
                      //         ),
                      //         Expanded(
                      //             child: Checkbox(
                      //               activeColor: Colors.white,
                      //               checkColor: Colors.red,
                      //               value: isCheckedList[2],
                      //               onChanged: (value) {
                      //                 setState(() {
                      //                   isCheckedList[2] = value ?? true;
                      //                   if (value == true){
                      //                     nowCheckedIndex = 2;
                      //                   }else{
                      //                     nowCheckedIndex = -1;
                      //                   }
                      //                   for( int i = 0; i < isCheckedList.length; i ++){
                      //                     if (i == 2){
                      //                       continue;
                      //                     }
                      //                     isCheckedList[i] = false;
                      //                   }
                      //                 });
                      //               },
                      //             ),
                      //             flex: 2
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),



                      Visibility(
                          visible: !electCompleted,
                          child: SizedBox(height: 80)
                      ),






                      Visibility(
                        visible: !electCompleted,
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width  - 60,
                            height: 60,
                            child: OutlinedButton(

                              onPressed: () async {
                                //캐시에 저장

                                // Navigator.push(context, MaterialPageRoute(
                                //     builder: (context) => AdminPage()
                                // ));

                                // 관리자이고, 투표를 했었던 경우
                                //
                                if (widget.isAdmin == "1" && widget.voteStatus == "false") {
                                  // showModalBottomSheet(
                                  //   context: context,
                                  //   builder: (BuildContext context) {
                                  //     return Container(
                                  //         height: 300, // 모달 높이 크기
                                  //         margin: const EdgeInsets.only(
                                  //           left: 25,
                                  //           right: 25,
                                  //           bottom: 40,
                                  //         ), // 모달 좌우하단 여백 크기
                                  //         decoration: const BoxDecoration(
                                  //           color: Colors.white, // 모달 배경색
                                  //           borderRadius: BorderRadius.all(
                                  //             Radius.circular(20), // 모달 전체 라운딩 처리
                                  //           ),
                                  //         ),
                                  //         child: Center(
                                  //             child: Text("관리자님 이미 투표하셨습니다.", style: TextStyle(
                                  //                 fontWeight: FontWeight.bold
                                  //             ))
                                  //         ) // 모달 내부 디자인 영역
                                  //     );
                                  //   },
                                  //   backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
                                  // );
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                          height: 300, // 모달 높이 크기
                                          margin: const EdgeInsets.only(
                                            left: 30,
                                            right: 30,
                                            bottom: 140,
                                          ), // 모달 좌우하단 여백 크기
                                          decoration: const BoxDecoration(
                                            color: Colors.white, // 모달 배경색
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16), // 모달 전체 라운딩 처리
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Center(
                                                  child: Text("이미 투표에 참여하셨습니다.",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                  ))
                                              ),
                                              SizedBox(
                                                  height: 30
                                              ),

                                              Center(
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,

                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width  / 3,
                                                        height: 60,
                                                        child: OutlinedButton(

                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text("취소", textAlign: TextAlign.center,style: TextStyle(
                                                              color: Color(0xFF222222),
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 17

                                                          )),

                                                          style: OutlinedButton.styleFrom(
                                                            foregroundColor: Color(0xFF222222),
                                                            backgroundColor: Color(0xFFFFFFFF),
                                                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                          ),

                                                        ),
                                                      ),

                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width  / 12,
                                                      ),

                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width  / 3,
                                                        height: 60,
                                                        child: OutlinedButton(

                                                          onPressed: () {
                                                            Navigator.push(context, MaterialPageRoute(
                                                                builder: (context) => const AdminPage()
                                                            ));
                                                          },
                                                          child: Text("관리페이지",
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                              color: Color(0xFFFFFFFF),
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 18

                                                          )),

                                                          style: OutlinedButton.styleFrom(
                                                            foregroundColor: Color(0xFFFFFFFF),
                                                            backgroundColor: Color(0xFF333333),
                                                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                          ),

                                                        ),
                                                      ),

                                                    ]
                                                ),
                                              )
                                            ],
                                          ) // 모달 내부 디자인 영역
                                      );
                                    },
                                    backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
                                  );


                                  // Navigator.push(context, MaterialPageRoute(
                                  //     builder: (context) => const AdminPage()
                                  // ));
                                }

                                //선택한 항목이 하나도 없는 경우
                                else if(nowCheckedIndex == -1){
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                          height: 300, // 모달 높이 크기
                                          margin: const EdgeInsets.only(
                                            left: 30,
                                            right: 30,
                                            bottom: 140,
                                          ), // 모달 좌우하단 여백 크기
                                          decoration: const BoxDecoration(
                                            color: Colors.white, // 모달 배경색
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16), // 모달 전체 라운딩 처리
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Center(
                                                  child: Text("하나의 제품을\n선택해주세요",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                  ))
                                              ),
                                              SizedBox(
                                                  height: 30
                                              ),

                                              Center(
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,

                                                    children: [

                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width * 2 / 3,
                                                        height: 60,
                                                        child: OutlinedButton(

                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text("확인", textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                              color: Color(0xFFFFFFFF),
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 18

                                                          )),

                                                          style: OutlinedButton.styleFrom(
                                                            foregroundColor: Color(0xFFFFFFFF),
                                                            backgroundColor: Color(0xFF333333),
                                                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                          ),

                                                        ),
                                                      ),

                                                    ]
                                                ),
                                              )
                                            ],
                                          ) // 모달 내부 디자인 영역
                                      );
                                    },
                                    backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
                                  );
                                  // showModalBottomSheet(
                                  //   context: context,
                                  //   builder: (BuildContext context) {
                                  //     return Container(
                                  //         height: 300, // 모달 높이 크기
                                  //         margin: const EdgeInsets.only(
                                  //           left: 25,
                                  //           right: 25,
                                  //           bottom: 40,
                                  //         ), // 모달 좌우하단 여백 크기
                                  //         decoration: const BoxDecoration(
                                  //           color: Colors.white, // 모달 배경색
                                  //           borderRadius: BorderRadius.all(
                                  //             Radius.circular(20), // 모달 전체 라운딩 처리
                                  //           ),
                                  //         ),
                                  //         child: Center(
                                  //             child: Text("하나의 제품을 선택해주세요.", style: TextStyle(
                                  //                 fontWeight: FontWeight.bold
                                  //             ))
                                  //         ) // 모달 내부 디자인 영역
                                  //     );
                                  //   },
                                  //   backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
                                  // );
                                }

                                //이외 모든 경우 ( 투표가 가능함 )
                                // -> 투표 바로 진행하면 됨
                                // 1. 투표내역 table에 추가
                                // 2. 해당 브랜드 count 1추가 (delete하고 해야하면 하고)
                                // 3. 투표했다고 해당사번에 대해 false로 변경
                                // => electCompleted를 true로 바꿔 화면을 업데이트해주고 끝
                                else{

                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                          height: 300, // 모달 높이 크기
                                          margin: const EdgeInsets.only(
                                            left: 30,
                                            right: 30,
                                            bottom: 140,
                                          ), // 모달 좌우하단 여백 크기
                                          decoration: const BoxDecoration(
                                            color: Colors.white, // 모달 배경색
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16), // 모달 전체 라운딩 처리
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Center(
                                                  child: Text("투표시 수정이 불가능합니다\n진행하시겠습니까?",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                      fontWeight: FontWeight.bold
                                                  ))
                                              ),
                                              SizedBox(
                                                  height: 30
                                              ),

                                              Center(
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,

                                                    children: [
                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width  / 3,
                                                        height: 60,
                                                        child: OutlinedButton(

                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text("아니오", textAlign: TextAlign.center, style: TextStyle(
                                                              color: Color(0xFF222222),
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 17

                                                          )),

                                                          style: OutlinedButton.styleFrom(
                                                            foregroundColor: Color(0xFF222222),
                                                            backgroundColor: Color(0xFFFFFFFF),
                                                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                          ),

                                                        ),
                                                      ),

                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width  / 12,
                                                      ),

                                                      SizedBox(
                                                        width: MediaQuery.of(context).size.width  / 3,
                                                        height: 60,
                                                        child: OutlinedButton(

                                                          onPressed: () async {
                                                            Navigator.pop(context);

                                                            final LocalStorage storage = new LocalStorage('myls2');
                                                            storage.setItem("flag", "y");
                                                            print("flag 설정완료");

                                                            // print("------------투표 가능한 경우에 캐시 저장함------------");
                                                            // await DefaultCacheManager().getSingleFile("true~~!!!!", key: "file2");
                                                            // print("------------투표 가능한 경우에 캐시 저장함- 끝남------------");
                                                            // print("------------가져오기------------");
                                                            // await DefaultCacheManager().getFileFromCache('file2').then((cacheLocate) {
                                                            //   print("------------호출함!------------");
                                                            //   print(cacheLocate?.originalUrl);
                                                            //   setState(() {
                                                            //     print(cacheLocate?.originalUrl);
                                                            //   });
                                                            // });
                                                            // print("------------가져오기 끝------------");

                                                            // 1. 투표내역 table에 추가
                                                            CollectionReference cr = FirebaseFirestore.instance.collection("item_final");
                                                            cr.add({
                                                              "eid": widget.sabun,
                                                              "brand": companyList[nowCheckedIndex]
                                                            });

                                                            // 투표했다고 해당 사번에 대해 false로 변경
                                                            // updatePersonalVote(widget.sabun);
                                                            updateCount(companyList[nowCheckedIndex]);
                                                            //
                                                            // sleep(Duration(seconds:2));
                                                            updateView();

                                                          },
                                                          child: Text("예",
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                              color: Color(0xFFFFFFFF),
                                                              fontWeight: FontWeight.w700,
                                                              fontSize: 18

                                                          )),

                                                          style: OutlinedButton.styleFrom(
                                                            foregroundColor: Color(0xFFFFFFFF),
                                                            backgroundColor: Color(0xFF333333),
                                                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                          ),

                                                        ),
                                                      ),

                                                    ]
                                                ),
                                              )
                                            ],
                                          ) // 모달 내부 디자인 영역
                                      );
                                    },
                                    backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
                                  );

                                }
                              },

                              child: Text("투표하기", style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              )
                              ),

                              style: OutlinedButton.styleFrom(
                                foregroundColor: Color(0xFFFFFFFF),
                                backgroundColor: Color(0xFF4CA2E5),
                                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                              ),

                            ),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: !electCompleted,
                          child: SizedBox(height: 50)
                      ),



                      Visibility(
                          visible: electCompleted,
                          child: SizedBox(height: 30)
                      ),

                      Visibility(
                        visible: electCompleted,
                        child: Center(
                          child:  Icon(Icons.check_circle_outline, size: 60)
                        ),
                      ),

                      Visibility(
                          visible: electCompleted,
                          child: SizedBox(height: 20)
                      ),

                      Visibility(
                        visible: electCompleted,
                        child: Center(
                            child: Text("투표완료",
                              style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w700
                              ),

                            )
                        ),
                      ),

                      Visibility(
                          visible: electCompleted,
                          child: SizedBox(height: 10)
                      ),

                      Visibility(
                        visible: electCompleted,
                        child: Center(
                            child: Text("투표가 완료되었습니다.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF666666),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500
                                ))
                        ),
                      ),
                      Visibility(
                          visible: electCompleted,
                          child: SizedBox(height: 2)
                      ),

                      Visibility(
                        visible: electCompleted,
                        child: Center(
                            child: Text("감사합니다.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF666666),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500
                                ))
                        ),
                      ),


                      Visibility(
                          visible: electCompleted,
                          child: SizedBox(height: 160)
                      ),



                      //임직원 인증
                      Visibility(
                        visible: electCompleted,
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width  - 60,
                            height: 60,
                            child: OutlinedButton(
                              onPressed: (){
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (context) => ChartPage()
                                // ));
                                //관리자인 경우에만
                                if (widget.isAdmin == "1"){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => AdminPage()
                                  ));
                                }
                                else{
                                  Navigator.pop(context);
                                }

                              },
                              child: Text( widget.isAdmin == "1" ? "관리자 페이지" : "돌아가기", style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              )),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Color(0xFFFFFFFF),
                                backgroundColor: Color(0xFF333333),
                                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                              ),

                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              )
        ]
      )
    );
  }
}