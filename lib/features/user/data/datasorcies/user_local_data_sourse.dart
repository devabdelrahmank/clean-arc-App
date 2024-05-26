import 'dart:convert';

import 'package:clean_arc_api/core/database/cache/cache_helper.dart';
import 'package:clean_arc_api/core/error/exception.dart';
import 'package:clean_arc_api/features/user/data/user_model/user_model.dart';

class UserLocalDataSourse {
  final CacheHelper cache;
  final String key = 'CachedUser';

  UserLocalDataSourse({required this.cache});

  casheUser(UserModel? usertoCache) {
    if (usertoCache != null) {
      cache.saveData(
        key: key,
        value: json.encode(
          usertoCache.toJson(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: 'No Internet Connection');
    }
  }

  Future<UserModel> getlastUser() {
    final jsonString = cache.getDataString(key: key);
    if (jsonString != null) {
      return Future.value(
        UserModel.fromJson(
          json.decode(jsonString),
        ),
      );
    } else {
      return throw CacheExeption(errorMessage: 'No Internet Connection');
    }
  }
}
