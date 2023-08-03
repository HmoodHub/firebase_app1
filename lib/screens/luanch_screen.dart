import 'dart:async';

import 'package:firebase_app1/firebase/auth/FB_auth.dart';
import 'package:firebase_app1/screens/auth/login_screen.dart';
import 'package:firebase_app1/screens/notes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  late StreamSubscription _streamSubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      _streamSubscription = FBAuth.loggedIn(listener: ({required bool state}) {
        Widget page = state ? const NotesScreen() : LoginScreen();
        Get.off(page);
      },);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _streamSubscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [
                  Colors.cyanAccent,
                  Colors.blue,
                  Colors.black87,
                ],
              ),
            ),
          ),
          Center(
            child: Text(
              'Note App',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
