import 'package:clean_arc_api/core/error/failure.dart';
import 'package:clean_arc_api/core/params/params.dart';
import 'package:clean_arc_api/features/user/domain/repositres/user_repositries.dart';
import 'package:dartz/dartz.dart';

import '../entities/user_entites.dart';

class GetUser {
  final UserRepositries repositries;

  GetUser({required this.repositries});

  Future<Either<Failure, UserEntity>> call({
    required UserParams params,
  }) {
    return repositries.getUser(
      params: params,
    );
  }
}
