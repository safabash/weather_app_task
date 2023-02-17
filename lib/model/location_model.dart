class LocationModel {
  LocationModel({
    required this.ip,
  });

  String ip;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        ip: json["ip"],
      );

  Map<String, dynamic> toJson() => {
        "ip": ip,
      };
}
