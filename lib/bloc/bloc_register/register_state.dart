// ignore_for_file: must_be_immutable

part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterVisibilityPass extends RegisterState {}
class RegisterGenderState extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterError extends RegisterState {
  String error;

  RegisterError(this.error);
}