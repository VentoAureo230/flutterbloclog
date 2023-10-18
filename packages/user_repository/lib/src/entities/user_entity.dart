import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String userID;
  final String email;
  final String name;
  final int? age;
  final String experience;
  final String profilePhoto;
  final List<String> diplomas;

  const MyUserEntity(
      {required this.userID, 
      required this.email, 
      required this.name,
      required this.age,
      required this.experience,
      required this.profilePhoto,
      required this.diplomas});

  Map<String, Object?> toDocument() {
    return {'userID': userID, 'email': email, 'name': name};
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
        userID: doc['userID'], email: doc['email'], name: doc['name'], age: doc['age'], experience: doc['experience'], profilePhoto: '', diplomas: const []);
  }

  @override
  List<Object?> get props => [userID, email, name];
}
