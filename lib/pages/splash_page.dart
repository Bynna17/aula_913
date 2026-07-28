import 'package:aula_913/db/shared_prefs.dart';
import 'package:aula_913/pages/home_page.dart';
import 'package:aula_913/pages/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SharedPrefs prefs = SharedPrefs();

  @override
  void initState() {
    super.initState();
    checkStatus();
  }

  checkStatus() async {
    bool status = await prefs.getUserStatus();
    await Future.delayed(Duration(seconds: 3));
    if (status == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE395C),
      body: Center(
        child: Image.network(
          'https://a0.muscache.com/pictures/09104ce1-4a66-4284-80b2-ad0ea3e46c24.jpg',
        ),
      ),
    );
  }
}
