import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festivalsurvey/widgets/brandNameOutlinedButton.dart';
import 'package:flutter/material.dart';
import 'package:festivalsurvey/widgets/electTitleOutlinedButton.dart';
import 'package:festivalsurvey/widgets/electionColumnOutlinedButton.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CompanyPage extends StatefulWidget {
  // const CompanyDetailPage({Key? key}) : super(key: key);
  var ticker = "";


  CompanyPage(String tk){
    ticker = tk;
  }

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {

  //기본 구성품
  var imgs = [];
  Map<String, List<String>> brand_info = {
    'NATGEO' : ["내셔널 지오그래픽", "자켓, 셔츠, 바지, 모자", "백팩"],
    'MILLET' : ["밀레", "자켓, 셔츠, 바지, 모자", "패딩자켓, 트레이닝복(상,하)"],
    'EIDER' : ["아이더", "자켓, 셔츠, 바지, 모자", "없음"],
    'WDANGL' : ["와이드앵글", "자켓, 셔츠, 바지, 모자", "보스턴백"],
    'FILA' : ["휠라", "자켓, 셔츠, 바지, 모자", "파우치, 골프공, 우산, 양말"]
  };
  //추가 구성품
  var adtnComponents = [];
  var isMillet = false;

  getData() async{
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    await for (var snapshot in firebaseFirestore.collection("image").doc(widget.ticker)
        .snapshots()) {
      setState(() {
        imgs.add(snapshot?["0"]);imgs.add(snapshot?["1"]);imgs.add(snapshot?["2"]);
        adtnComponents.add(snapshot?["3"]);
        if (widget.ticker == "MILLET"){
          adtnComponents.add(snapshot?["4"]);  adtnComponents.add(snapshot?["5"]);
          isMillet = true;
        }
      });
    }
  }


  @override
  void initState(){
    super.initState();
    getData();
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
                    child: Text("구성품 상세보기",
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
                height: 2
            ),

            Container(
              height: 116,
              color: Color(0xFFFFFFFF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    child: Text("브랜드",
                          textAlign: TextAlign.start,

                          style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: Text( brand_info[widget.ticker]![0],
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 26.0,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                  )

                ]
              ),
            ),

            SizedBox(
              height: 40
            ),


            Padding(
              child: Text("기본 구성품",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            ),

            SizedBox(
                height: 8
            ),

             Padding(
               padding: EdgeInsets.fromLTRB(16, 0, MediaQuery.of(context).size.width - 260, 0),
              child: SizedBox(
              width: MediaQuery.of(context).size.width * 19,
              height: 44,
                 child: OutlinedButton(

                        onPressed: (){
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return InteractiveViewer(
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.9,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Image.network(imgs[0],
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height ,
                                        // height: 300
                                      ),
                                      Image.network(imgs[1],
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height ,
                                        // height: 300
                                      ),
                                      Image.network(imgs[2],
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height ,
                                        // height: 300
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(brand_info[widget.ticker]![1],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18
                                )),
                            Icon(Icons.photo)
                            // SvgPicture.network("https://firebasestorage.googleapis.com/v0/b/kisfestival-a86f4.appspot.com/o/ico_gallery.svg?alt=media&token=4f7ef26c-6ed0-4ea0-807b-7952b92c3db2")
                            
                          ],
                        ),

                        style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(width: 1.0, color: Color(0xFFA5D7FF)),
                          ),
                          foregroundColor: Color(0xFFFFFFFF),
                          backgroundColor: Color(0xFF4CA2E5),
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        ),

                      ),
               ),
             ),

            SizedBox(
                height: 32
            ),

            Padding(
              child: Text("추가 구성품",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            ),

            SizedBox(
                height: 8
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, MediaQuery.of(context).size.width - ( (widget.ticker == "MILLET" || widget.ticker == "FILA") ? 290 : 150), 0),
              child: SizedBox(
                // width: MediaQuery.of(context).size.width * 196 / 375,
                height: 44,
                child: OutlinedButton(

                  onPressed: (){
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return InteractiveViewer(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.9,
                            child: ListView(
                              scrollDirection: Axis.horizontal,

                              children: [
                                Image.network(adtnComponents[0],
                                  width: MediaQuery.of(context).size.width ,
                                  height: MediaQuery.of(context).size.height ,
                                  // height: 300
                                ),
                                Visibility(
                                  visible: this.isMillet,
                                  child: Image.network(adtnComponents[1] ?? adtnComponents[0],
                                    width: MediaQuery.of(context).size.width ,
                                    height: MediaQuery.of(context).size.height ,
                                  ),
                                ),

                                Visibility(
                                  visible: this.isMillet,
                                  child: Image.network(adtnComponents[2] ?? adtnComponents[0],
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height ,
                                  ),
                                )

                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(brand_info[widget.ticker]![2],
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w700,
                              fontSize: 18
                          )),
                      Icon(Icons.photo)
                    ],
                  ),

                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      side: BorderSide(width: 1.0, color: Color(0xFFA5D7FF)),
                    ),
                    foregroundColor: Color(0xFFFFFFFF),
                    backgroundColor: Color(0xFF4CA2E5),
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  ),
                ),
              ),
            ),




            SizedBox(
              height: 32
            ),

            Padding(
              child: Text("* 이미지는 확대해서 보실 수 있습니다.",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xFFEA3535),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            ),

            SizedBox(
              height: 120
            ),

            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width  - 60,
                height: 60,
                child: OutlinedButton(

                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("목록으로", style: TextStyle(
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

            SizedBox(height: 60),

          ],
        ),


    );
  }
}






