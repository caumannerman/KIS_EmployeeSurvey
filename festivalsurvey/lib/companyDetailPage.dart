import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:festivalsurvey/widgets/brandNameOutlinedButton.dart';
import 'package:flutter/material.dart';
import 'package:festivalsurvey/widgets/electTitleOutlinedButton.dart';
import 'package:festivalsurvey/widgets/electionColumnOutlinedButton.dart';
import 'package:firebase_storage/firebase_storage.dart';


class CompanyDetailPage extends StatefulWidget {
  // const CompanyDetailPage({Key? key}) : super(key: key);
  var ticker = "";


  CompanyDetailPage(String tk){
    ticker = tk;
  }

  @override
  State<CompanyDetailPage> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage> {

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
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("단체복 제안")),
      body: InteractiveViewer(
        child: ListView(
          children: [
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: BrandNameOutlinedButton("브랜드명"),
                    flex: 1,
                  ),
                  Expanded(
                      child:  ElectTitleOutlinedButton(brand_info[widget.ticker]![0]),
                      flex: 2
                  ),
                ],
              ),
            ),

            // Container(
            //   height: 60,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       Expanded(
            //         child: ElectionColumnOutlinedButton("구성"),
            //         flex: 1,
            //       ),
            //       Expanded(
            //           child:  ElectTitleOutlinedButton("자켓/티셔츠/하의/모"),
            //           flex: 2
            //       ),
            //       Expanded(
            //         child: ElectionColumnOutlinedButton("출시"),
            //         flex: 1,
            //       ),
            //       Expanded(
            //           child:  ElectTitleOutlinedButton("2019 SS신상품"),
            //           flex: 2
            //       ),
            //     ],
            //   ),
            // ),

            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ElectionColumnOutlinedButton("기본 구성품"),
                    flex: 6,
                  ),
                  Expanded(
                      child:  ElectTitleOutlinedButton(brand_info[widget.ticker]![1]),
                      flex: 9
                  ),
                  Expanded(
                    child: OutlinedButton(

                      child: Text("자세히", style: TextStyle(color: Colors.brown)),
                      style: OutlinedButton.styleFrom(
                        alignment: Alignment.center,
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)
                      ),

                      onPressed: (){
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return InteractiveViewer(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * 0.8,
                                child: ListView(
                                  children: [
                                    Image.network(imgs[0],
                                    width: MediaQuery.of(context).size.width - 10,
                                    // height: 300
                                    ),
                                    Image.network(imgs[1],
                                        width: MediaQuery.of(context).size.width - 10,
                                        // height: 300
                                    ),
                                    Image.network(imgs[2],
                                        width: MediaQuery.of(context).size.width - 10,
                                        // height: 300
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },

                    ),
                        flex: 3,
                  )
                ],
              ),
            ),

            Container(
              // 수평적으로 대칭(symmetric)의 마진을 추가 -> 화면 위, 아래에 20픽세의 마진 삽입
              margin: EdgeInsets.symmetric(vertical: 6.0),
              // 컨테이너의 높이를 200으로 설정
              height: 460.0,
              // 리스트뷰 추가
              child: ListView(
                // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
                scrollDirection: Axis.horizontal,
                // 컨테이너들을 ListView의 자식들로 추가
                children: <Widget>[

                  Container(
                    // width: 160.0,
                    height: 460,
                    child: Image.network(imgs[0]),

                  ),

                  Container(
                    // width: 160.0,
                    height: 460,
                    child:Image.network(imgs[1]),
                  ),

                  Container(
                    height: 460,
                    child:Image.network(imgs[2]),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 2),

            // 추가 구성품
            Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ElectionColumnOutlinedButton("추가 구성품"),
                 flex: 6,
                ),
                Expanded(
                    child:  ElectTitleOutlinedButton(brand_info[widget.ticker]![2]),
                    flex: 9
                ),

                Expanded(
                  child: OutlinedButton(

                    child: Text("자세히", style: TextStyle(color: Colors.brown)),
                    style: OutlinedButton.styleFrom(
                        alignment: Alignment.center,
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0)
                    ),

                    onPressed: (){
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return InteractiveViewer(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: ListView(
                                children: [
                                  Image.network(adtnComponents[0],
                                    width: MediaQuery.of(context).size.width - 10,
                                    // height: 300
                                  ),
                                  Visibility(
                                    visible: this.isMillet,
                                    child: Image.network(adtnComponents[1] ?? adtnComponents[0],
                                    width: MediaQuery.of(context).size.width - 10,
                                  ),
                                  ),

                                  Visibility(
                                    visible: this.isMillet,
                                    child: Image.network(adtnComponents[2] ?? adtnComponents[0],
                                      width: MediaQuery.of(context).size.width - 10,
                                    ),
                                  )
                                  // Image.network(imgs[1],
                                  //   width: MediaQuery.of(context).size.width - 10,
                                  //   // height: 300
                                  // ),
                                  // Image.network(imgs[2],
                                  //   width: MediaQuery.of(context).size.width - 10,
                                  //   // height: 300
                                  // ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  flex: 3,
                )
              ],
            ),
          ),


        Visibility(
          visible: !isMillet,
          child: Container(
              child: Image.network(adtnComponents[0])
            )
        ),

            Visibility(
              visible: isMillet,
              child: Container(
                // 수평적으로 대칭(symmetric)의 마진을 추가 -> 화면 위, 아래에 20픽세의 마진 삽입
                margin: EdgeInsets.symmetric(vertical: 6.0),
                // 컨테이너의 높이를 200으로 설정
                height: 450.0,
                // 리스트뷰 추가
                child: ListView(
                  // 스크롤 방향 설정. 수평적으로 스크롤되도록 설정
                  scrollDirection: Axis.horizontal,
                  // 컨테이너들을 ListView의 자식들로 추가
                  children: <Widget>[
                    Container(
                      height: 450,
                      child:Image.network(adtnComponents[0]),
                    ),
                    Container(
                      height: 450,
                      child:Image.network( adtnComponents[1] ?? adtnComponents[0] ),
                    ),
                    Container(
                      height: 450,
                      child:Image.network(adtnComponents[2] ?? adtnComponents[0]),
                    ),
                  ],
                ),
              ),
            ),



            // SizedBox(height: 20),
            //
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 240,
            //   child: Text("설명 Text"),
            //   color: Colors.greenAccent,
            // ),
            SizedBox(height: 60),

          ],
        ),
      ),

    );
  }
}






