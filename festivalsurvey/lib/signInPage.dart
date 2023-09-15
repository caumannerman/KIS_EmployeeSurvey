// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:festivalsurvey/adminPage.dart';
import 'package:festivalsurvey/electPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var sabun = "";
  var sabun2 = "";
  var didVote = false;
  String? flag = "n";
  final LocalStorage storage =  LocalStorage('myls2');


  //
  // putCache() async{
  //   print("캐시설정");
  //   await DefaultCacheManager().getSingleFile("true", key: "file1");
  //   print("캐시설정 완료");
  //   return;
  // }
  //
  // getCache() async{
  //   print("호출~");
  //   await DefaultCacheManager().getFileFromCache('file1').then((cacheLocate) {
  //     print("호출함!");
  //     print(cacheLocate?.originalUrl);
  //     setState(() {
  //       cacheDidVote = cacheLocate?.originalUrl ?? "null";
  //     });
  //   });
  //   return;
  // }

  getFlag() async{
    print("getFlag_s");

    setState(() {
      flag = storage.getItem("flag");
    });
    print("getFlag_e");
    return;
  }

  //투표내역을 통해 투표했는지 확인
  certificate() async{
    print("certificate");
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await for (var snapshot in firebaseFirestore.collection("item_final").where("eid", isEqualTo: sabun).snapshots()) {
      // if (snapshot.docs[0] == null){
      //
      // }
      //var now = snapshot.docs[0];
      print( snapshot.docs.length == 0 );
      //투표한 적 없다는 것
      if (snapshot.docs.length == 0){
        setState(() {
          didVote = false;
        });
        print("vote false");
      }
      // 투표한 적 있다는 것
      else{
        setState(() {
          didVote = true;
        });
        print("vote true");
      }
      print("certificate_e");
      return;
    }
  }

  // 1. item(투표내역)에서 내 사번으로 투표한 적 있는지 먼저 확인( sabun필드에 일치하는 것이 있는지 확인)하고 didVote 업데이트
  // 2. 입력된 사번으로 user테이블에서 (회원이 있는지) 확인
  // 3. 해당 사번이 있는 경우, "재직중"인지를 확인
  // 4. 투표했는지 확인(미리 확인한 didVote를 통해)하고,
  // 투표 안 한 사람은 다음화면으로, 투표 했었다면 "이미 투표했다"라는 문구 표시


  loginOnePerson(BuildContext context) async {
    print("loginOnePerson_s");
    if(didVote){
      print("vote여부 true입니다");
    }
    else{
      print("vote여부 false입니다");
    }

    await for (var snapshot in firebaseFirestore.collection("user").doc(sabun).snapshots()) {
      var now = snapshot.data();
      print(now?["admin"]);
      print(now?["eid"]);
      print(now?["works"]);
      print(now?["status"]);

      if (now?["eid"] == null) {
        print("1");
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
                child: Center(
                    child: Text("해당 사번이 존재하지 않습니다.", style: TextStyle(
                        fontWeight: FontWeight.bold
                    ))
                ) // 모달 내부 디자인 영역
            );
          },
          backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
        );
      }
      else if (now?["works"] != "재직"){
        print("2");
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
                child: Center(
                    child: Text("재직중이 아니라면 투표가 불가능니다.", style: TextStyle(
                        fontWeight: FontWeight.bold
                    ))
                ) // 모달 내부 디자인 영역
            );
          },
          backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
        );
      }//투표 했고, 관리자도 아니라면 로그인 불가능하게
      else if ( didVote && now?["admin"] == "0" ){
        print("3");
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
                child: Center(
                    child: Text("이미 투표에 참여하셨습니다.", style: TextStyle(
                        fontWeight: FontWeight.bold
                    ))
                ) // 모달 내부 디자인 영역
            );
          },
          backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
        );
      }
      // //투표했고, 관리자라면, 관리자페이지로 바로넘겨줌
      // else if ( didVote && now?["admin"] == "1"){
      //   //관리자인 경우에만
      //
      //   Navigator.push(context, MaterialPageRoute(
      //       builder: (context) => const AdminPage()
      //   ));
      //
      //
      // }

      //투표에 참여하지 않은 비관리자 / 관리자(투표여부 상관없음) 로그인 가능하게
      else{
        print("4");
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ElectPage(now?["eid"], now?["admin"], didVote ? "false" : "true")
        ));
      }
      print("loginOnePerson_e");
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // darkTheme: ThemeData(brightness: Brightness.light),
        // themeMode: ThemeMode.light,
        // theme: ThemeData(
        //   brightness: Brightness.light,
        // ),
      builder: (context, child) {
        return MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
        home: Scaffold(
            backgroundColor: Color(0xFFF5F5F5),
            // appBar: AppBar(),
            body: ListView(
              children: [
                // Image.network('https://firebasestorage.googleapis.com/v0/b/kisfestival-a86f4.appspot.com/o/ci1.jpeg?alt=media&token=aa832798-e2ae-42ad-bc27-1ffd7a6c6f19',
                //     width: MediaQuery.of(context).size.width / 3,
                //     height: 50
                // ),
                // SizedBox(height: 10),

                Container(
                  color: Color(0xFFFFFFFF),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [



                    // SvgPicture.asset('../assets/logo_img.svg')


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

               Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width  - 60,
                      height: 52,
                      child: TextButton(
                        onPressed: null,
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFF208ADD),
                          backgroundColor: const Color(0xFFFFFFFF),
                          disabledForegroundColor: const Color(0xFF208ADD),
                          disabledBackgroundColor:  const Color(0xFFFFFFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            side: const BorderSide(width: 1.0, color: Color(0xFFA5D7FF)),
                          )
                        ),

                        // child: Text('3월 2일(목) ~ 3월 3일(금) 16:00까지'),
                        child: Text('3월 8일(수) 09:00 ~ 16:00까지'),
                      ),
                    ),
                  ),

                SizedBox(
                    height: 40
                ),

                // 사번
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width  - 60,
                    height: 120,
                    child: TextField(
                      onChanged: (val) => {
                        sabun = val
                      },
                      textAlign: TextAlign.start,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\d]')),
                      ],
                      style: TextStyle(
                        //여기
                          // color: Color(0xFF000000),
                        color: Theme.of(context).brightness == Brightness.light ? Color(0xFF666666) : Color(0xFFAA4A6E),
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      maxLength: 6,
                      decoration: InputDecoration(
                        labelText: "사번",
                        alignLabelWithHint: true,
                        //여기
                        // labelStyle: TextStyle( color: Color(0xFF222222)),
                        labelStyle: TextStyle( color: Color(0xFF888888)),
                        contentPadding: EdgeInsets.fromLTRB(10, 40, 10, 40),
                        hintText: "입력해주세요",
                        hintStyle: TextStyle(color: Color(0xFFAAAAAA)),


                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6.0)),
                            borderSide: BorderSide(color: Color(0xffEAEAEA))
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFEAEAEA),
                                width: 1.0
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6.0)),
                            borderSide: BorderSide(color: Color(0xFFEAEAEA),
                                width: 1.0)
                        ),

                          filled: true,
                          fillColor: Color(0xffFFFFFF),

                      ),
                      autofocus: true,
                    ),
                  ),
                ),

                SizedBox(
                  height: 20
                ),

                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width  - 60,
                    height: 120,
                    child: TextField(
                      onChanged: (val) => sabun2 = val,
                      textAlign: TextAlign.start,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\d]')),
                      ],
                      style: TextStyle(
                        //여기
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      maxLength: 6,
                      decoration: InputDecoration(
                        //여기
                        labelText: "사번 확인",
                        alignLabelWithHint: true,
                        labelStyle: TextStyle( color: Color(0xFF888888)
                        ),
                        contentPadding: EdgeInsets.fromLTRB(10, 40, 10, 40),
                        hintText: "다시 입력해주세요",
                        hintStyle: TextStyle(color: Color(0xFFAAAAAA)),


                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6.0)),
                            borderSide: BorderSide(color: Color(0xffEAEAEA))
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFEAEAEA),
                                width: 1.0
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6.0)),
                            borderSide: BorderSide(color: Color(0xFFEAEAEA),
                                width: 1.0)
                        ),

                        filled: true,
                        fillColor: Color(0xffFFFFFF),

                      ),
                      autofocus: true,
                    ),
                  ),
                ),




                SizedBox(
                  height: 24,
                ),

                const Center(
                    child: Text("담당자 : 총무부 김동건(02-3276-6070)",  style: TextStyle(color: Color(0xffaaaaaa)), )
                ),
                SizedBox(
                  height: 6,
                ),
                const Center(
                    child: Text("만든이 : FY22하반기 일반공채 신입사원",  style: TextStyle(color: Color(0xffaaaaaa)), )
                ),
                SizedBox(
                  height: 6,
                ),
                const Center(
                    child: Text("WEB 서비스 기획 : 채용교육부",  style: TextStyle(color: Color(0xffaaaaaa)), )
                ),



                // 주민등록번호 앞 6자리, 뒷 1자리
                // Center(
                //     child: Padding(
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           Container(
                //             width: MediaQuery.of(context).size.width * 2 / 5,
                //             child: TextField(
                //               maxLength: 6,
                //               decoration: InputDecoration(
                //                   labelText: "주민등록번호 앞 6자리"
                //               ),
                //             ),
                //           ),
                //
                //           SizedBox(width: 10),
                //           Text(" - "),
                //           SizedBox(width: 10),
                //           //제품상세페이지 띄워줘야한다.
                //           Container(
                //             width: MediaQuery.of(context).size.width * 1 / 5,
                //             child: TextField(
                //               maxLength: 1,
                //               decoration: InputDecoration(
                //                   labelText: "뒷 1자리"
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       padding: EdgeInsets.all(20.0),
                //     ),
                //   ),
                SizedBox(
                  height: 80
                ),

                //임직원 인증
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width  - 60,
                    height: 60,
                    child: OutlinedButton(

                      onPressed: () async{




                        //////////////////////// 여기는 투표종료 ////////////////////////////////
                        //////////////////////// 여기는 투표종료 ////////////////////////////////
                        //////////////////////// 여기는 투표종료 ////////////////////////////////

                          if(sabun == "admin" && sabun2 == "admin1"){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => AdminPage()
                            ));}
                          else{
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
                                    child: Center(
                                        child: Text("투표가 종료되었습니다", style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ))
                                    ) // 모달 내부 디자인 영역
                                );
                              },
                              backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
                            );

                          }

                        //////////////////////// 여기는 투표종료 ////////////////////////////////
                        //////////////////////// 여기는 투표종료 ////////////////////////////////
                        //////////////////////// 여기는 투표종료 ////////////////////////////////

                        // if(sabun != sabun2){
                        //
                        //   if(sabun == "admin" && sabun2 == "admin1"){
                        //     Navigator.push(context, MaterialPageRoute(
                        //         builder: (context) => AdminPage()
                        //     ));}
                        //
                        //   else{
                        //     showModalBottomSheet(
                        //       context: context,
                        //       builder: (BuildContext context) {
                        //         return Container(
                        //             height: 300, // 모달 높이 크기
                        //             margin: const EdgeInsets.only(
                        //               left: 25,
                        //               right: 25,
                        //               bottom: 40,
                        //             ), // 모달 좌우하단 여백 크기
                        //             decoration: const BoxDecoration(
                        //               color: Colors.white, // 모달 배경색
                        //               borderRadius: BorderRadius.all(
                        //                 Radius.circular(20), // 모달 전체 라운딩 처리
                        //               ),
                        //             ),
                        //             child: Center(
                        //                 child: Text("사번이 일치하지 않습니다", style: TextStyle(
                        //                     fontWeight: FontWeight.bold
                        //                 ))
                        //             ) // 모달 내부 디자인 영역
                        //         );
                        //       },
                        //       backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
                        //     );
                        //   }
                        // }
                        //
                        //
                        // //사번이 같음
                        // else{
                        //   // if(now_flag == "y"){
                        //   //   print("맞음");
                        //   // }else{
                        //   //   print("틀림");
                        //   // }
                        //
                        //
                        //   // final LocalStorage storage =  LocalStorage('myls');
                        //   //
                        //   // var now_flag = await storage.getItem("flag");
                        //   await getFlag();
                        //   print("flag = ");
                        //   print(storage.getItem("flag"));
                        //   print(flag);
                        //   if(flag == "y"){
                        //     print("맞음");
                        //   }else{
                        //     print("틀림");
                        //   }
                        //
                        //
                        //   //flag가 있는 경우
                        //   if(flag == "y" ){
                        //     showModalBottomSheet(
                        //       context: context,
                        //       builder: (BuildContext context) {
                        //         return Container(
                        //             height: 300, // 모달 높이 크기
                        //             margin: const EdgeInsets.only(
                        //               left: 25,
                        //               right: 25,
                        //               bottom: 40,
                        //             ), // 모달 좌우하단 여백 크기
                        //             decoration: const BoxDecoration(
                        //               color: Colors.white, // 모달 배경색
                        //               borderRadius: BorderRadius.all(
                        //                 Radius.circular(20), // 모달 전체 라운딩 처리
                        //               ),
                        //             ),
                        //             child: Center(
                        //                 child: Text("이미 투표하셨습니다.", style: TextStyle(
                        //                     fontWeight: FontWeight.bold
                        //                 ))
                        //             ) // 모달 내부 디자인 영역
                        //         );
                        //       },
                        //       backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
                        //     );
                        //     print("투표이미 했음");
                        //
                        //   }
                        //   //flag가 없는 경우
                        //   else{
                        //     print("여기 걸림");
                        //     await certificate();
                        //     await loginOnePerson(context);
                        //   }
                        //   // await certificate();
                        //   // await loginOnePerson(context);
                        //
                        // }
                        // Navigator.push(context, MaterialPageRoute(
                        //     builder: (context) => ElectPage("113225", "1", "false")
                        // ));
                      },
                      child: Text("임직원 인증", style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w700,
                        fontSize: 18
                      )),

                      style: OutlinedButton.styleFrom(
                          foregroundColor: Color(0xFFFFFFFF),
                          backgroundColor: Color(0xFF4CA2E5),
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      ),

                    ),
                  ),
                ),

                SizedBox(
                  height: 50
                )

              ],
              // height: 150,
              // padding: EdgeInsets.all(10),
            )
        )
    );
  }
}

//
//
// class SignInPage extends StatelessWidget {
//
//   // const SignInPage({Key? key}) : super(key: key);
//   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//   var sabun = "";
//
//   init(){
//     final firebaseFirestore = FirebaseFirestore.instance;
//         //.instance.collection('user').doc("113223").snapshots();
//     // print(collectionStream);
//   }
//
//   certificate() async{
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//
//     await for (var snapshot in firebaseFirestore.collection("item")
//         .snapshots()) {
//       var idx = 0;
//       for (var col in snapshot.docs){
//         print(col?["brand"]);
//         print(col?["eid"]);
//         // brandList.add(col?["brand"]);
//         // brandList.add(col?["count"]);
//
//
//         idx += 1;
//       }
//     }
//   }
//
//   // void loginStream() async {
//   //   await for (var snapshot in firebaseFirestore.collection("user").snapshots()) {
//   //       for ( var message in snapshot.docs){
//   //         print(message.data());
//   //       }
//   //   }
//   // }
//
//   void loginOnePerson(BuildContext context) async {
//
//     await for (var snapshot in firebaseFirestore.collection("user").doc(this.sabun).snapshots()) {
//         var now = snapshot.data();
//         print(now?["admin"]);
//         print(now?["eid"]);
//         print(now?["works"]);
//         print(now?["status"]);
//
//         if (now?["eid"] == null) {
//           showModalBottomSheet(
//             context: context,
//             builder: (BuildContext context) {
//               return Container(
//                 height: 300, // 모달 높이 크기
//                 margin: const EdgeInsets.only(
//                   left: 25,
//                   right: 25,
//                   bottom: 40,
//                 ), // 모달 좌우하단 여백 크기
//                 decoration: const BoxDecoration(
//                   color: Colors.white, // 모달 배경색
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(20), // 모달 전체 라운딩 처리
//                   ),
//                 ),
//                 child: Center(
//                   child: Text("해당 사번이 존재하지 않습니다.", style: TextStyle(
//                     fontWeight: FontWeight.bold
//                   ))
//                 ) // 모달 내부 디자인 영역
//               );
//             },
//             backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
//           );
//         }
//         else if (now?["works"] != "재직"){
//           showModalBottomSheet(
//             context: context,
//             builder: (BuildContext context) {
//               return Container(
//                   height: 300, // 모달 높이 크기
//                   margin: const EdgeInsets.only(
//                     left: 25,
//                     right: 25,
//                     bottom: 40,
//                   ), // 모달 좌우하단 여백 크기
//                   decoration: const BoxDecoration(
//                     color: Colors.white, // 모달 배경색
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20), // 모달 전체 라운딩 처리
//                     ),
//                   ),
//                   child: Center(
//                       child: Text("재직중이 아니라면 투표가 불가능니다.", style: TextStyle(
//                           fontWeight: FontWeight.bold
//                       ))
//                   ) // 모달 내부 디자인 영역
//               );
//             },
//             backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
//           );
//         }//투표 했고, 관리자도 아니라면 로그인 불가능하게
//         else if ( now?["status"] == "false" && now?["admin"] == "0" ){
//           showModalBottomSheet(
//             context: context,
//             builder: (BuildContext context) {
//               return Container(
//                   height: 300, // 모달 높이 크기
//                   margin: const EdgeInsets.only(
//                     left: 25,
//                     right: 25,
//                     bottom: 40,
//                   ), // 모달 좌우하단 여백 크기
//                   decoration: const BoxDecoration(
//                     color: Colors.white, // 모달 배경색
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(20), // 모달 전체 라운딩 처리
//                     ),
//                   ),
//                   child: Center(
//                       child: Text("이미 투표에 참여하셨습니다.", style: TextStyle(
//                           fontWeight: FontWeight.bold
//                       ))
//                   ) // 모달 내부 디자인 영역
//               );
//             },
//             backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
//           );
//         }
//         //투표에 참여하지 않은 비관리자 / 관리자(투표여부 상관없음) 로그인 가능하게
//         else{
//           Navigator.push(context, MaterialPageRoute(
//               builder: (context) => ElectPage(now?["eid"], now?["admin"], now?["status"])
//           ));
//         }
//       // print(snapshot.data());
//       //   if
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(),
//           body: ListView(
//             children: [
//               Image.asset('../assets/ci.jpeg',
//                 width: MediaQuery.of(context).size.width / 3,
//                 height: 50
//               ),
//               SizedBox(height: 10),
//
//               Container(
//                 height: 50,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//
//                   children: [
//                     Image.asset('../assets/ci3.png',
//                         width: MediaQuery.of(context).size.width / 3,
//                         height: 50
//                     ),
//
//                     Container(
//                         alignment: Alignment.center,
//                         width:  MediaQuery.of(context).size.width / 3,
//                         height: 50,
//                         child: Text("FESTIVAL",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: Colors.black87,
//                               fontSize: 30.0,
//                               fontWeight: FontWeight.bold
//                           ),
//                         )
//                     ),
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 20),
//
//
//
//                 Center(
//                     child: Text("임직원 전용 신청 페이지",
//                       style: TextStyle(
//                         color: Colors.black87,
//                         fontSize: 32.0,
//                         fontWeight: FontWeight.bold
//                       ),
//                     )
//                 ),
//                 ElevatedButton(
//                   onPressed: () { },
//                   child: Text('5월 1일(월) ~ 5월 10일(수) 17:00까지'),
//                 ),
//                 // 이름 입력
//                 // Center(
//                 //   child: Padding(
//                 //     child: TextField(
//                 //       decoration: InputDecoration(
//                 //           labelText: "이름"
//                 //       ),
//                 //     ),
//                 //     padding: EdgeInsets.all(20.0),
//                 //   ),
//                 // ),
//
//
//                 // 사번
//                 Center(
//                   child: Padding(
//                     child: TextField(
//                       onChanged: (val) => sabun = val,
//                       maxLength: 6,
//                       decoration: InputDecoration(
//                           labelText: "사번"
//                       ),
//                     ),
//                     padding: EdgeInsets.all(20.0),
//                   ),
//                 ),
//
//
//                 // 주민등록번호 앞 6자리, 뒷 1자리
//               // Center(
//               //     child: Padding(
//               //       child: Row(
//               //         mainAxisAlignment: MainAxisAlignment.start,
//               //         children: [
//               //           Container(
//               //             width: MediaQuery.of(context).size.width * 2 / 5,
//               //             child: TextField(
//               //               maxLength: 6,
//               //               decoration: InputDecoration(
//               //                   labelText: "주민등록번호 앞 6자리"
//               //               ),
//               //             ),
//               //           ),
//               //
//               //           SizedBox(width: 10),
//               //           Text(" - "),
//               //           SizedBox(width: 10),
//               //           //제품상세페이지 띄워줘야한다.
//               //           Container(
//               //             width: MediaQuery.of(context).size.width * 1 / 5,
//               //             child: TextField(
//               //               maxLength: 1,
//               //               decoration: InputDecoration(
//               //                   labelText: "뒷 1자리"
//               //               ),
//               //             ),
//               //           ),
//               //         ],
//               //       ),
//               //       padding: EdgeInsets.all(20.0),
//               //     ),
//               //   ),
//
//                 //임직원 인증
//                 Center(
//                   child: OutlinedButton(
//                     onPressed: (){
//
//                       // Navigator.push(context, MaterialPageRoute(
//                       //   builder: (context) => ChartPage()
//                       // ));
//                       print("clicked");
//                       // Stream collectionStream = FirebaseFirestore.instance.collection('user').doc("113223").snapshots();
//                       // print(collectionStream);
//                       // loginStream();
//                       loginOnePerson(context);
//
//
//                       // Navigator.push(context, MaterialPageRoute(
//                       //     builder: (context) => ElectPage()
//                       // ));
//                     },
//                     child: Text("임직원 인증", style: TextStyle(color: Colors.brown)),
//                     style: OutlinedButton.styleFrom(
//                         foregroundColor: Colors.black,
//                         backgroundColor: Colors.greenAccent,
//                         padding: const EdgeInsets.all(25)),
//
//                   ),
//                 ),
//
//                 const Center(
//                     child: Text("담당자 : 총무부 XXX(02-3276-XXXX)",  style: TextStyle(color: Color(0xffb17fc8)), )
//                 ),
//
//                 const Center(
//                     child: Text("WEB SERVICE 기획 : 채용교육부",  style: TextStyle(color: Color(0xff000000)), )
//                 ),
//
//                 const Center(
//                     child: Text("만든이 : FY2022 하반기 Digital 신입사원",  style: TextStyle(color: Color(0xff000000)), )
//                 )
//
//               ],
//
//               // height: 150,
//               // padding: EdgeInsets.all(10),
//             )
//         )
//     );
//   }
// }
//
