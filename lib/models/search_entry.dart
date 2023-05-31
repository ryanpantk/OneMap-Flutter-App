class SearchEntry {
  SearchEntry(
      {this.blockNumber,
      this.roadName,
      this.building,
      this.address,
      this.postalCode,
      this.X,
      this.Y,
      this.latitude,
      this.longitude});

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

  final String? blockNumber;
  final String? roadName;
  final String? building;
  final String? address;
  final String? postalCode;
  final String? X;
  final String? Y;
  final String? latitude;
  final String? longitude;
}
