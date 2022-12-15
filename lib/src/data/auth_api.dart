import 'package:auth_app/src/models/index.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthApi {
  const AuthApi({required this.auth});

  final FirebaseAuth auth;

  Future<AppUser> createUser({required String email, required String password}) async {
    final UserCredential credentials = await auth.createUserWithEmailAndPassword(email: email, password: password);
    final User user = credentials.user!;
    final String displayName = email.split('@').first;

    await user.updateDisplayName(displayName);

    return AppUser(
      uid: user.uid,
      email: email,
      displayName: displayName,
    );
  }

  Future<AppUser> login({required String email, required String password}) async {
    final UserCredential credentials = await auth.signInWithEmailAndPassword(email: email, password: password);

    final User user = credentials.user!;

    return AppUser(
      uid: user.uid,
      email: email,
      displayName: user.displayName!,
    );
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
