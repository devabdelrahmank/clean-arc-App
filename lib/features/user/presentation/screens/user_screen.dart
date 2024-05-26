// ignore_for_file: camel_case_types

import 'package:clean_arc_api/features/user/presentation/cubit/user_cubit.dart';
import 'package:clean_arc_api/features/user/presentation/cubit/user_state.dart';
import 'package:clean_arc_api/features/user/presentation/screens/widgets/CustomSearchBar.dart';
import 'package:clean_arc_api/features/user/presentation/screens/widgets/text_Container.dart';
import 'package:clean_arc_api/features/user/presentation/screens/widgets/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class userScreen extends StatefulWidget {
  userScreen({super.key});

  @override
  State<userScreen> createState() => _userScreenState();
}

class _userScreenState extends State<userScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state is UserSuccessState
              ? ListView(
                  children: [
                    const textContainer(),
                    userData(user: state.user),
                    const CustomSearchBar(),
                  ],
                )
              : state is UserErrorState
                  ? Text(state.errorMessage)
                  : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
