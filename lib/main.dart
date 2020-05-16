import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;
import 'src/students.dart' as students;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await students.getGoogleOffices();
    print(googleOffices.length);


    setState(() {
      _markers.clear();
      for (final office in googleOffices) {
        final marker = Marker(
          markerId: MarkerId(office.nometudiant),
          position: LatLng(office.latitude, office.longitude),
          infoWindow: InfoWindow(
            title: office.nometudiant,
            snippet: office.villeetudiant,
          ),
        );
        _markers[office.nometudiant] = marker;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Coucou maman !!!!!'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(46, 2),
            zoom: 6,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}