import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  GoogleMapController mapController;
  Location location = new Location();
  var positions;
  @override
  void initState() {
    getCurrentLocation().then((pos){
      setState(() {
        positions = pos;
      });

    });
    super.initState();
  }
  
   getCurrentLocation() async {
     return await location.getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Localização"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(positions.latitude, positions.longitude),
            zoom: 20,
          ),
          myLocationEnabled: true,
          mapType: MapType.normal,
          ),
      )
          
        );
  }
}