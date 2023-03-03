import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../api/regisrtApi.dart';
import '../shareFunction/consttext.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Map getProfileData = {};

  getProfile() async {
    RegisterApi api = RegisterApi();
    Map data = await api.grtprofileDataApi();
    setState(() {
      getProfileData = data['data'];
    });
    log(getProfileData.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.backColor,
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
        title: const Text('MY Profile'),
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
      body: SingleChildScrollView(
        child: getProfileData.isEmpty
            ? const Center(
                child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ))
            : Column(children: [
                Container(
                  // height: MediaQuery.of(context).size.width / 2,
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
                    Image.asset(
                      "assets/profile.png",
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      "${getProfileData['name']}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Id :${getProfileData['user_id']}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${getProfileData['address'] ?? "N/A"}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ]),
                ),
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
                              offset: const Offset(
                                  1, 2), // changes position of shadow
                            )
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  profileitem(
                                    title: "User Type",
                                    disc:
                                        "${getProfileData['user_type'] ?? "N/A"}",
                                  ),
                                  profileitem(
                                    title: "Vehicle",
                                    disc: "JH17426",
                                  ),
                                  profileitem(
                                    title: "Mobile No.",
                                    disc: "${getProfileData['phone'] ?? "N/A"}",
                                  ),
                                  profileitem(
                                    title: "Whatsapp No.",
                                    disc:
                                        "${getProfileData['whatsapp_no'] ?? "N/A"}",
                                  ),
                                  profileitem(
                                    title: "Email",
                                    disc: "${getProfileData['email'] ?? "N/A"}",
                                  ),
                                  profileitem(
                                      title: "DOB",
                                      disc: DateFormat('dd-MM-yyyy').format(
                                          DateTime.parse(getProfileData[
                                                      'date_of_birth']
                                                  .toString()) ??
                                              DateTime.now())
                                      // "${getProfileData['date_of_birth'] ?? "N/A"}",
                                      ),
                                  profileitem(
                                    title: "Pan No.",
                                    disc:
                                        "${getProfileData['pan_no'] ?? "N/A"}",
                                  ),
                                  profileitem(
                                    title: "Aadhar No",
                                    disc:
                                        "${getProfileData['aadhar_no'] ?? "N/A"}",
                                  ),

                                  // profileitem(
                                  //   title: "Pupil",
                                  //   disc: "${getProfileData['phone'] ?? "N/A"}",
                                  // ),
                                  profileitem(
                                    title: "Address",
                                    disc:
                                        "${getProfileData['address']} ${getProfileData['city']} ${getProfileData['state']}" ??
                                            "N/A",
                                  ),
                                ])))),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(
                                1, 2), // changes position of shadow
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Personal Information",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.add)
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          profileitem(
                            title: "ESI",
                            disc: "${getProfileData['esi_no'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "PF",
                            disc: "${getProfileData['pf_no'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "Personal Insurance",
                            disc:
                                "${getProfileData['personal_insurance'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "Nominee",
                            disc: "${getProfileData['spouse_name'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "Father name",
                            disc: "${getProfileData['father_name'] ?? "N/A"}",
                          ),
                          profileitem(
                              title: "Father DOB",
                              disc: DateFormat('dd-MM-yyyy')
                                  .format(DateTime.parse(
                                          getProfileData['f_dob'].toString()) ??
                                      DateTime.now())
                                  .toString()),
                          profileitem(
                            title: "Mother Name",
                            disc: "${getProfileData['mother_name'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "Mother DOB",
                            disc: "${getProfileData['m_dob'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "Spouse name",
                            disc: "${getProfileData['spouse_name'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "Child Name 1",
                            disc: "${getProfileData['child1_name'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "Child 2 DOB",
                            disc: "${getProfileData['c1_dob'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "Child Name 2",
                            disc: "${getProfileData['child2_name'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "Child 2 DOB",
                            disc: "${getProfileData['c2_dob'] ?? "N/A"}",
                          ),
                        ],
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade200,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(
                                1, 2), // changes position of shadow
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Bank Account Information",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.add)
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          profileitem(
                            title: "Account type",
                            disc:
                                "${getProfileData['bank_details']['account_type'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "Account holder",
                            disc:
                                "${getProfileData['bank_details']['account_holder'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "A/C number",
                            disc:
                                "${getProfileData['bank_details']['account_number'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "Ifsc code",
                            disc:
                                "${getProfileData['bank_details']['ifsc_code'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "Bank",
                            disc:
                                "${getProfileData['bank_details']['name'] ?? "N/A"}",
                          ),
                          profileitem(
                            title: "Branch",
                            disc:
                                "${getProfileData['bank_details']['branch'] ?? "N/A"}",
                          ),
                        ],
                      ),
                    )),
              ]),
      ),
    );
  }
}

class profileitem extends StatelessWidget {
  profileitem({Key? key, required this.title, required this.disc})
      : super(key: key);
  String title, disc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              ": $disc",
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
