import 'package:flutter/widgets.dart';

import 'package:machine_test/app/data/models/repos.dart';
import 'package:machine_test/app/data/models/user_profile.dart';
import 'package:machine_test/app/data/services/github_api.dart';
import 'package:machine_test/app/routes/app_routes.dart';
import 'package:machine_test/ui/widgets/show_custom_dialog.dart';

class UserProvider extends ChangeNotifier {
  final GithubApi _githubApi = GithubApi();

  bool isLoading = false;

  late UserProfile _user;
  UserProfile get user => _user;

  late List<Repos?> _repos;
  List<Repos?> get repos => _repos;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getUser(
      {required String username, required BuildContext ctx}) async {
    setLoading(true);
    try {
      final UserProfile response =
          await _githubApi.getUserProfile(username: username);
      _user = response;
      
      setLoading(false);
    } catch (e) {
      const errorMessage = 'UnKnown Error';
      showCustomDialog(ctx, 'Error', errorMessage);
      setLoading(false);
    }
  }

  Future<void> getUserRepos(
      {String? username, required BuildContext ctx}) async {
    setLoading(true);
    try {
      final List<Repos?> response =
          await _githubApi.getRepos(username: username!);
      _repos = response;

      setLoading(false);
      print(_repos);
      Navigator.of(ctx).pushNamed(AppRoutes.user_details);
    } catch (e) {
      const errorMessage = 'UnKnown Error';
      showCustomDialog(ctx, 'Error', errorMessage);
      setLoading(false);
    }
  }
}
