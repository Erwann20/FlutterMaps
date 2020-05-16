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

  BitmapDescriptor pinLocationIcon;

  @override
  void initState() {
    super.initState();
    setCustomMapPin();

    print(pinLocationIcon);
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 4),
        'assets/markerpics32x32.png');
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await students.getGoogleOffices();

    setState(() {
      _markers.clear();
      for (final office in googleOffices) {
        final marker = Marker(
          markerId: MarkerId(office.nometudiant),
          position: LatLng(office.latitude, office.longitude),
          infoWindow: InfoWindow(
            title: office.nometudiant + " " + office.prenometudiant,
            snippet: office.villeetudiant,
          ),
          icon: pinLocationIcon
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
          title: const Text('Localisation étudiante'),
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