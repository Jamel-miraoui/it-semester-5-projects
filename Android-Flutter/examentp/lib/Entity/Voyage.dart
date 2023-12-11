class Voyage {
  int id;
  String? depart;
  String? arrive;
  int duree;

  Voyage({this.id = 0, this.depart = "", this.arrive = "", this.duree = 0});

  Map<String, dynamic> toMap() {
    return {
      'depart': depart,
      'arrive': arrive,
      'duree': duree,
    };
  }

  factory Voyage.fromMap(Map<String, dynamic> map) {
    return Voyage(
      id: map['id'] as int,
      depart: map['depart'] as String,
      arrive: map['arrive'] as String,
      duree: map['duree'] as int,
    );
  }
}
