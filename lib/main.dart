import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/view/auth/login_page.dart';
import 'package:salon_app/view_model/cubit/login_cubit/login_cubit.dart';
import 'package:salon_app/view_model/cubit/homescreen_cubit/homescreen_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBl7cDyPh1jTKZNU0h-NRERpaBM2svJRjI",
          appId: "1:90454156583:android:64c939d622d76ccb4ff502",
          messagingSenderId: "90454156583",
          projectId: "hairsalon-203ff"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomescreenCubit()),
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Salon App',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          primarySwatch: Colors.lightBlue,
          appBarTheme: const AppBarTheme(
              color: Colors.white,
              centerTitle: false,
              iconTheme: IconThemeData(color: Colors.black, size: 27)),
          // useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
