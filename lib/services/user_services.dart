part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(UserFlutix user) async {
    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectGenres': user.selectGenres,
      'selectLanguage': user.selectLanguage,
      'profilePicture': user.profilePicture ?? '',
    });
  }

  static Future<UserFlutix> getUser(id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();

    return UserFlutix(id, snapshot.data()['email'],
        balance: snapshot.data()['balance'],
        profilePicture: snapshot.data()['profilePicture'],
        selectGenres: (snapshot.data()['selectedGenres'] as List),
        // .map((e) => e.toString())
        // .toList(),
        selectLanguage: snapshot.data()['selectLanguage'],
        name: snapshot.data()['name']);
  }
}
