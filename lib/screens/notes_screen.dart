import 'package:firebase_app1/firebase/auth/FB_auth.dart';
import 'package:firebase_app1/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              FBAuth.signOut();
              Get.off(LoginScreen());
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
