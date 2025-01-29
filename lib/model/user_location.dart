class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinates;
  final LocationTimezone timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> e) {
    final location = UserLocation(
      city: e['location']['city'],
      state: e['location']['state'],
      country: e['location']['country'],
      postcode: e['location']['postcode'].toString(),
      street: LocationStreet.fromMap(e['street']),
      coordinates: LocationCoordinate.fromMap(e['coordinates']),
      timezone: LocationTimezone.fromMap(e['timezone']),
    );
    return location;
  }
}

class LocationCoordinate {
  final String latitude;
  final String longitude;

  LocationCoordinate({
    required this.latitude,
    required this.longitude,
  });

  factory LocationCoordinate.fromMap(Map<String, dynamic> e) {
    return LocationCoordinate(
      latitude: e['latitude'],
      longitude: e['longitude'],
    );
  }
}

class LocationTimezone {
  final String offset;
  final String description;

  LocationTimezone({
    required this.offset,
    required this.description,
  });
  factory LocationTimezone.fromMap(Map<String, dynamic> e) {
    return LocationTimezone(offset: e['offset'], description: e['description']);
  }
}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({
    required this.number,
    required this.name,
  });
  factory LocationStreet.fromMap(Map<String, dynamic> e) {
    return LocationStreet(number: e['number'], name: e['name']);
  }
}
