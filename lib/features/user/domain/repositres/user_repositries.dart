import 'package:clean_arc_api/core/error/failure.dart';
import 'package:clean_arc_api/core/params/params.dart';
import 'package:clean_arc_api/features/user/domain/entities/user_entites.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepositries {
  Future<Either<Failure, UserEntity>> getUser({
    required UserParams params,
  });
}
