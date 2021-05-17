import 'package:firebase_auth/firebase_auth.dart';
import 'package:gift_generator/services/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthBloc {
  final authService = AuthService();
  final googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  Stream<User> get currentUser => authService.currentUser;

  loginGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Firebase Sign in
      final result = await authService.signInWithCredential(credential);

      print('${result.user.displayName}');

    } catch (error) {
      print(error);
    }
  }


  logout() {
    authService.logout();
  }
}
