import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
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
        home: Scaffold(
            appBar: AppBar(),
            body: Container(
                height: 150,
                padding: EdgeInsets.all(10),
                child: Row(
                    children: [
                      Flexible(
                          child: Image.asset('splash2.png'),
                          flex: 5
                      ),
                      Flexible(
                          child: Container(
                              width: 600,
                              color: Colors.red,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("카메라 팝니다"),
                                    Text("금호동 3가"),
                                    Text("7000원"),
                                    Text("아이콘이랑 글자"),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(Icons.favorite),
                                          Text("4")
                                        ]
                                    )
                                  ]
                              )
                          ), flex: 5
                      )
                    ]
                )
            )



        )
    );
  }
}

// function
class ShopItem extends StatelessWidget {
  const ShopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Text("안녕a")
    );
  }
}