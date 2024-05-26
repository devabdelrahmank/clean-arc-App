import 'package:clean_arc_api/core/connection/network_info.dart';
import 'package:clean_arc_api/core/error/exception.dart';
import 'package:clean_arc_api/core/error/failure.dart';
import 'package:clean_arc_api/core/params/params.dart';
import 'package:clean_arc_api/features/user/data/datasorcies/user_local_data_sourse.dart';
import 'package:clean_arc_api/features/user/data/datasorcies/user_remote_data_sourse.dart';
import 'package:clean_arc_api/features/user/domain/entities/user_entites.dart';
import 'package:clean_arc_api/features/user/domain/repositres/user_repositries.dart';
import 'package:dartz/dartz.dart';

class UserRepositriesImpl extends UserRepositries {
  final NetworkInfo networkInfo;
  final UserRemoteDataSourse remoteDataSourse;
  final UserLocalDataSourse localDataSourse;

  UserRepositriesImpl({
    required this.networkInfo,
    required this.remoteDataSourse,
    required this.localDataSourse,
  });
  @override
  Future<Either<Failure, UserEntity>> getUser(
      {required UserParams params}) async {
    //!لو فيه نت هتمشي
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await remoteDataSourse.getUser(params);
        localDataSourse.casheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(
          Failure(errMessage: e.errorModel.errorMessage),
        );
      }
      //!لو مفيش نت هتمشي
    } else {
      try {
        final localUser = await localDataSourse.getlastUser();
        return Right(localUser);
      } on CacheExeption catch (e) {
        return Left(
          Failure(errMessage: e.errorMessage),
        );
      }
    }
  }
}
