import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibenefit/blocs/bloc/auth_bloc.dart';

import 'package:flutter/gestures.dart';
import 'package:ibenefit/screens/home.dart';
import 'package:ibenefit/service/auth/auth_service.dart';
import 'package:ibenefit/widgets/login/input_form.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late AuthService loginService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    // emailController.text = "test123@ibenefit.vn";
    // passwordController.text = "abc123456";

    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginSuccess) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: ProgressHUD(
              inAsyncCall: isApiCallProcess,
              opacity: 0.3,
              key: UniqueKey(),
              child: SingleChildScrollView(
                child: Container(
                  width: mediaQuery.width,
                  height: mediaQuery.height,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        child: SvgPicture.asset(
                          "assets/svg/bg_login_top.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Container(
                          width: mediaQuery.width * 0.9,
                          height: mediaQuery.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black26,
                                blurRadius: 20,
                                offset: Offset(0, 4),
                              )
                            ],
                          ),
                          child: Form(
                            key: globalFormKey,
                            child: const InputForm(),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: SvgPicture.asset(
                          "assets/svg/bg2_login_1.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
