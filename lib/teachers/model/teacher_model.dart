import '../../utilities/constants/constants.dart';

class Teacher {
  late int id;
  late String name;
  late String country;
  late double rating;
  late bool isFavourite;
  late List<String> specialities;
  late String description;
  late String avatar;

  Teacher(this.id, this.name, this.country, this.rating, this.isFavourite,
      this.specialities, this.description, this.avatar);
}
