// ignore_for_file: camel_case_types

import 'package:clean_arc_api/features/user/domain/entities/user_entites.dart';
import 'package:flutter/material.dart';

class userData extends StatelessWidget {
  final UserEntity user;
  const userData({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.person,
                size: 40,
                color: Colors.black,
              ),
              const SizedBox(width: 30),
              Text(
                user.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Icon(
                Icons.email,
                size: 40,
                color: Colors.black,
              ),
              const SizedBox(width: 30),
              Text(
                user.email,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Icon(
                Icons.phone,
                size: 40,
                color: Colors.black,
              ),
              const SizedBox(width: 30),
              Text(
                user.phone,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Icon(
                Icons.location_city,
                size: 40,
                color: Colors.black,
              ),
              const SizedBox(width: 30),
              Text(
                user.address.city,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
