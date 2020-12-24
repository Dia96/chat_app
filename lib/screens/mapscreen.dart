import 'package:chat_app/main.dart';
import 'package:chat_app/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleScreen extends StatefulWidget {
  // location
  @override
  _GoogleScreenState createState() => _GoogleScreenState();
}

class _GoogleScreenState extends State<GoogleScreen> {
  GoogleMapController mapController;
  var locationMessage = '';
  String latitude;
  String longitude;

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var long = position.longitude;


    latitude = "$lat";
    longitude = "$long";

// setState(() {locationMessage = "Latitude: $lat and Longitude: $long";});
  }


 /* void googleMap() async {String googleUrl = "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
  if (await canLaunch(googleUrl)) {await launch(googleUrl);} else
    throw ("Couldn't open google maps");}*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: PrimaryColor, title: Text('Location'),
        leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MainScreen()));})),

      floatingActionButton: BoomMenu(fabAlignment: Alignment.bottomCenter,
          elevation: 10, animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: PrimaryColor, animatedIconTheme: IconThemeData(size: 22.0),
          onOpen: () {}, onClose: () {},
          overlayColor: Colors.black, overlayOpacity: 0.7,
          children: [MenuItem(elevation: 20,
            child: Icon(FontAwesomeIcons.toggleOff, color: Colors.white),
            title: 'Ghost Mode', titleColor: Colors.white,
            subtitle:'See others location without sharing yours',
            subTitleColor: Colors.white, backgroundColor: PrimaryColor,
            onTap: () {},
          ),
            MenuItem(elevation: 20,
              child: Icon(Icons.location_disabled, color: Colors.white),
              title: 'Disable location', titleColor: Colors.white,
              subtitle: 'No access to location', subTitleColor: Colors.white,
              backgroundColor: PrimaryColor,
              onTap: () {},
            ),
            MenuItem(elevation: 20, child: Icon(Icons.share, color: Colors.white),
              title: 'Share location', titleColor: Colors.white,
              subtitle: 'Share your live location with anyone',
              subTitleColor: Colors.white, backgroundColor: PrimaryColor,
              onTap: () {
              print (locationMessage);
              },
            )]),

        body : Stack(
          children: <Widget>[
            Container(child: GoogleMap(
              initialCameraPosition: CameraPosition(zoom: 15.0, target: LatLng(19.061500, 72.901056)),
        onMapCreated: (GoogleMapController googleMapController) {setState(() {mapController = googleMapController;});
              })),

         Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),width: MediaQuery.of(context).size.width,
           child: SearchMapPlaceWidget(hasClearButton: true,
             placeType: PlaceType.address, placeholder: 'Enter the location',
             apiKey: 'AIzaSyDeuBdq7DQtD98zgmGbD5NMFA2kmmFAKYo',
             onSelected: (Place place) async {
               Geolocation geolocation = await place.geolocation;
               mapController.animateCamera(
                   CameraUpdate.newLatLng(geolocation.coordinates));
               mapController.animateCamera(
                   CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
             },
           ),
         )
          ],

        ),
    );
  }
}

