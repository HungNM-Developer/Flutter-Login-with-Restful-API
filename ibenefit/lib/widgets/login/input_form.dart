import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibenefit/blocs/bloc/auth_bloc.dart';
import 'package:ibenefit/config/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputForm extends StatefulWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    bool _isObscure = false;

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    showPass() {
      setState(() {
        _isObscure = !_isObscure;
      });
    }

    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, bottom: 30, top: 50),
          child: Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            left: 20,
            right: 20,
          ),
          child: TextFormField(
            cursorColor: AppColors.primaryColor,
            controller: emailController,
            autovalidateMode: AutovalidateMode.always,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black26,
                    width: 2.0,
                  ),
                ),
                suffixIcon: Icon(
                  Icons.person,
                  color: AppColors.primaryColor,
                ),
                fillColor: AppColors.primaryColor,
                focusColor: AppColors.primaryColor,
                hoverColor: AppColors.primaryColor,
                //icon: Icon(Icons.person),
                //border: OutlineInputBorder(),
                floatingLabelStyle:
                    const TextStyle(color: AppColors.primaryColor),
                labelText: 'Email',
                hintText: 'Enter email'),
          ),
        ),
        Container(),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 0,
            left: 20,
            right: 20,
          ),
          child: TextFormField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black26,
                  width: 2.0,
                ),
              ),
              fillColor: AppColors.primaryColor,
              focusColor: AppColors.primaryColor,
              hoverColor: AppColors.primaryColor,
              floatingLabelStyle:
                  const TextStyle(color: AppColors.primaryColor),
              labelText: 'Password',
              hintText: 'Enter password',
              suffixIcon: const Icon(
                Icons.password,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoginError) {
              return Text(
                state.message,
                style: const TextStyle(
                  color: Colors.red,
                ),
              );
            }
            return Container();
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoginLoading) {
                return const CircularProgressIndicator();
              }
              return InkWell(
                onTap: () async {
                  if (emailController.text.isNotEmpty ||
                      passwordController.text.isNotEmpty) {
                    BlocProvider.of<AuthBloc>(context).add(AuthLogin(
                        emailController.text, passwordController.text));
                  } else if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Bạn phải điền tài khoản và mật khẩu'),
                    ));
                  }
                },
                child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black38,
                        blurRadius: 4,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.login,
                        size: 25,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
