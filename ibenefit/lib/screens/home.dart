import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibenefit/blocs/bloc/auth_bloc.dart';
import 'package:ibenefit/config/color.dart';
import 'package:ibenefit/screens/login.dart';
import 'package:ibenefit/service/device/network_request.dart';

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
    Size mediaQuery = MediaQuery.of(context).size;
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthLoginSuccess) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: AppColors.primaryColor,
                        backgroundImage: NetworkImage(
                          state.user.avatar,
                          // "assets/imgs/icon/Logo_NextWord_512x512.png",
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Xin chào, ' + state.user.email,
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              "Phone: " + state.user.phoneNumber,
                              style: const TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              'Welcome back to Ibenefit!',
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
                ),
              ),
              Container(
                width: mediaQuery.width,
                height: mediaQuery.height * 0.4,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Load data',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: AppColors.primaryColor,
                          onPressed: () {
                            networkRequest.loadData();
                          },
                          tooltip: 'Load data',
                          child: const Icon(Icons.file_upload),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Clear data',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: AppColors.primaryColor,
                          onPressed: () {
                            networkRequest.clearData();
                          },
                          tooltip: 'Cleard data',
                          child: const Icon(Icons.clear_all),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Log out',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
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
                              backgroundColor: AppColors.primaryColor,
                              onPressed: () async {
                                // SharedPreferences prefs =
                                //     await SharedPreferences.getInstance();
                                // prefs.remove('email');
                                // prefs.remove('password');

                                BlocProvider.of<AuthBloc>(context)
                                    .add(AuthLogout());
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
                  ],
                ),
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }
}
