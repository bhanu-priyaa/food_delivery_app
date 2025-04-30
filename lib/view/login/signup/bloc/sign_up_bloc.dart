import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/view/login/signup/event/sign_up_event.dart';
import 'package:food_delivery/view/login/signup/state/sign_up_state.dart';


class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  String name = '';
  String email = '';
  String mobile = '';
  String address = '';
  String password = '';
  String confirmPassword = '';

  SignUpBloc() : super(SignUpInitial()) {
    on<NameChanged>((event, emit) {
      name = event.name;
    });

    on<EmailChanged>((event, emit) {
      email = event.email;
    });

    on<MobileChanged>((event, emit) {
      mobile = event.mobile;
    });

    on<AddressChanged>((event, emit) {
      address = event.address;
    });

    on<PasswordChanged>((event, emit) {
      password = event.password;
    });

    on<ConfirmPasswordChanged>((event, emit) {
      confirmPassword = event.confirmPassword;
    });

    on<SignUpRequested>((event, emit) async {
      emit(SignUpLoading());

      if (password != confirmPassword) {
        emit(SignUpFailure('Passwords do not match'));
        return;
      }

      try {
        await Future.delayed(Duration(seconds: 2)); 
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailure('Signup Failed'));
      }
    });
  }
}
