class Station {
  int id;
  String nomstation;

  Station({this.id = 0, this.nomstation = ""});

  Map<String, dynamic> toMap() {
    return {
      'name': nomstation,
    };
  }

  factory Station.fromMap(Map<String, dynamic> map) {
    return Station(
      id: map['id'] as int,
      nomstation: map['name'] as String,
    );
  }

}
