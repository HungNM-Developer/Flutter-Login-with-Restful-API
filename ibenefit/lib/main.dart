import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibenefit/blocs/bloc/auth_bloc.dart';
import 'package:ibenefit/config/color.dart';
import 'package:ibenefit/screens/home.dart';
import 'package:ibenefit/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget _defaultHome = Login();
Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
        ),
        home: const Login(),
        // routes: {
        //   '/': (context) => _defaultHome,
        //   '/home': (context) => HomePage(),
        //   '/login': (context) => Login(),
        // },
      ),
    );
  }
}
