import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saniologisticdriver/util/blog.dart';

import '../api/regisrtApi.dart';
import 'drawer.dart';

// Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
Map pointData = {};
Map getProfileData = {};

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  GlobalKey<ScaffoldState> scaffoldkeyApp = GlobalKey();
  GoogleMapController? mapController;
  String? _currentAddress;
  Position? _currentPosition;
  Timer? timer;
  double? lat;
  double? lon;
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);

      try {
        RegisterApi api = RegisterApi();
        Map data = await api.locationUpdate(
            latitude: _currentPosition?.latitude.toString(),
            longitude: _currentPosition?.longitude.toString());
        setState(() {
          lat:
          _currentPosition?.latitude;
          lon:
          _currentPosition?.longitude;
          log(
            "the lat long is update${_currentPosition?.latitude}${_currentPosition?.longitude}",
          );
        });
      } catch (e) {
        print(e);
      }
    }).catchError((e) {
      debugPrint(e);
    });
  }

  getProfile() async {
    log("dfgvdgjvdfvfvhjfhjvfj");
    RegisterApi api = RegisterApi();
    Map data = await api.grtprofileDataApi();
    setState(() {
      getProfileData = data['data'];
    });
    log(getProfileData.toString());
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    getProfile();
    // TODO: implement initState
    _onMapCreated;
    timer = Timer.periodic(
        const Duration(minutes: 5), (Timer t) => _getCurrentPosition());
    super.initState();
    getPoints();
  }

  getPoints() async {
    Map data = await callApi.fetchPoints();
    if (data['status'] == true) {
      pointData = data;
      setState(() {});
    }
  }

  // getlatlong() {
  //   Future.delayed(const Duration(seconds: 0), () {
  //     // Navigator.pushNamed(context, '/HomePage');
  //     _getCurrentPosition();
  //   });
  // }

  // getLiveData() async {
  //   _getCurrentPosition();
  // }

  @override
  Widget build(BuildContext context) {
    log(_currentPosition?.latitude.toString() ?? "");
    return Scaffold(
      key: scaffoldkeyApp,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: const DrawerPage(),
      ),
      appBar: AppBar(
        title: const Text('DashBoard'),
        centerTitle: true,
        // backgroundColor: Constant.primaryColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color(0xff9e27b0),
                Color(0xffED17C9),
              ])),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/background.jpg"))),
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const SizedBox(height: 15),
                // Text('LAT: ${_currentPosition?.latitude}'),
                // Text('LNG: ${_currentPosition?.longitude}'),
                // Text('ADDRESS: ${_currentAddress ?? ""}'),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset:
                              const Offset(1, 2), // changes position of shadow
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () async {},
                              child: Center(
                                child: Image.asset(
                                  "assets/logo.png",
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                            const Text(
                              "Name",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              userCred.getUserName(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Dhaba                    :  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("data")
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Petrol Pump         :  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("data")
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Cover Distance    :  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("data")
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Remaining            :  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("data")
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Status                    :  ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("data")
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ]),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Text(
                    "Current Location",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        // image: DecorationImage(
                        //     fit: BoxFit.cover,
                        //     image: AssetImage("assets/logo.png"))
                        ),
                    child: GoogleMap(
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(_currentPosition?.latitude ?? 0.0,
                            _currentPosition?.longitude ?? 0.0),
                        zoom: 15.0,
                      ),
                      key: const ValueKey('uniqueey'),
                      onMapCreated: _onMapCreated,
                      markers: {
                        Marker(
                            markerId: const MarkerId('anyUniqueId'),
                            position: LatLng(_currentPosition?.latitude ?? 0.0,
                                _currentPosition?.longitude ?? 0.0),
                            infoWindow:
                                const InfoWindow(title: 'Some Location'))
                      },
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: _getCurrentPosition,
                    child: const Text("Refresh your location"),
                  ),
                ),
              ]))),
    );
  }
}
