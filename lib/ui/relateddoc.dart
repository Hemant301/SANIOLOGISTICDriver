import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saniologisticdriver/api/regisrtApi.dart';
import 'package:saniologisticdriver/shareFunction/consttext.dart';

class RelatedDocument extends StatelessWidget {
  const RelatedDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Documents'),
        centerTitle: true,
        // backgroundColor: Constant.primaryColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color(0xffED17C9),
                Color(0xff9e27b0),
              ])),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Uploaders(
                name: 'Registration Certificate',
              ),
              Uploaders(
                name: 'Insurance',
              ),
              Uploaders(
                name: 'Road Permit',
              ),
              Uploaders(
                name: 'Pollution',
              ),
              Uploaders(
                name: 'Fitness',
              ),
              Uploaders(
                name: 'Road Tax',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Uploaders extends StatefulWidget {
  Uploaders({
    super.key,
    this.name,
  });
  String? name;

  @override
  State<Uploaders> createState() => _UploadersState();
}

class _UploadersState extends State<Uploaders> {
  DateTime selectedDate = DateTime.now();
  String newDate = "";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        newDate = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade100,
            width: 0.2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(05)),
          boxShadow: [
            BoxShadow(
                color: Colors.blueGrey.shade200,
                offset: const Offset(1, -1),
                blurRadius: 5),
            BoxShadow(
                color: Colors.blueGrey.shade200,
                offset: const Offset(-1, -1),
                blurRadius: 2)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: SizedBox(
                  width: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 10,),
                      Text('${widget.name}',
                          textAlign: TextAlign.center,
                          style: Constant.forLabelStyle),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          if (newDate == "") {
                            Fluttertoast.showToast(msg: "Select Date firts");
                            return;
                          }
                          // _pickFileRC();
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              context: (context),
                              builder: (context) => buildSheet(context,
                                  title: widget.name,
                                  date: newDate.substring(0, 10)));
                        },
                        child: Container(
                          // margin: EdgeInsets.only(left: 210),
                          height: 35,
                          width: MediaQuery.of(context).size.width - 259,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff9e27b0),
                                    Color(0xffED17C9)
                                  ]),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Upload",
                                    style: Constant.forButtonLabelStyle,
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Container(
                      //   // margin: EdgeInsets.only(left: 220),
                      //   height: 40,
                      //   width: MediaQuery.of(context).size.width-10,
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius:
                      //       BorderRadius.circular(10)),
                      //   // child:fileNamepan==null?Center(child: Text('--')):Center(child: Text(fileNamepan)),
                      //   child:panToDisplay!=null?SizedBox(
                      //     height: 20,width: 20,
                      //     child:Image.file(panToDisplay)):Container()
                      // ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Expiry date"),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: Text(newDate == ""
                            ? "DD/MM/YY"
                            : newDate.substring(0, 10))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSheet(context, {title, date}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              _pickImage(ImageSource.camera, title: title, date: date);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.camera_alt,
                    size: 40, color: Constant.primaryColor.withOpacity(.9)),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Camera",
                  style: TextStyle(fontSize: 18, color: Constant.primaryColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              _pickImage(ImageSource.gallery, title: title, date: date);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.gradient,
                  size: 40,
                  color: Constant.primaryColor.withOpacity(.9),
                ),
                SizedBox(
                  width: 20,
                ),
                Text("Gallery",
                    style:
                        TextStyle(fontSize: 18, color: Constant.primaryColor)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<Null> _pickImage(source, {title, date}) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    PickedFile? file = pickedImage;

    var imageBytes = file!.readAsBytes();
    print(imageBytes);
    String base64Image = base64Encode(await imageBytes);
    // log(base64Image.toString());

    Map data = await callApi.uploadDocs(
        title: "$title", expiryDate: '$date', docs: base64Image);
    if (data['status'] == true) {
      Fluttertoast.showToast(msg: data['message']);
    } else {
      Fluttertoast.showToast(msg: data['message']);
    }
  }
}
