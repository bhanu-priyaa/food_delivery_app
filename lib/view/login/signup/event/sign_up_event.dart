import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends SignUpEvent {
  final String name;
  const NameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class EmailChanged extends SignUpEvent {
  final String email;
  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class MobileChanged extends SignUpEvent {
  final String mobile;
  const MobileChanged(this.mobile);

  @override
  List<Object> get props => [mobile];
}

class AddressChanged extends SignUpEvent {
  final String address;
  const AddressChanged(this.address);

  @override
  List<Object> get props => [address];
}

class PasswordChanged extends SignUpEvent {
  final String password;
  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends SignUpEvent {
  final String confirmPassword;
  const ConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object> get props => [confirmPassword];
}

class SignUpRequested extends SignUpEvent {
  const SignUpRequested({required String name, required String email, required String mobile, required String address, required String password, required String confirmPassword});
}
