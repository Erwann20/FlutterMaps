// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    idetudiant: json['idetudiant'] as int,
    nometudiant: json['nometudiant'] as String,
    prenometudiant: json['prenometudiant'] as String,
    cpetudiant: json['cpetudiant'] as int,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    villeetudiant: json['villeetudiant'] as String,
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'idetudiant': instance.idetudiant,
      'nometudiant': instance.nometudiant,
      'prenometudiant': instance.prenometudiant,
      'cpetudiant': instance.cpetudiant,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'villeetudiant': instance.villeetudiant,
    };
