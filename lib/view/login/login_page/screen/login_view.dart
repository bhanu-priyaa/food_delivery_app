import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/common/color_extension.dart';
// import 'package:food_delivery/common/extension.dart';
// import 'package:food_delivery/common/globs.dart';
import 'package:food_delivery/common_widget/round_button.dart';
import 'package:food_delivery/view/home/screens/home_view.dart';
import 'package:food_delivery/view/login/login_page/bloc/login_bloc.dart';
import 'package:food_delivery/view/login/login_page/events/login_event.dart';
import 'package:food_delivery/view/login/reset_password_view.dart';
import 'package:food_delivery/view/login/signup/screen/sign_up_view.dart';
import 'package:food_delivery/view/login/login_page/state/login_state.dart';

// import 'package:food_delivery/view/on_boarding/on_boarding_view.dart';

// import '../../common/service_call.dart';
import '../../../../common_widget/round_icon_button.dart';
import '../../../../common_widget/round_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child:Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
              );
            } else if (state.isFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Invalid credentials")),
              );
            }
          },
          builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 64),
              Text( 
                "Login",
                style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "Add your details to login",
                style: TextStyle(
                  color: TColor.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 25),
              RoundTextfield(
                hintText: "Your Email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) {
                  context.read<LoginBloc>().add(EmailChanged(val));
                },
                left: Container(),
              ),
              const SizedBox(height: 25),

              RoundTextfield(
                hintText: "Password",
                controller: txtPassword,
                obscureText: true,
                onChanged: (val) {
                  context.read<LoginBloc>().add(PasswordChanged(val));
                },
                left: Container(),
              ),
              state.isSubmitting
                  ? CircularProgressIndicator()
                  : RoundButton(
                    title: "Login",
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginSubmitted());
                    },
                    fontSize: 24,
                  ),
              const SizedBox(height: 4),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPasswordView()));
                },
                child: Text("Forgot your password?", style: TextStyle(color: TColor.secondaryText, fontSize: 14,)),
              ),
              
              const SizedBox(
                height: 30,
              ),
              Text("or Login With", style: TextStyle(color: TColor.secondaryText, fontSize: 14, fontWeight: FontWeight.w500)),
              const SizedBox(height: 30),
          
              RoundIconButton(
                icon: "assets/img/facebook_logo.png",
                title: "Login with Facebook",
                color: const Color(0xff367FC0),
                onPressed: () {},
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 25),
              RoundIconButton(
                icon: "assets/img/google_logo.png",
                title: "Login with Google",
                color: const Color(0xffDD4B39),
                onPressed: () {},
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 80),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpView()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have an Account? ",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: TColor.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
                        ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),),
    );
}
  //   void btnLogin() {
  //     if (!txtEmail.text.isEmail) {
  //       mdShowAlert(Globs.appName, MSG.enterEmail, () {});
  //       return;
  //     }

  //     if (txtPassword.text.length < 6) {
  //       mdShowAlert(Globs.appName, MSG.enterPassword, () {});
  //       return;
  //     }

  //     endEditing();

  //     serviceCallLogin({"email": txtEmail.text, "password": txtPassword.text, "push_token": "" });
  //   }

  //   void serviceCallLogin(Map<String, dynamic> parameter) {
  //     Globs.showHUD();

  //     ServiceCall.post(parameter, SVKey.svLogin,
  //         withSuccess: (responseObj) async {
  //       Globs.hideHUD();
  //       if (responseObj[KKey.status] == "1") {

  //         Globs.udSet( responseObj[KKey.payload] as Map? ?? {} , Globs.userPayload);
  //         Globs.udBoolSet(true, Globs.userLogin);

  //           Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(
  //             builder: (context) => const OnBoardingView(),
  //           ), (route) => false);
  //       } else {
  //         mdShowAlert(Globs.appName,
  //             responseObj[KKey.message] as String? ?? MSG.fail, () {});
  //       }
  //     }, failure: (err) async {
  //       Globs.hideHUD();
  //       mdShowAlert(Globs.appName, err.toString(), () {});
  //     });
  //   }
  // }
}
