import 'dart:io';
import 'package:flutter/material.dart';
import 'package:inblex_app/shared/shared_preferences_manager.dart';

import 'package:inblex_app/pages/home_page.dart';
import 'package:inblex_app/pages/login_page.dart';

class SplashScreenPage extends StatelessWidget {
//   @override
//   _SplashScreenPageState createState() => _SplashScreenPageState();
// }

// class _SplashScreenPageState extends State<SplashScreenPage> {
//   @override
//   void initState() {

//     redirectLoadingUser();

//     super.initState();
//   }

//   redirectLoadingUser() {
//     Future.delayed(Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//           context, PageRouteBuilder(pageBuilder: (_, __, ___) => LoginPage()));
//     });
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: redirectUser(context),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Center(
              child: Text('inblex',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold)),
            ),
          );
         },
      ),
    );
  }

  Future redirectUser(BuildContext context) async {
    final milliseconds = 1500;

    final pref = new SharedPreferencesManager();
    // final authService = Provider.of<AuthService>(context, listen: false);
    
    final token = pref.token;
    if (token.toString().isNotEmpty) {

      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          
          await Future.delayed(Duration(milliseconds: milliseconds));

          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => HomePage(),
                transitionDuration: Duration(milliseconds: milliseconds),
              ));
        }
      } on SocketException catch (_) {
        await Future.delayed(Duration(milliseconds: milliseconds));

          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => HomePage(),
                transitionDuration: Duration(milliseconds: milliseconds),
              ));
      }

    } else {
      await Future.delayed(Duration(milliseconds: milliseconds));

      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => LoginPage(),
              transitionDuration: Duration(milliseconds: milliseconds)));
    }
    // final autenticado = await authService.isLoggedIn();

  }
}

// return Scaffold(
//       body: FutureBuilder(
//         future: redirectUser(context),
//         builder: (context, snapshot) {
//           return Container();
//         },
//       ),
//     );
