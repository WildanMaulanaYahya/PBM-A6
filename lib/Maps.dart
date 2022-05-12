import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Set<Marker> _markers = {};
  final LatLng _currentPosition = LatLng(3.595196, 98.672226);

  @override
  void initState() {
    _markers.add(
      Marker(
        markerId: MarkerId("3.595196, 98.672226"),
        position: _currentPosition,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: _currentPosition,
            zoom: 14.0,
          ),
          markers: _markers,
          onTap: (position) {
            setState(() {
              _markers.add(
                Marker(
                  markerId:
                      MarkerId("${position.latitude}, ${position.longitude}"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: position,
                ),
              );
            });
          }),
    );
  }
}
