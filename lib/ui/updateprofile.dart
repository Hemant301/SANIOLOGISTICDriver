import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saniologisticdriver/api/regisrtApi.dart';
import 'package:saniologisticdriver/shareFunction/testfiledss.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController panCon = TextEditingController();
  TextEditingController licenseCon = TextEditingController();
  TextEditingController aadharCon = TextEditingController();
  TextEditingController permitCon = TextEditingController();
  TextEditingController insuranceCon = TextEditingController();
  TextEditingController rcbookCon = TextEditingController();
  TextEditingController corporateCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Textfiless(
                  title: 'PAN',
                  controller: panCon,
                ),
                Textfiless(
                  title: 'License',
                  controller: licenseCon,
                ),
                Textfiless(
                  title: 'Aadhar Number',
                  controller: aadharCon,
                ),
                Textfiless(
                  title: 'Permit',
                  controller: permitCon,
                ),
                Textfiless(
                  title: 'Insurance',
                  controller: insuranceCon,
                ),
                Textfiless(
                  title: 'RC Book',
                  controller: rcbookCon,
                ),
                Textfiless(
                  title: 'Corporate ID',
                  controller: corporateCon,
                ),
                InkWell(
                  onTap: () async {
                    // Navigator.pushNamed(context, "/bottomNav");

                    RegisterApi api = RegisterApi();
                    try {
                      Map data = await api.updateProfile(
                          pan: panCon.text,
                          aadhar: aadharCon.text,
                          license: licenseCon.text,
                          rc: rcbookCon.text,
                          permit: permitCon.text,
                          insurance: insuranceCon.text,
                          corporate: corporateCon.text);
                      print(data["status"].runtimeType);

                      if (data["status"] == true) {
                        //  userCred.addUserId(data["user"]["_id"]);

                        Future.delayed(const Duration(seconds: 1), () {
                          Navigator.pop(context);
                        });

                        Fluttertoast.showToast(
                            msg: " ${data['Msg']}! ",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        Fluttertoast.showToast(
                            msg: " ${data['Msg']}! ",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    } catch (e) {}
                    // Navigator.pushReplacementNamed(context, '/main');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width - 80,
                      // margin: EdgeInsets.symmetric(horizontal: 20,
                      // vertical: 10),
                      // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xff9e27b0), Color(0xffED17C9)]),
                        // color:Color(0xff9e27b0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            // spreadRadius: 12,
                            offset: const Offset(5, 5),
                            color: const Color(0xff9e27b0).withOpacity(.5),
                          ),
                        ],
                      ),
                      child: const Center(
                          child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
