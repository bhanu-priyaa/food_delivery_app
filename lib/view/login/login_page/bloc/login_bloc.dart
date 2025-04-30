import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/view/login/login_page/events/login_event.dart';
import 'package:food_delivery/view/login/login_page/state/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(
        state.copyWith(isSubmitting: true, isFailure: false, isSuccess: false),
      );

      await Future.delayed(Duration(seconds: 2));

      if (state.email == 'test@gmail.com' && state.password == '1234') {
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      }
    });
  }
}
