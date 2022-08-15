import 'package:machine_test/app/data/dio_client.dart';
import 'package:machine_test/app/data/endpoints.dart';
import 'package:machine_test/app/data/models/repos.dart';
import 'package:machine_test/app/data/models/user_profile.dart';

class GithubApi {
  final DioClient _client = DioClient();

  Future<UserProfile> getUserProfile({String? username}) async {
    try {
      final response = await _client.get('${Endpoints.usersProfile}/$username',
          onReceiveProgress: (int count, int total) {}, queryParameters: {});
      return UserProfile.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Repos?>> getRepos({String? username}) async {
    try {
      final List response = await _client.get(
          '${Endpoints.usersProfile}/$username/${Endpoints.repos}',
          onReceiveProgress: (int count, int total) {},
          queryParameters: {});

      return response.map((item) => Repos.fromMap(item)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
