import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../screens/auth/register_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  late TextEditingController emailController;
  late TextEditingController passController;
  late TapGestureRecognizer recognizer;
  String? email = "";

  void initState() {
    if (Get.arguments != null && Get.arguments.containsKey('email')) {
      email = Get.arguments['email'];
    }
    emailController = TextEditingController(text: email);
    passController = TextEditingController();
    recognizer = TapGestureRecognizer()..onTap = routeToRegister;
    emit(LoginInitial());
  }

  void routeToRegister() {
    Get.to(RegisterScreen());
  }

  bool obscureText = true;
  bool isVisible = false;

  void visibilityPass() {
    obscureText = !obscureText;
    isVisible = !isVisible;
    emit(LoginVisibilityPass());
  }

  void loginApp(context) async {
    emit(LoginLoading());
  }
}
