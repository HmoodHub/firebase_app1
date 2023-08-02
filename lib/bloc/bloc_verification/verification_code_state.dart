part of 'verification_code_cubit.dart';

@immutable
abstract class VerificationCodeState {}

class VerificationCodeInitial extends VerificationCodeState {}
class VerificationCodeLoading extends VerificationCodeState {}
class VerificationCodeSuccess extends VerificationCodeState {}
class VerificationCodeError extends VerificationCodeState {}
class VerificationVisibilityPass extends VerificationCodeState {}

