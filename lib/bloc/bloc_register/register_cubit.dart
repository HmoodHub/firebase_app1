import 'package:bloc/bloc.dart';
import 'package:firebase_app1/firebase/auth/FB_auth.dart';
import 'package:firebase_app1/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);

  late TextEditingController emailController;
  late TextEditingController passController;

  void initState(){
    emailController = TextEditingController();
    passController = TextEditingController();
    emit(RegisterInitial());
  }
  bool obscureText = true;
  bool isVisible = false;
  void visibilityPass(){
    obscureText = !obscureText;
    isVisible = !isVisible;
    emit(RegisterVisibilityPass());
  }

  void registerApp(context)async{
    emit(RegisterLoading());
    bool register = await FBAuth.createAccount(context, email: emailController.text, password: passController.text);
    if (register) {
      emit(RegisterSuccess());
    }  else{
      emit(RegisterError());
    }
  }
}
