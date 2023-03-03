import 'package:flutter/material.dart';
import 'package:saniologisticdriver/ui/dashboard.dart';

import '../util/blog.dart';

int hometabindex = 0;

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  // List alldata = [];
  // getProfile() async {
  //   try {
  //     ArchiveApi _ArcgiveApi = ArchiveApi();
  //     List data = await _ArcgiveApi.getAccountdetels();
  //     setState(() {
  //       alldata = data;
  //     });
  //     print(alldata);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getProfile();
  // }

  // void _launchtwitterUrl(String _twitterUrl) async {
  //   if (!await launchUrl(Uri.parse(
  //     _twitterUrl,
  //   ))) throw 'Could not launch $_twitterUrl';
  // }

  // Future<bool> stopForegroundTask() async {
  //   return await FlutterForegroundTask.stopService();
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/drawerimage.jpg",
                  ),
                ),
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40, left: 40, right: 40, bottom: 10),
                  child: Image.asset(
                    "assets/profile.png",
                    height: 100,
                    width: 100,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 30,
                      child: Center(
                          child: Text(
                        getProfileData['name'],
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.green,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width - 30,
                        child: const Center(
                            child: Icon(
                          Icons.wallet_giftcard_sharp,
                          color: Colors.white,
                          size: 40,
                        ))),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 30,
                      child: Center(
                          child: Text(
                        "${pointData['totalpoint']} points",
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      // BoxShadow(
                      //   color: Colors.grey,
                      //   spreadRadius: 2,
                      //   blurRadius: 2,
                      //   offset: Offset(1, 2), // changes position of shadow
                      // )
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/profile");
                      // Navigator.pop(context);

                      // Navigator.push(
                      //   context,
                      // MaterialPageRoute(
                      //     builder: (context) => NavBar(
                      //           pageIndex: 4,
                      //         )),
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/profile.png",
                                height: 25,
                                width: 25,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                        color: Colors.black,
                                        letterSpacing: 1,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                ),
                // DrawerItem(
                //   name: "My Account",
                //   image: "assets/user (1) 1.png",
                //   onTap: () {
                //     Navigator.pushNamed(context, "/profile");
                //     // Navigator.push(
                //     //   context,
                //     // MaterialPageRoute(
                //     //     builder: (context) => NavBar(
                //     //           pageIndex: 4,
                //     //         )),
                //   },
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "Document",
                  image: "assets/profile.png",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/uploadDocument");
                  },
                ),
                DrawerItem(
                  name: "Add Bank Details",
                  image: "assets/profile.png",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/addbankdetail");
                  },
                ),
                DrawerItem(
                  name: "Corporate Load",
                  image: "assets/profile.png",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/corporateload");
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "My Booking",
                  image: "assets/profile.png",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/mybooking");
                    // Navigator.pop(context);

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => NavBar(
                    //             pageIndex: 0,
                    //           )),
                    // );
                    // setState(() {
                    //   hometabindex = 3;
                    // });

                    // Future.delayed(Duration(seconds: 2), () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => HomePage(
                    //               activeTab: 3,
                    //             )),
                    //   );
                    // });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "Upcoming Booking",
                  image: "assets/profile.png",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/upcomingBooking");
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "Assigment",
                  image: "assets/profile.png",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/assignment");
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "My Offers",
                  image: "assets/profile.png",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/offer");

                    // _launchtwitterUrl("https://twitter.com/forex_blues");
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "Rewards Points",
                  image: "assets/profile.png",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/points");
                    // _launchtwitterUrl("https://www.facebook.com/forexblues/");
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "Notification",
                  image: "assets/profile.png",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/notification");
                    // Navigator.pop(context);

                    // _launchtwitterUrl(
                    //     "https://www.linkedin.com/company/forexblues?originalSubdomain=in");
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "About Us",
                  image: "assets/profile.png",
                  onTap: () {
                    Navigator.pop(context);

                    // _launchtwitterUrl(
                    //     "https://www.youtube.com/channel/UCP9s1oyDvYJn7sVrO217O7Q");
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "Contact Us",
                  image: "assets/profile.png",
                  onTap: () {
                    Navigator.pop(context);
                    // _launchtwitterUrl("https://www.fxblues.com/");
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DrawerItem(
                  name: "Logout",
                  image: "assets/profile.png",
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed(
                      '/login',
                    );
                    userCred.logoutUser();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),

                const SizedBox(
                  height: 40,
                ),
              ],
            )
          ])),
    );
  }
}

class DrawerItem extends StatelessWidget {
  DrawerItem({Key? key, this.onTap, this.name, this.image}) : super(key: key);
  Function()? onTap;
  String? name;
  String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          // BoxShadow(
          //   color: Colors.grey,
          //   spreadRadius: 2,
          //   blurRadius: 2,
          //   offset: Offset(1, 2), // changes position of shadow
          // )
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    image!,
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    name!,
                    style: const TextStyle(
                        color: Colors.black,
                        letterSpacing: 1,
                        // fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}


  // Container(
  //                   decoration: BoxDecoration(
  //                     color: Colors.white,
  //                     boxShadow: [],
  //                   ),
  //                   child: InkWell(
  //                     onTap: () {
  //                       Navigator.pushNamed(context, "/login");
  //                     },
  //                     child: Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: [
  //                           Row(
  //                             children: [
  //                               Image.asset(
  //                                 "assets/user (1) 1.png",
  //                                 height: 25,
  //                                 width: 25,
  //                               ),
  //                               SizedBox(
  //                                 width: 15,
  //                               ),
  //                               Column(
  //                                 mainAxisAlignment: MainAxisAlignment.start,
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(
  //                                     "Log in",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         letterSpacing: 1,
  //                                         // fontWeight: FontWeight.bold,
  //                                         fontSize: 15),
  //                                   ),
  //                                   Text(
  //                                     "For a better experience",
  //                                     maxLines: 1,
  //                                     style: TextStyle(
  //                                         color: Colors.green,
  //                                         letterSpacing: 1,
  //                                         // fontWeight: FontWeight.bold,
  //                                         fontSize: 10),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ],
  //                           ),
  //                           Icon(Icons.arrow_forward_ios)
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),