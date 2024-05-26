import 'package:clean_arc_api/core/database/apis/api_consumer.dart';
import 'package:clean_arc_api/core/database/apis/end_points.dart';
import 'package:clean_arc_api/core/params/params.dart';
import 'package:clean_arc_api/features/user/data/user_model/user_model.dart';

class UserRemoteDataSourse {
  final ApiConsumer api;

  UserRemoteDataSourse({required this.api});

  Future<UserModel> getUser(UserParams params) async {
    final response = await api.get('${EndPoints.user}/${params.id}');
    return UserModel.fromJson(response);
  }
}
