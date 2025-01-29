class UserDob {
  DateTime date;
  final int age;

  UserDob({
    required this.date,
    required this.age,
  });

  factory UserDob.fromMap(Map<String, dynamic> e) {
    return UserDob(
      date: DateTime.parse(e['dob']['date']),
      age: e['dob']['age'],
    );
  }
}
