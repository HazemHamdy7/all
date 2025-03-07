import 'package:all/screens/home/service_view/check_out/check_out.dart';
import 'package:all/screens/splash/splash.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/dress_cubit/dress_code_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DressCodeCubit(),
      child: MaterialApp(
        title: 'Dress Code App',
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          primarySwatch: Colors.grey,
        ),
        debugShowCheckedModeBanner: false,
        // Wrap HomeScreen (or your desired starting screen) with the BlocProvider.
        home: SplashScreen(),
      ),
    );
  }
}
