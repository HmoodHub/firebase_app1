import 'package:firebase_app1/bloc/bloc_edit_add_note/edit_add_note_cubit.dart';
import 'package:firebase_app1/bloc/bloc_notes/notes_cubit.dart';
import 'package:firebase_app1/screens/auth/login_screen.dart';
import 'package:firebase_app1/screens/luanch_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'bloc/bloc_forget_pass/forget_password_cubit.dart';
import 'bloc/bloc_login/login_cubit.dart';
import 'bloc/bloc_obsearvable.dart';
import 'bloc/bloc_register/register_cubit.dart';
import 'bloc/bloc_verification/verification_code_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit()..initState(),
        ),
        BlocProvider(
          create: (context) => LoginCubit()..initState(),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordCubit()..initForgetScreen(),
        ),
        BlocProvider(
          create: (context) =>
              VerificationCodeCubit()..initVerificationScreen(),
        ),
        BlocProvider(
          create: (context) => NotesCubit(),
        ),
        BlocProvider(
          create: (context) => EditAddNoteCubit()..initEditAddNoteScreen(),
        ),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LaunchScreen(),
      ),
    );
  }
}
