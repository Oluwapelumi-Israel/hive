import 'package:hive/hive.dart';

part 'profile_page.g.dart';

@HiveType(typeId: 0)
class PersonModel
{
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? email;

  @HiveType(typeId: 2)
  String? password;


  PersonModel({required this.name, required this.email, required this.password});
}