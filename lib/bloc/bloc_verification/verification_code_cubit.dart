import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'verification_code_state.dart';

class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  VerificationCodeCubit() : super(VerificationCodeInitial());

  static VerificationCodeCubit get(context) =>
      BlocProvider.of<VerificationCodeCubit>(context);

  late TextEditingController field1;
  late TextEditingController field2;
  late TextEditingController field3;
  late TextEditingController field4;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late FocusNode code1;
  late FocusNode code2;
  late FocusNode code3;
  late FocusNode code4;
  late String email;

  void initVerificationScreen() async {
    field1 = TextEditingController();
    field4 = TextEditingController();
    field3 = TextEditingController();
    field2 = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    code4 = FocusNode();
    code3 = FocusNode();
    code2 = FocusNode();
    code1 = FocusNode();
    email = Get.arguments['email'];
    emit(VerificationCodeInitial());
  }

  bool obscureText = true;
  bool isVisible = false;

  void visibilityPass() {
    obscureText = !obscureText;
    isVisible = !isVisible;
    emit(VerificationVisibilityPass());
  }

  void verification(context) async {
    emit(VerificationCodeLoading());
    String myCode = field1.text + field2.text + field3.text + field4.text;

  }
}
