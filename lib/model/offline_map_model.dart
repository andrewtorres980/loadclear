class OfflienMapModel{
  final int? id;
  final String? name;
  final String? dateTime;
  final double? latitude;
  final double? longitude;

  OfflienMapModel( {
    this.id,
    this.name,
    this.dateTime,
    this.latitude, 
    this.longitude,
  });

  factory OfflienMapModel.fromJson(Map<String,dynamic> json){
   return OfflienMapModel(
  id: json['id'] as int?,
      name: json['name'] as String?,
      dateTime: json['dateTime'] as String?,
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
    );
  }
    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['dateTime'] = dateTime;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

}