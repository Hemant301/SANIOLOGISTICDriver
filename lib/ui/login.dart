import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saniologisticdriver/api/regisrtApi.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? mobile;
  TextEditingController mobController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.jpg'), fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: WillPopScope(
            onWillPop: () {
              exit(0);
            },
            child: ListView(
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
                              horizontal: 20, vertical: 20),
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
                        'Registration / Login',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        'Add your phone number, we will send you a verification ',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const Text('code so we know we are real',
                          style: TextStyle(fontSize: 12)),
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
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Card(
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: const Color(0xff9e27b0),
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(10),
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
                                    child: TextField(
                                      controller: mobController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                '+91',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                        // prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 5),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          mobile = value;
                                          print(mobile);
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                loading == false
                                    ? Card(
                                        elevation: 20,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: InkWell(
                                          onTap: () async {
                                            if ((mobController.text).length <=
                                                9) {
                                              // print("${(phonecontroller.text).length <= 9}");
                                              Fluttertoast.showToast(
                                                  msg: "Invalid phone no!",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
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
                                              Map data = await authapi.loginApi(
                                                phone: mobController.text,
                                              );
                                              print(data["status"].runtimeType);

                                              if (data["status"] == true) {
                                                //  userCred.addUserId(data["user"]["_id"]);
                                                setState(() {
                                                  loading = false;
                                                });
                                                Future.delayed(
                                                    const Duration(seconds: 0),
                                                    () {
                                                  Navigator.pushNamed(
                                                      context, "/otp",
                                                      arguments: {
                                                        "phone":
                                                            mobController.text,
                                                      });
                                                });
                                              } else {
                                                setState(() {
                                                  loading = false;
                                                });
                                                Fluttertoast.showToast(
                                                    msg: " ${data['Msg']}! ",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
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
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                80,
                                            // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                            // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                              'Send',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25),
                                            )),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        child:
                                            const CircularProgressIndicator()),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
