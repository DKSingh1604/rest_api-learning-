import 'package:rest_api/model/user_dob.dart';
import 'package:rest_api/model/user_location.dart';
import 'package:rest_api/model/user_name.dart';
import 'package:rest_api/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String nat;
  final String cell;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture? picture;

  User({
    required this.email,
    required this.gender,
    required this.phone,
    required this.nat,
    required this.cell,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName(
      title: e['name']['title'],
      first: e['name']['first'],
      last: e['name']['last'],
    );
    final dob = UserDob(
      date: DateTime.parse(e['dob']['date']),
      age: e['dob']['age'],
    );

    final picture = UserPicture(
      large: e['picture']['large'],
      medium: e['picture']['medium'],
      thumbnail: e['picture']['thumbnail'],
    );

    final location = UserLocation(
      city: e['location']['city'],
      state: e['location']['state'],
      country: e['location']['country'],
      postcode: e['location']['postcode'].toString(),
      street: LocationStreet(
          number: e['location']['street']['number'],
          name: e['location']['street']['name']),
      coordinates: LocationCoordinate(
          latitude: e['location']['coordinates']['latitude'],
          longitude: e['location']['coordinates']['longitude']),
      timezone: LocationTimezone(
          offset: e['location']['timezone']['offset'],
          description: e['location']['timezone']['description']),
    );

    return User(
      cell: e['cell'],
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
      phone: e['phone'],
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
