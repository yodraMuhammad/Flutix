part of 'extensions.dart';

extension FirebaseUserExtension on User {
  UserFlutix convertToUser(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String selectedLanguage = "English",
          int balance = 50000}) =>
      UserFlutix(
        this.uid,
        this.email,
        name: name,
        balance: balance,
        selectGenres: selectedGenres,
        selectLanguage: selectedLanguage,
      );

  Future<UserFlutix> fromFirestore() async =>
      await UserServices.getUser(this.uid);
}
