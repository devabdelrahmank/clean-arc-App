import 'package:clean_arc_api/core/connection/network_info.dart';
import 'package:clean_arc_api/core/database/apis/dio_consumer.dart';
import 'package:clean_arc_api/core/database/cache/cache_helper.dart';
import 'package:clean_arc_api/core/params/params.dart';
import 'package:clean_arc_api/features/user/data/datasorcies/user_local_data_sourse.dart';
import 'package:clean_arc_api/features/user/data/datasorcies/user_remote_data_sourse.dart';
import 'package:clean_arc_api/features/user/data/repositories/user_reposiries_impl.dart';
import 'package:clean_arc_api/features/user/domain/useCase/get_user.dart';
import 'package:clean_arc_api/features/user/presentation/cubit/user_state.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserinitialState());
  static UserCubit get(context) => BlocProvider.of(context);

  eitherFailureOruser(int id) async {
    emit(UserlodingState());
    final failureOruser = await GetUser(
      repositries: UserRepositriesImpl(
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
        remoteDataSourse: UserRemoteDataSourse(api: DioConsumer(dio: Dio())),
        localDataSourse: UserLocalDataSourse(cache: CacheHelper()),
      ),
    ).call(
      params: UserParams(
        id: id.toString(),
      ),
    );
    failureOruser.fold(
      (faiure) => emit(UserErrorState(errorMessage: faiure.errMessage)),
      (user) => emit(UserSuccessState(user: user)),
    );
  }

  double? val = 1;
  method(double id) {
    id = val!;
    emit(UserSliderState());
  }
}
