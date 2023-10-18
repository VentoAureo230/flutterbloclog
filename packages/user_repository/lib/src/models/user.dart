import 'package:equatable/equatable.dart';
import '../entities/entities.dart';

class MyUser extends Equatable {
  final String userID;
  final String email;
  final String name;
  final int age;
  final String experience;
  final String pfp;
  final List<String> diplomas;

  const MyUser({
    required this.userID, 
    required this.email, 
    required this.name,
    required this.age,
    required this.experience,
    required this.pfp,
    required this.diplomas});

  static const empty = MyUser(
    userID: '',
    email: '',
    name: '',
    age: null,
    experience: '',
    pfp: '',
    diplomas: '',
  );

  MyUser copyWith({
    String? userID,
    String? email,
    String? name,
  }) {
    return MyUser(
        userID: userID ?? this.userID,
        email: email ?? this.email,
        name: name ?? this.name);
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
        userID: userID,
        email: email,
        name: name,
        age: age,
        experience: experience,
        profilePhoto: pfp,
        diplomas: []);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        userID: entity.userID, email: entity.email, name: entity.name);
  }

  @override
  List<Object?> get props => [userID, email, name];
}
