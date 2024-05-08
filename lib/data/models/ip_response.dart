import 'package:latlong2/latlong.dart';

class IpResponseModel {
  String? status;
  String? country;
  String? countryCode;
  String? region;
  String? regionName;
  String? city;
  String? zip;
  double? lat;
  double? lon;
  String? timezone;
  String? isp;
  String? org;
  String? ipResponseModelAs;
  String? query;

  IpResponseModel({
    this.status,
    this.country,
    this.countryCode,
    this.region,
    this.regionName,
    this.city,
    this.zip,
    this.lat,
    this.lon,
    this.timezone,
    this.isp,
    this.org,
    this.ipResponseModelAs,
    this.query,
  });

  LatLng? get getLatLng =>
      lat != null && lon != null ? LatLng(lat!, lon!) : null;

  factory IpResponseModel.fromJson(Map<String, dynamic>? json) =>
      IpResponseModel(
        status: json?["status"],
        country: json?["country"],
        countryCode: json?["countryCode"],
        region: json?["region"],
        regionName: json?["regionName"],
        city: json?["city"],
        zip: json?["zip"],
        lat: json?["lat"]?.toDouble(),
        lon: json?["lon"]?.toDouble(),
        timezone: json?["timezone"],
        isp: json?["isp"],
        org: json?["org"],
        ipResponseModelAs: json?["as"],
        query: json?["query"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "country": country,
        "countryCode": countryCode,
        "region": region,
        "regionName": regionName,
        "city": city,
        "zip": zip,
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "isp": isp,
        "org": org,
        "as": ipResponseModelAs,
        "query": query,
      };
}
