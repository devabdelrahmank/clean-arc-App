// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class textContainer extends StatelessWidget {
  const textContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        color: Colors.black,
      ),
      child: const Center(
        child: Text(
          'Clean Archticture Code',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
