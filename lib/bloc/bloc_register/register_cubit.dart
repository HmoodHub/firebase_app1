import 'package:bloc/bloc.dart';
import 'package:firebase_app1/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passController;
  String gender = 'gender';
  void initState(){
    nameController = TextEditingController();
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

  void onChangeRadio(value){
    gender = value;
    emit(RegisterGenderState());
  }

  Student get student{
    Student student = Student();
    student.fullName = nameController.text;
    student.email = emailController.text;
    student.password = passController.text;
    student.gender = gender;
    return student;
  }

  void registerApp(context)async{
    emit(RegisterLoading());
  }
}
