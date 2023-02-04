import 'package:flutter/material.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
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
            ]
        )
    );
  }
}
