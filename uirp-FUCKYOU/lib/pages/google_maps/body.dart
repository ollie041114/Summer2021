import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uirp/pages/google_maps/background.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uirp/pages/google_maps/zoomButton.dart';
import 'package:uirp/slideProfile/sideProfileRemake.dart';

import 'scanQR.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
//for bicycle marker
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

//for map controller
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  final List<Marker> markers = [];

  void _onMapCreated(GoogleMapController controller) async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/bicycle_marker.png', 100);
    final BitmapDescriptor bicycleMarker =
        BitmapDescriptor.fromBytes(markerIcon);
    mapController = controller;
    locatePosition();
    markers.add(Marker(
        icon: bicycleMarker,
        markerId: MarkerId(Random.secure().nextInt(100).toString()),
        position: LatLng(35.571479954171494, 129.19083382934332)));
    markers.add(Marker(
        icon: bicycleMarker,
        markerId: MarkerId(Random.secure().nextInt(100).toString()),
        position: LatLng(35.57624869883272, 129.19186748564243)));
  }

  addMarker(cordinate) async {
    int id = Random.secure().nextInt(100);
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/bicycle_marker.png', 100);
    final BitmapDescriptor bicycleMarker =
        BitmapDescriptor.fromBytes(markerIcon);
    setState(() {
      markers.add(Marker(
        icon: bicycleMarker,
        position: cordinate,
        markerId: MarkerId(id.toString()),
      ));
    });
  }

//for current position
  late Position currenPosition;
  var geoLocator = Geolocator();
  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currenPosition = position;
    LatLng latlngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        new CameraPosition(target: latlngPosition, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: SideProfileRemake(
      customChild: Stack(children: [
        GoogleMap(
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          myLocationButtonEnabled: false,
          mapType: MapType.normal,
          myLocationEnabled: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: markers.toSet(),
          onTap: (cordinate) {
            mapController.animateCamera(CameraUpdate.newLatLng(cordinate));
            addMarker(cordinate);
          },
        ),
        Positioned(
            left: size.width * 0.025,
            bottom: size.height * 0.08,
            width: size.width * 0.95,
            child: ScanQR()),
        Positioned(
            bottom: size.height * 0.18,
            right: size.width * 0.025,
            child: ZoomButton(
                onPressed: () {
                  mapController.animateCamera(CameraUpdate.zoomOut());
                },
                text: Text("-"))),
        Positioned(
            bottom: size.height * 0.26,
            right: size.width * 0.025,
            child: ZoomButton(
              onPressed: () {
                mapController.animateCamera(CameraUpdate.zoomIn());
              },
              text: Text("+"),
            )),
        Positioned(
            bottom: size.height * 0.34,
            right: size.width * 0.025,
            child: ZoomButton(
              onPressed: () {
                locatePosition();
              },
              text: Icon(Icons.location_searching),
            ))
      ]),
    ));
  }
}
