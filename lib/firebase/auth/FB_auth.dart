import 'dart:async';

import 'package:firebase_app1/widget/wedget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

typedef GetCurrentUser = void Function({required bool state});
class FBAuth {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  static Future<bool> signIn(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    ToastContext().init(context);
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential != null) {
        if (userCredential.user!.emailVerified) {
          return true;
        } else {
          await userCredential.user!.sendEmailVerification();
          ShowToast(
              msg: 'The verification is invalid, check and try again.',
              state: Colors.red);
          return false;
        }
      }
    } on FirebaseAuthException catch (e) {
      _onFirebaseAuthException(context, exception: e);
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<bool> createAccount(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    ToastContext().init(context);
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      userCredential.user!.sendEmailVerification();
      ShowToast(
        msg: 'Account created, verify email to start using app.',
        state: Colors.green,
      );
      await signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      _onFirebaseAuthException(context, exception: e);
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<bool> forgetPassword(
    BuildContext context, {
    required String email,
  }) async {
    ToastContext().init(context);
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      ShowToast(
        msg: 'Password reset email sent, check your email.',
        state: Colors.green,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      _onFirebaseAuthException(context, exception: e);
    } catch (e) {
      print(e);
    }
    return false;
  }

  static StreamSubscription loggedIn({required GetCurrentUser listener}) {
    return _firebaseAuth.authStateChanges().listen((User? user) {
      listener(state: user != null);
    });
  }

  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  static void _onFirebaseAuthException(
    BuildContext context, {
    required FirebaseAuthException exception,
  }) {
    ToastContext().init(context);
    ShowToast(msg: exception.message ?? 'Error occurred!', state: Colors.red);
    if (exception.code == 'invalid-email') {
      //
    } else if (exception.code == 'user-disabled') {
      //
    } else if (exception.code == 'user-not-found') {
      //
    } else if (exception.code == 'wrong-password') {
      //
    } else if (exception.code == 'email-already-in-use') {
      //
    } else if (exception.code == 'operation-not-allowed') {
      //
    } else if (exception.code == 'weak-password') {
      //
    }
  }
}
