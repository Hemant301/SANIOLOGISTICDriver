import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:saniologisticdriver/api/regisrtApi.dart';

import '../shareFunction/consttext.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  String? _currentAddress;
  Position? _currentPosition;
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
          lat = _currentPosition?.latitude;
          lon = _currentPosition?.longitude;
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

  bool boolStatus = false;
  bool readyStatus = false;
  bool unloadingStatus = false;
  Map satatusData = {};

  getsatatusData() async {
    RegisterApi api = RegisterApi();
    Map data = await api.driverStatus();
    setState(() {
      satatusData = data['data'];
    });
    log(satatusData.toString());
  }

  @override
  void initState() {
    getsatatusData();
    // TODO: implement initState
    super.initState();
    _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backColor,
      appBar: AppBar(
        title: const Text('Status'),
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
      body: Column(children: [
        satatusData.isEmpty
            ? Container()
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset:
                            const Offset(1, 2), // changes position of shadow
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: <Color>[
                                Color(0xff9e27b0),
                                Color(0xffED17C9),
                              ]),
                          color: Colors.purple.shade200,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Your Booking     :  ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      satatusData['booking_id'].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Booking Date     :  ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      satatusData['date'].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Vehicle No          :  ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      satatusData['vehicleno'].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 30,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: List.generate(
                          satatusData['ridestatus'].length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      satatusData['ridestatus'][index]
                                          ['status'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      satatusData['ridestatus'][index]
                                              ['address']
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.pink.shade100,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 30,
                                  width: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      satatusData['ridestatus'][index]
                                              ['created_at']
                                          .toString(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Unloading",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3.3,
                            child: Center(
                              child: Switch.adaptive(
                                  value: unloadingStatus,
                                  onChanged: (val) async {
                                    print({
                                      "booking":
                                          satatusData['booking_id'].toString(),
                                      "lat": lat,
                                      "long": lon,
                                      "address": _currentAddress
                                    });

                                    Map data = await callApi.statusUnloading(
                                        booking: satatusData['booking_id']
                                            .toString(),
                                        lat: lat,
                                        long: lon,
                                        address: _currentAddress);
                                    if (data['status'] == true) {
                                      unloadingStatus = true;
                                      setState(() {});
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Ready for Next Load",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3.3,
                            child: Center(
                              child: Switch.adaptive(
                                  value: readyStatus,
                                  onChanged: (val) async {
                                    Map data = await callApi.readyfornextload(
                                        satatusData['vehicleno'].toString());
                                    if (data['status'] == true) {
                                      readyStatus = true;
                                      setState(() {});
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Idel            Setback",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3.3,
                            child: Center(
                              child: Switch.adaptive(
                                  value: boolStatus,
                                  onChanged: (val) async {
                                    Map data = await callApi.statusSetback(
                                        satatusData['vehicleno'].toString());
                                    if (data['status'] == true) {
                                      boolStatus = true;
                                      setState(() {});
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
      ]),
    );
  }
}


    //  Padding(
    //                   padding: const EdgeInsets.all(4.0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Column(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: const [
    //                           Text(
    //                             "Loading",
    //                             style: TextStyle(
    //                                 color: Colors.black,
    //                                 fontSize: 15,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                           Text(
    //                             "Morabadi Ranchi jharkhand 834006",
    //                             style: TextStyle(
    //                                 color: Colors.grey,
    //                                 fontSize: 10,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                         ],
    //                       ),
    //                       Container(
    //                         decoration: BoxDecoration(
    //                             color: Colors.pink.shade100,
    //                             borderRadius: BorderRadius.circular(10)),
    //                         height: 30,
    //                         width: 100,
    //                         child: Padding(
    //                           padding: const EdgeInsets.all(6.0),
    //                           child: Text(DateTime.now().toString()),
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.all(4.0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Column(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: const [
    //                           Text(
    //                             "Running",
    //                             style: TextStyle(
    //                                 color: Colors.black,
    //                                 fontSize: 15,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                           Text(
    //                             "Morabadi Ranchi jharkhand 834006",
    //                             style: TextStyle(
    //                                 color: Colors.grey,
    //                                 fontSize: 10,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                         ],
    //                       ),
    //                       Container(
    //                         decoration: BoxDecoration(
    //                             color: Colors.pink.shade100,
    //                             borderRadius: BorderRadius.circular(10)),
    //                         height: 30,
    //                         width: 100,
    //                         child: Padding(
    //                           padding: const EdgeInsets.all(6.0),
    //                           child: Text(DateTime.now().toString()),
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.all(4.0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Column(
    //                         mainAxisAlignment: MainAxisAlignment.start,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: const [
    //                           Text(
    //                             "Reached",
    //                             style: TextStyle(
    //                                 color: Colors.black,
    //                                 fontSize: 15,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                           Text(
    //                             "Morabadi Ranchi jharkhand 834006",
    //                             style: TextStyle(
    //                                 color: Colors.grey,
    //                                 fontSize: 10,
    //                                 fontWeight: FontWeight.bold),
    //                           ),
    //                         ],
    //                       ),
    //                       Container(
    //                         decoration: BoxDecoration(
    //                             color: Colors.pink.shade100,
    //                             borderRadius: BorderRadius.circular(10)),
    //                         height: 30,
    //                         width: 100,
    //                         child: Padding(
    //                           padding: const EdgeInsets.all(6.0),
    //                           child: Text(DateTime.now().toString()),
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.all(4.0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       const Text(
    //                         "Unloading",
    //                         style: TextStyle(
    //                             color: Colors.black,
    //                             fontSize: 15,
    //                             fontWeight: FontWeight.bold),
    //                       ),
    //                       SizedBox(
    //                         width: MediaQuery.of(context).size.width / 3.3,
    //                         child: Center(
    //                           child: Switch.adaptive(
    //                               value: false, onChanged: (val) async {}),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
               