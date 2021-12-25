import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibenefit/blocs/bloc/auth_bloc.dart';
import 'package:ibenefit/config/color.dart';
import 'package:ibenefit/screens/login.dart';
import 'package:ibenefit/service/auth/auth_service.dart';
import 'package:ibenefit/service/device/network_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      networkRequest.saveData();
      const onminute = Duration(minutes: 5);
      Timer.periodic(onminute, (timer) {
        networkRequest.saveData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthLoginSuccess) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: AppColors.primaryColor,
                          backgroundImage: NetworkImage(
                            state.user.avatar,
                            // "assets/imgs/icon/Logo_NextWord_512x512.png",
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Xin chào, ' + state.user.email,
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                'Welcome back to Ibenefit',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Load data',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  networkRequest.loadData();
                },
                tooltip: 'Load data',
                child: const Icon(Icons.file_upload),
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Cleard data',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  networkRequest.clearData();
                },
                tooltip: 'Cleard data',
                child: const Icon(Icons.clear_all),
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Log out',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLogoutSuccess) {
                    return Text(
                      state.message,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    );
                  }
                  return FloatingActionButton(
                    onPressed: () async {
                      // SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // prefs.remove('email');
                      // prefs.remove('password');

                      BlocProvider.of<AuthBloc>(context).add(AuthLogout());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    tooltip: 'Log out',
                    child: const Icon(Icons.logout),
                  );
                },
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}
