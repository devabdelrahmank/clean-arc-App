import 'package:clean_arc_api/core/database/cache/cache_helper.dart';
import 'package:clean_arc_api/features/user/presentation/cubit/user_cubit.dart';
import 'package:clean_arc_api/features/user/presentation/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..eitherFailureOruser(1),
      child: MaterialApp(
        title: 'Clean Arc App',
        theme: ThemeData(),
        home: userScreen(),
      ),
    );
  }
}
