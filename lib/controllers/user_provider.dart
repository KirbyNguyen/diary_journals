import 'package:diary_journals/databases/user_database.dart';
import 'package:diary_journals/models/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider = StateNotifierProvider<UserProvider, User?>(
  (ref) => UserProvider(ref: ref),
);

class UserProvider extends StateNotifier<User?> {
  Ref ref;
  UserProvider({required this.ref}) : super(null);

  void authUser(String name, String password) async {
    try {
      dynamic result =
          await ref.read(userDatabaseProvider).authUser(name, password);
      if (result != null) {
        User currentUser = User.fromJson(result);
        state = currentUser;
      } else {
        state = null;
        // print("USER AUTHENTICATION FAILS");
      }
    } catch (error) {
      // print(error);
    }
  }

  void createUser(User currentUser) async {
    try {
      dynamic result =
          await ref.read(userDatabaseProvider).insertUser(currentUser);
      if (result != 0) {
        state = currentUser;
      } else {
        state = null;
        // print("USER AUTHENTICATION FAILS");
      }
    } catch (error) {
      // print(error);
    }
  }
}
