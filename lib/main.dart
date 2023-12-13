import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/features/auth/presentation/login_cubit/login_cubit.dart';
import 'package:takaful_admin1/features/auth/presentation/view/login_page.dart';
import 'package:takaful_admin1/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TakafulAdmin());
}

class TakafulAdmin extends StatelessWidget {
  const TakafulAdmin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'ElMessiri',
            colorScheme: ColorScheme.fromSeed(
                seedColor: AppColor.kPrimary, background: Colors.white),
            useMaterial3: true,
          ),
          home: const LoginPage()),
    );
  }
}
