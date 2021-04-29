part of 'models.dart';

class UserFlutix extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectGenres;
  final String selectLanguage;
  final int balance;

  UserFlutix(this.id, this.email,
      {this.name,
      this.profilePicture,
      this.selectGenres,
      this.selectLanguage,
      this.balance});

  @override
  String toString() {
    return "[$id] - $name , $email";
  }

  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        selectLanguage,
        name,
        profilePicture,
        selectGenres,
        selectLanguage,
        balance
      ];
}
