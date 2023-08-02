import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../bloc/bloc_register/register_cubit.dart';
import '../../widget/wedget.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RegisterCubit bloc = RegisterCubit.get(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Register'),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.off(LoginScreen());
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                Text(
                  'Register Now',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Enter data to Register....',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
                  height: 30,
                ),
                textFormFieldApp(
                  controller: bloc.nameController,
                  type: TextInputType.name,
                  hint: 'Full Name',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(
                  height: 10,
                ),
                textFormFieldApp(
                  controller: bloc.emailController,
                  type: TextInputType.emailAddress,
                  hint: 'E-mail',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(
                  height: 10,
                ),
                textFormFieldApp(
                  controller: bloc.passController,
                  type: TextInputType.visiblePassword,
                  hint: 'Password',
                  prefixIcon: Icons.lock,
                  suffix:
                      bloc.isVisible ? Icons.visibility_off : Icons.visibility,
                  obscureText: bloc.obscureText,
                  onPressedSuffix: () => bloc.visibilityPass(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Gender: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        onChanged: (value) {
                          bloc.onChangeRadio(value);
                        },
                        value: 'M',
                        groupValue: bloc.gender,
                        title: Text('Male'),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        onChanged: (value) {
                          bloc.onChangeRadio(value);
                        },
                        value: 'F',
                        groupValue: bloc.gender,
                        title: Text('Female'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GFButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.registerApp(context);
                    }
                  },
                  text: 'Register',
                  size: GFSize.LARGE,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Do have an account?',
                      style: const TextStyle(color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(LoginScreen());
                      },
                      child: Text(
                        ' Login',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
