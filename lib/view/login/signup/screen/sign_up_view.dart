import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common_widget/round_button.dart';
import 'package:food_delivery/common_widget/round_textfield.dart';
import 'package:food_delivery/view/login/login_page/screen/login_view.dart';
import 'package:food_delivery/view/login/signup/bloc/sign_up_bloc.dart';
import 'package:food_delivery/view/login/signup/event/sign_up_event.dart';
import 'package:food_delivery/view/login/signup/state/sign_up_state.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtMobile = TextEditingController();
  final TextEditingController txtAddress = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final TextEditingController txtConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(),
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<SignUpBloc, SignUpState>(
            listener: (context, state) {
              if (state is SignUpSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Signup successful!")),
                );
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const LoginView()));
              } else if (state is SignUpFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Center(
                    child: Text("Sign Up",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text("Add your details to sign up",
                        style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 30),
                  RoundTextfield(
                    hintText: "Bhanu Rathore",
                    controller: txtName,
                  ),
                  const SizedBox(height: 20),
                  RoundTextfield(
                    hintText: "bhanu@gmail.com",
                    keyboardType: TextInputType.emailAddress,
                    controller: txtEmail,
                  ),
                  const SizedBox(height: 20),
                  RoundTextfield(
                    hintText: "8899130108",
                    keyboardType: TextInputType.phone,
                    controller: txtMobile,
                  ),
                  const SizedBox(height: 20),
                  RoundTextfield(
                    hintText: "Noida",
                    controller: txtAddress,
                  ),
                  const SizedBox(height: 20),
                  RoundTextfield(
                    hintText: "1234",
                    obscureText: true,
                    controller: txtPassword,
                  ),
                  const SizedBox(height: 20),
                  RoundTextfield(
                    hintText: "1234",
                    obscureText: true,
                    controller: txtConfirmPassword,
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return state is SignUpLoading
                          ? const Center(child: CircularProgressIndicator())
                          : RoundButton(
                              title: "Sign Up",
                              onPressed: () {
                                context.read<SignUpBloc>().add(SignUpRequested(
                                      name: txtName.text.trim(),
                                      email: txtEmail.text.trim(),
                                      mobile: txtMobile.text.trim(),
                                      address: txtAddress.text.trim(),
                                      password: txtPassword.text.trim(),
                                      confirmPassword: txtConfirmPassword.text.trim(),
                                    ));
                              }, fontSize: 24,
                            );
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an Account? ",
                            style: TextStyle(
                                color: TColor.secondaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => const LoginView()));
                          },
                          child: Text("Login",
                              style: TextStyle(
                                  color: TColor.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
