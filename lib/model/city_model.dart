class CityModel {
  CityModel({
    required this.ip,
    required this.hostname,
    required this.city,
    required this.region,
    required this.country,
    required this.loc,
    required this.org,
    required this.postal,
    required this.timezone,
    required this.readme,
  });

  String ip;
  String hostname;
  String city;
  String region;
  String country;
  String loc;
  String org;
  String postal;
  String timezone;
  String readme;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        ip: json["ip"],
        hostname: json["hostname"],
        city: json["city"],
        region: json["region"],
        country: json["country"],
        loc: json["loc"],
        org: json["org"],
        postal: json["postal"],
        timezone: json["timezone"],
        readme: json["readme"],
      );

  Map<String, dynamic> toJson() => {
        "ip": ip,
        "hostname": hostname,
        "city": city,
        "region": region,
        "country": country,
        "loc": loc,
        "org": org,
        "postal": postal,
        "timezone": timezone,
        "readme": readme,
      };
}
