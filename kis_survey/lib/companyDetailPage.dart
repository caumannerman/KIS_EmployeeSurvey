import 'package:flutter/material.dart';
import 'package:kis_survey/widgets/electTitleOutlinedButton.dart';
import 'package:kis_survey/widgets/electionColumnOutlinedButton.dart';

class CompanyDetailPage extends StatelessWidget {
  const CompanyDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("남성복 제안")),
      body: ListView(
          children: [
          Image.asset('../assets/ci.jpeg',
          width: MediaQuery.of(context).size.width / 3,
          height: 50
          ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElectionColumnOutlinedButton("업체명"),
                  flex: 2,
                ),
                Expanded(
                    child:  ElectTitleOutlinedButton("빈폴(조운어패럴)"),
                    flex: 3
                ),
                Expanded(
                  child: ElectionColumnOutlinedButton("제조사"),
                  flex: 2,
                ),
                Expanded(
                    child:  ElectTitleOutlinedButton("삼성물산(패션부문)"),
                    flex: 3
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElectionColumnOutlinedButton("구성"),
                  flex: 2,
                ),
                Expanded(
                    child:  ElectTitleOutlinedButton("자켓/티셔츠/하의/모"),
                    flex: 3
                ),
                Expanded(
                  child: ElectionColumnOutlinedButton("출시"),
                  flex: 2,
                ),
                Expanded(
                    child:  ElectTitleOutlinedButton("2019 SS신상품"),
                    flex: 3
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Image.asset('../assets/splash2.png',
                      // width: MediaQuery.of(context).size.width / 4,
                      height: 250
                  ),
                  flex: 2,
                ),
                Expanded(
                    child:  Container(
                      // width: MediaQuery.of(context).size.width / 2,
                      height: 250,
                      color: Colors.greenAccent
                    ),
                    flex: 3
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Image.asset('../assets/splash2.png',
                      // width: MediaQuery.of(context).size.width / 4,
                      height: 250
                  ),
                  flex: 2,
                ),
                Expanded(
                    child:  Container(
                      // width: MediaQuery.of(context).size.width / 2,
                        height: 250,
                        color: Colors.lightBlueAccent,
                        child: Text("로렘입숨\n 로렘입숨2\n 로렘입숨3"),
                    ),
                    flex: 3
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Image.asset('../assets/splash2.png',
                      // width: MediaQuery.of(context).size.width / 4,
                      height: 250
                  ),
                  flex: 2,
                ),
                Expanded(
                    child:  Container(
                      // width: MediaQuery.of(context).size.width / 2,
                        height: 250,
                        color: Colors.yellowAccent
                    ),
                    flex: 3
                ),
              ],
            ),



          ],
      ),

    );
  }
}
