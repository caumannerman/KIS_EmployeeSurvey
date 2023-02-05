import 'package:flutter/material.dart';

class CompanyDetailPage extends StatelessWidget {
  const CompanyDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("나이키",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 32.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Row(
            children:[
              Image.asset('../assets/splash2.png',
                  width: MediaQuery.of(context).size.width / 3,
                  height: 50
              ),
              Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
            ]
          ),
          Row(
              children:[
                Image.asset('../assets/splash2.png',
                    width: MediaQuery.of(context).size.width / 3,
                    height: 50
                ),
                Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
              ]
          ),
          Row(
              children:[
                Image.asset('../assets/splash2.png',
                    width: MediaQuery.of(context).size.width / 3,
                    height: 50
                ),
                Text("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
              ]
          )
        ],
      )
    );
  }
}
