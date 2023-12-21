import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:takaful_admin1/core/utils/app_colors.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/add_category_cubit/add_category_cubit.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/add_image_cubit/add_image_cubit.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/get_item_category_cubit/get_item_category_cubit.dart';
import 'package:takaful_admin1/features/add_category/presentation/cubit/get_service_category_cubit/get_service_category_cubit.dart';
import 'package:takaful_admin1/features/auth/presentation/login_cubit/login_cubit.dart';
import 'package:takaful_admin1/features/generate_analitices/presentation/cubit/get_request/get_request_cubit.dart';
import 'package:takaful_admin1/features/home/presentation/view/home_page.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/cubits/get_post_cubit/get_post_cubit.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/cubits/get_user_information_cubit/get_user_information_cubit.dart';
import 'package:takaful_admin1/features/manage_post_request/presentation/cubits/manage_post_cubit/manage_post_cubit.dart';
import 'package:takaful_admin1/firebase_options.dart';

import 'features/ban_user/presentation/cubit/get_users_cubit.dart';
import 'features/send_notification/presentation/cubit/send_notification_cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => GetServiceCategoryCubit()),
        BlocProvider(create: (context) => GetItemCategoryCubit()),
        BlocProvider(create: (context) => AddCategoryCubit()),
        BlocProvider(create: (context) => GetPostCubit()),
        BlocProvider(create: (context) => GetUserInformationCubit()),
        BlocProvider(create: (context) => ManagePostCubit()),
        BlocProvider(create: (context) => SendNotificationCubit()),
        BlocProvider(create: (context) => GetUsersCubit()),
        BlocProvider(create: (context) => AddImageCubit()),
        BlocProvider(create: (context) => GetRequestCubit())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'ElMessiri',
            colorScheme: ColorScheme.fromSeed(
                seedColor: AppColor.kPrimary, background: Colors.white),
            useMaterial3: true,
          ),
          home: const HomePage()),
    );
  }
}
