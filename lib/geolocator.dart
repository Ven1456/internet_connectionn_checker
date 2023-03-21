import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoLocatorClass extends StatefulWidget {
  const GeoLocatorClass({Key? key}) : super(key: key);

  @override
  State<GeoLocatorClass> createState() => _GeoLocatorClassState();
}

class _GeoLocatorClassState extends State<GeoLocatorClass> {
  var lan = "";
  var lat = "";
  var address = "";
  Position? _position;
  void _getCurrentPosition ()
  async {
    // FETCH YOUR PRESENT LOCATION
    Position? position = await fetchLocation();
    // MARK YOUR COORDINATES
    List addressOfUser = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = addressOfUser[0];
    setState(() {
      _position = position;
      lan = position.longitude.toString();
      lat=position.latitude.toString();
      // DEFINE SOME COORDINATES THAT YOU WANT
      address = "${place.locality},${place.name},${place.administrativeArea}";

    });
  }
  // PERMISSIONS OF MAPS IN YOUR DEVICE
  Future<Position> fetchLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied)
      {
        permission =  await Geolocator.requestPermission();
      }
    if(permission == LocationPermission.denied)
    {
      return Future.error("Location is denied by User");
    }
    return await Geolocator.getCurrentPosition();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( _position != null  ? "Latitude : $lat" : "No Location Founded"),
            Text( _position != null  ? "Longitude : $lan" : "No Location Founded"),
            Text(address),
            ElevatedButton(onPressed: (){
              _getCurrentPosition();
            }, child: const Text("Get You Location"))
          ],
        ),
      )
    );
  }
}
class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}