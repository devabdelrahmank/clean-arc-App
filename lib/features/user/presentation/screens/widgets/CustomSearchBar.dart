import 'package:clean_arc_api/features/user/presentation/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

double id = 5;

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: id,
          onChanged: (value) {
            setState(() {
              id = value;
            });
          },
          activeColor: Colors.black,
          min: 1,
          max: 10,
          divisions: 9,
          label: "${id.toInt()}",
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<UserCubit>(context).eitherFailureOruser(id.toInt());
          },
          child: Text('get User'),
        ),
      ],
    );
  }
}
