part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectGenres, String selectLanguage) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserFlutix user = result.user.convertToUser(
        name: name,
        selectedGenres: selectGenres,
        selectedLanguage: selectLanguage,
      );

      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(']')[1].trim());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserFlutix user = await result.user.fromFirestore();

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(']')[1].trim());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<User> get userStream => _auth.onAuthStateChanged;
}

class SignInSignUpResult {
  final UserFlutix user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
