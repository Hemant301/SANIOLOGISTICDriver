import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:saniologisticdriver/api/regisrtApi.dart';

import '../shareFunction/testfiledss.dart';

class AddbankDetails extends StatefulWidget {
  const AddbankDetails({super.key});

  @override
  State<AddbankDetails> createState() => _AddbankDetailsState();
}

class _AddbankDetailsState extends State<AddbankDetails> {
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  TextEditingController acountTypeController = TextEditingController();
  TextEditingController accountHolderController = TextEditingController();
  TextEditingController broanchNameController = TextEditingController();
  TextEditingController branchAddressController = TextEditingController();
  TextEditingController accounNumberController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text('ADD BANK Details'),
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Textfiless(
                controller: bankNameController,
                icon: Icons.person,
                title: "Bank Name",
              ),
              const SizedBox(
                height: 10,
              ),
              Textfiless(
                controller: accounNumberController,
                icon: Icons.person,
                title: "Bank Account Number",
              ),
              const SizedBox(
                height: 10,
              ),
              Textfiless(
                controller: ifscController,
                icon: Icons.person,
                title: "IFSC",
              ),
              const SizedBox(
                height: 10,
              ),
              Textfiless(
                controller: acountTypeController,
                icon: Icons.person,
                title: "Account Type",
              ),
              const SizedBox(
                height: 10,
              ),
              Textfiless(
                controller: accountHolderController,
                icon: Icons.person,
                title: "Account Holder",
              ),
              const SizedBox(
                height: 10,
              ),
              Textfiless(
                controller: broanchNameController,
                icon: Icons.person,
                title: "Branch Name",
              ),
              const SizedBox(
                height: 10,
              ),
              Textfiless(
                controller: branchAddressController,
                icon: Icons.person,
                title: "Branch Address",
              ),
              const SizedBox(
                height: 20,
              ),
              loading == true
                  ? const Center(child: CircularProgressIndicator())
                  : InkWell(
                      onTap: () async {
                        // Navigator.pushNamed(context, "/bottomNav");

                        RegisterApi api = RegisterApi();
                        try {
                          Map data = await api.addBankdetail(
                              bank_name: bankNameController.text,
                              ifsc_code: ifscController.text,
                              account_type: acountTypeController.text,
                              account_number: accounNumberController.text,
                              account_holder: accountHolderController.text,
                              branch_address: branchAddressController.text,
                              branch_name: broanchNameController.text);
                          print(data["status"].runtimeType);

                          if (data["status"] == true) {
                            //  userCred.addUserId(data["user"]["_id"]);
                            setState(() {
                              loading = false;
                            });
                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.pop(context);
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
                    ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
