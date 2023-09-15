import 'package:festivalsurvey/companyPage.dart';
import 'package:festivalsurvey/electPage.dart';
import 'package:flutter/material.dart';
import 'package:festivalsurvey/application.dart';
import 'package:festivalsurvey/firebase_options.dart';
import 'package:festivalsurvey/signInPage.dart';
import 'package:festivalsurvey/companyDetailPage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            themeMode: ThemeMode.light,
            darkTheme: ThemeData(brightness: Brightness.light),
            theme: ThemeData(
              brightness: Brightness.light
            ),
            // home: CompanyDetailPage(),
            //   home: ApplicationPage(),
            home: SignInPage(),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            themeMode: ThemeMode.light,
            darkTheme: ThemeData(brightness: Brightness.light),
            theme: ThemeData(
                brightness: Brightness.light
            ),
            // home: CompanyDetailPage(),
            //   home: ApplicationPage(),


            home: SignInPage(),
            // home: ElectPage("113225", "1", "false"),
            // home: CompanyPage("MILLET")
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          themeMode: ThemeMode.light,
          darkTheme: ThemeData(brightness: Brightness.light),
          theme: ThemeData(
              brightness: Brightness.light
          ),
          // home: CompanyDetailPage(),
          //   home: ApplicationPage(),
          home: SignInPage(),
        );
      },
    );
  }
}
