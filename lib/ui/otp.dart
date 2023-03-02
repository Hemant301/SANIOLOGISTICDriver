import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:otp_text_field/otp_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:saniologisticdriver/api/regisrtApi.dart';

import '../util/blog.dart';

// import 'package:otp_text_field/style.dart';
class OtpPage extends StatefulWidget {
  const OtpPage({
    Key? key,
  }) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  // OtpFieldController otpController = OtpFieldController();
  TextEditingController otpController = TextEditingController();
  var currentText;

  String acid = "";
  String? deviceIddd;
  bool loading = false;
  Future<void> initPlatformState() async {
    String? deviceId;

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
      setState(() {
        deviceIddd = deviceId;
        print("deviceId->$deviceId");
      });
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // setState(() {
    //   deviceIddd = deviceId;
    //   print("deviceId->$deviceId");
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    // print("${data['ACCId']}}-------------123");
    acid = data['phone'];
    print(data['phone']);
    print("hemant$deviceIddd");
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Card(
                      elevation: 10,
                      shape: const CircleBorder(),
                      child: Container(
                        height: 130,
                        width: 130,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/profile.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Verification',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    const Text(
                      'Enter your OTP code number',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 80,
                        height: MediaQuery.of(context).size.height * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Column(
                            children: [
                              PinCodeTextField(
                                appContext: context,
                                // autoFocus:true,
                                length: 4,
                                obscureText: false,
                                // animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 50,
                                  fieldWidth: 50,
                                  activeFillColor: Colors.white,
                                  selectedColor: Colors.green,
                                  inactiveColor: const Color(0xff9e27b0),
                                  // activeColor: Color(0xff9e27b0),
                                ),
                                blinkWhenObscuring: false,
                                // blinkDuration:Duration(milliseconds: 300),
                                controller: otpController,
                                onCompleted: (v) {
                                  print("Completed");
                                },
                                onChanged: (value) {
                                  print(value);
                                  setState(() {
                                    currentText = value;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Card(
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    if ((otpController.text).isEmpty) {
                                      // print("${(phonecontroller.text).length <= 9}");
                                      Fluttertoast.showToast(
                                          msg: "Invalid otp",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0);

                                      return;
                                    }
                                    setState(() {
                                      loading = true;
                                    });

                                    RegisterApi authapi = RegisterApi();
                                    try {
                                      Map data = await authapi.verifyOtp(
                                          phone: acid,
                                          otp: otpController.text,
                                          device_id: deviceIddd);
                                      print(data["status"].runtimeType);
                                      print("fffffffffff$acid");
                                      if (data["status"] == true) {
                                        userCred
                                            .addUserId(data["data"]["user_id"]);
                                        userCred.addApiToken(
                                            data["data"]["api_token"]);
                                        userCred.addDeviceId(
                                            data["data"]["device_id"]);
                                        setState(() {
                                          loading = false;
                                        });

                                        if (data['role']
                                                .toString()
                                                .toUpperCase() !=
                                            "NULL") {
                                          Future.delayed(
                                              const Duration(seconds: 0), () {
                                            Navigator.popAndPushNamed(
                                                context, "/bottomNav");
                                          });
                                        } else {
                                          Future.delayed(
                                              const Duration(seconds: 0), () {
                                            Navigator.popAndPushNamed(
                                                context, "/signup");
                                          });
                                        }
                                      } else {
                                        setState(() {
                                          loading = false;
                                        });
                                        Fluttertoast.showToast(
                                            msg: " ${data['message']}! ",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        setState(() {
                                          loading = false;
                                        });
                                      }
                                    } catch (e) {}
                                    // Navigator.pushReplacementNamed(context, '/main');
                                  },
                                  child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width - 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Color(0xff9e27b0),
                                            Color(0xffED17C9)
                                          ]),
                                      // color:Color(0xff9e27b0),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          // spreadRadius: 12,
                                          offset: const Offset(5, 5),
                                          color: const Color(0xff9e27b0)
                                              .withOpacity(.5),
                                        ),
                                      ],
                                    ),
                                    child: const Center(
                                        child: Text(
                                      'Verify',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Resend',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue[800],
                                  decoration: TextDecoration.underline,
                                )),
                            Text('OTP',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue[800],
                                  decoration: TextDecoration.underline,
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
