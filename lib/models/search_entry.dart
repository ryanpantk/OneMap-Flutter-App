class SearchEntry {
  SearchEntry(
      {required this.blockNumber,
      required this.roadName,
      required this.building,
      required this.address,
      required this.postalCode,
      required this.X,
      required this.Y,
      required this.latitude,
      required this.longitude});

  factory SearchEntry.fromJSON(Map<String, dynamic> json) {
    return SearchEntry(
        blockNumber: json["BLK_NO"],
        roadName: json["ROAD_NAME"],
        building: json["BUILDING"],
        address: json["ADDRESS"],
        postalCode: json["POSTAL"],
        X: json["X"],
        Y: json["Y"],
        latitude: json["LATITUDE"],
        longitude: json["LONGITUDE"]);
  }

  final String blockNumber;
  final String roadName;
  final String building;
  final String address;
  final String postalCode;
  final String X;
  final String Y;
  final String latitude;
  final String longitude;
}
