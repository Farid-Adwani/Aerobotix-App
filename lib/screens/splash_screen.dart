import 'package:flutter/material.dart';
import 'package:levels/screens/authentication_screen.dart';
import 'package:levels/screens/gadget_screen.dart';
import 'package:levels/utils/globals.dart';
import 'package:levels/widgets/custom_loader.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';

  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    (() async {
      await Future.delayed(Duration.zero);
      final isLoggedIn = Globals.firebaseUser != null;

      if (!mounted) return;
      Navigator.pushReplacementNamed(
        context,
        isLoggedIn ? HomeScreen.id : AuthenticationScreen.id,
      );
    })();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomLoader(),
      ),
    );
  }
}