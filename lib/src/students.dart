
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'students.g.dart';

@JsonSerializable()
class Student {
  Student({
    this.idetudiant,
    this.nometudiant,
    this.prenometudiant,
    this.cpetudiant,
    this.latitude,
    this.longitude,
    this.villeetudiant,
  });
  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);

  final int idetudiant;
  final String nometudiant;
  final String prenometudiant;
  final int cpetudiant;
  final double latitude;
  final double longitude;
  final String villeetudiant;


}


// A function that converts a response body into a List<Student>.
List<Student> parseStudent(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Student>((json) => Student.fromJson(json)).toList();
}
// Retrieve student API data
Future<List<Student>> getStudents() async {
  const googleLocationsURL = 'http://92.154.94.25/~SLAM2/Rest_server_etuds_flutter/index.php/api/MonAppli/etudiants/format/json';

  // Retrieve the locations of Google offices
  final response = await http.get(googleLocationsURL);
  if (response.statusCode == 200) {
    return  compute(parseStudent, response.body);
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
            ' ${response.reasonPhrase}',
        uri: Uri.parse(googleLocationsURL));
  }
}
