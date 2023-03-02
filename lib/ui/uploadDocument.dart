import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../shareFunction/consttext.dart';

class DocumentUpload extends StatefulWidget {
  const DocumentUpload({Key? key}) : super(key: key);

  @override
  _DocumentUploadState createState() => _DocumentUploadState();
}

class _DocumentUploadState extends State<DocumentUpload> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   key: _scaffoldKey,
    //   drawer: DocumentUpload(),
    //   appBar: AppBar(
    //     // backgroundColor: Constant.primaryColor,
    //       automaticallyImplyLeading: false,
    //       // leading:Transform.scale(scale: 2.5 ,child:
    //       // IconButton(icon: ImageIcon(AssetImage('assets/images/menu.png'),color: Colors.white, size:10,) ,
    //       //     onPressed: (){
    //       //       // _scaffoldKey.currentState.openDrawer();
    //       //     })),
    //       leading: InkWell(
    //         onTap: (){
    //           _scaffoldKey.currentState.openDrawer();
    //         },
    //         child: IconButton(
    //             icon:Icon(Icons.menu,color:Colors.white ,)
    //         ),
    //       ),
    //       flexibleSpace: Container(
    //         decoration: BoxDecoration(
    //             gradient: LinearGradient(
    //                 begin: Alignment.topLeft,
    //                 end: Alignment.bottomRight,
    //                 colors: <Color>[
    //                   Color(0xffED17C9),
    //                   Color(0xff9e27b0),
    //                 ])
    //         ),
    //       ),
    //       title: Text('Document'),
    //       centerTitle: true
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Documents'),
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
      body:
          // _load?Constant.load:
          ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Column(
                  children: [
                    //     Container(
                    //         height: MediaQuery.of(context).size.height / 7.5,
                    //          width: MediaQuery.of(context).size.width-10,
                    //       decoration: BoxDecoration(color: Colors.white,
                    //     border: Border.all(
                    //     color: Colors.grey,
                    //     width: 0.2,
                    //   ),
                    //   borderRadius: BorderRadius.all(Radius.circular(05)),
                    //   boxShadow: [
                    //     BoxShadow(
                    //         color: Colors.blueGrey.shade200,
                    //         offset: Offset(1, -2),
                    //         blurRadius: 5),
                    //     BoxShadow(
                    //         color: Colors.blueGrey.shade200,
                    //         offset: Offset(-1, 2),
                    //         blurRadius: 5)
                    //   ],
                    //
                    // ),
                    //       child:Column(
                    //         children: [
                    //           SizedBox(height: 10,),
                    //           InkWell(
                    //             onTap: (){
                    //               _pickFile();
                    //               // _openFileExplorer();
                    //               // Navigator.push(context,MaterialPageRoute(builder: (context)=>UploadDocument()));
                    //             },
                    //             child: Container(
                    //               // margin: EdgeInsets.only(left: 220),
                    //               height: 40,
                    //               width: MediaQuery.of(context).size.width -
                    //                   200,
                    //               decoration: BoxDecoration(
                    //                   color: Constant.primaryColor.withOpacity(.5),
                    //                   borderRadius:
                    //                   BorderRadius.circular(10)),
                    //               child: Center(
                    //                 child: Padding(
                    //                   padding: const EdgeInsets.all(2.0),
                    //                   child: Text(
                    //                       "Upload RC Document",
                    //                       style: Constant.forButtonLabelStyle,textAlign: TextAlign.center
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //           Container(
                    //             // margin: EdgeInsets.only(left: 220),
                    //             height: 40,
                    //             width: MediaQuery.of(context).size.width-10,
                    //             decoration: BoxDecoration(
                    //                 color: Colors.white,
                    //                 borderRadius:
                    //                 BorderRadius.circular(10)),
                    //             child:fileName==null?Center(child: Text('--')):Center(child: Text(fileName)),
                    //           ),
                    //
                    //         ],
                    //       )
                    //     ),
                    Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade100,
                          width: 0.2,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(05)),
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: SizedBox(
                                width: 140,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(height: 10,),
                                    Text('Bank Passbook',
                                        style: Constant.forLabelStyle),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // _pickFileRC();
                                        showModalBottomSheet(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            20))),
                                            context: (context),
                                            builder: (context) => buildSheet());
                                      },
                                      child: Container(
                                        // margin: EdgeInsets.only(left: 210),
                                        height: 35,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                259,
                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xff9e27b0),
                                                  Color(0xffED17C9)
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(
                                                Icons.upload_file,
                                                color: Colors.white,
                                              ),
                                              Text("Choose File",
                                                  style: Constant
                                                      .forButtonLabelStyle,
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
                                // fileNamepan==null?Center(child: Text('--')):Center(child: Text(fileNamepan)),
                                _imageGst != null
                                    ? SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Image.file(
                                            File(_imageGst!.path.toString())))
                                    : Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 30),
                                        child: const Center(
                                            child: Text("No File Chosen")),
                                      ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //     height: MediaQuery.of(context).size.height / 7.5,
                    //     width: MediaQuery.of(context).size.width-10,
                    //     decoration: BoxDecoration(color: Colors.white,
                    //       border: Border.all(
                    //         color: Colors.grey,
                    //         width: 0.2,
                    //       ),
                    //       borderRadius: BorderRadius.all(Radius.circular(05)),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             color: Colors.blueGrey.shade200,
                    //             offset: Offset(1, -2),
                    //             blurRadius: 5),
                    //         BoxShadow(
                    //             color: Colors.blueGrey.shade200,
                    //             offset: Offset(-1, 2),
                    //             blurRadius: 5)
                    //       ],
                    //
                    //     ),
                    //     child:Column(
                    //       children: [
                    //         SizedBox(height: 10,),
                    //         InkWell(
                    //           onTap: (){
                    //             _pickFile1();
                    //           },
                    //           child: Container(
                    //             // margin: EdgeInsets.only(left: 220),
                    //             height: 40,
                    //             width: MediaQuery.of(context).size.width -
                    //                 200,
                    //             decoration: BoxDecoration(
                    //                 color: Constant.primaryColor.withOpacity(.5),
                    //                 borderRadius:
                    //                 BorderRadius.circular(10)),
                    //             child: Center(
                    //               child: Text(
                    //                   "Upload Fitnes Certificate",
                    //                   style: Constant.forButtonLabelStyle,textAlign: TextAlign.center
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         Container(
                    //           // margin: EdgeInsets.only(left: 220),
                    //           height: 45,
                    //           width: MediaQuery.of(context).size.width-10,
                    //           decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius:
                    //               BorderRadius.circular(10)),
                    //           child:fileName1==null?Center(child: Text('--')):Center(child: Text(fileName1)),
                    //         ),
                    //       ],
                    //     )
                    // ),
                    Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade100,
                          width: 0.2,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(05)),
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: SizedBox(
                                width: 140,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(height: 10,),
                                    Text('Aadhar Card',
                                        style: Constant.forLabelStyle),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // _pickFileFitness();

                                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>UploadDocument()));
                                      },
                                      child: Container(
                                        // margin: EdgeInsets.only(left: 210),
                                        height: 35,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                259,
                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xff9e27b0),
                                                  Color(0xffED17C9)
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(
                                                Icons.upload_file,
                                                color: Colors.white,
                                              ),
                                              Text("Choose File",
                                                  style: Constant
                                                      .forButtonLabelStyle,
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
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     // fileNamepan==null?Center(child: Text('--')):Center(child: Text(fileNamepan)),
                            //     fitnessToDisplay!=null?SizedBox(
                            //         height: 80,width: 80,
                            //         child:Image.file(fitnessToDisplay)):Container(padding:EdgeInsets.symmetric(vertical: 30),
                            //       child: Center(child: Text("No File Chosen")),),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //     height: MediaQuery.of(context).size.height / 7.5,
                    //     width: MediaQuery.of(context).size.width-10,
                    //     decoration: BoxDecoration(color: Colors.white,
                    //       border: Border.all(
                    //         color: Colors.grey,
                    //         width: 0.2,
                    //       ),
                    //       borderRadius: BorderRadius.all(Radius.circular(05)),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             color: Colors.blueGrey.shade200,
                    //             offset: Offset(1, -2),
                    //             blurRadius: 5),
                    //         BoxShadow(
                    //             color: Colors.blueGrey.shade200,
                    //             offset: Offset(-1, 2),
                    //             blurRadius: 5)
                    //       ],
                    //
                    //     ),
                    //     child:Column(
                    //       children: [
                    //         SizedBox(height: 10,),
                    //         InkWell(
                    //           onTap: (){
                    //             _pickFile2();
                    //           },
                    //           child: Container(
                    //             // margin: EdgeInsets.only(left: 220),
                    //             height: 40,
                    //             width: MediaQuery.of(context).size.width -
                    //                 200,
                    //             decoration: BoxDecoration(
                    //                 color: Constant.primaryColor.withOpacity(.5),
                    //                 borderRadius:
                    //                 BorderRadius.circular(10)),
                    //             child: Center(
                    //               child: Text(
                    //                   "Upload Insurance Certificate",
                    //                   style: Constant.forButtonLabelStyle,textAlign: TextAlign.center
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         Container(
                    //           // margin: EdgeInsets.only(left: 220),
                    //           height: 45,
                    //           width: MediaQuery.of(context).size.width-10,
                    //           decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius:
                    //               BorderRadius.circular(10)),
                    //           child:fileName2==null?Center(child: Text('--')):Center(child: Text(fileName2)),
                    //         ),
                    //       ],
                    //     )
                    // ),
                    Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade100,
                          width: 0.2,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(05)),
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: SizedBox(
                                width: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(height: 10,),
                                    Text('PAN Card',
                                        style: Constant.forLabelStyle),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // _pickFileInsurance();
                                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>UploadDocument()));
                                      },
                                      child: Container(
                                        // margin: EdgeInsets.only(left: 210),
                                        height: 35,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                259,
                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xff9e27b0),
                                                  Color(0xffED17C9)
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(
                                                Icons.upload_file,
                                                color: Colors.white,
                                              ),
                                              Text("Choose File",
                                                  style: Constant
                                                      .forButtonLabelStyle,
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
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     // fileNamepan==null?Center(child: Text('--')):Center(child: Text(fileNamepan)),
                            //     insuranceToDisplay!=null?SizedBox(
                            //         height: 80,width: 80,
                            //         child:Image.file(insuranceToDisplay)):Container(padding:EdgeInsets.symmetric(vertical: 30),
                            //       child: Center(child: Text("No File Chosen")),),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // Container(
                    //     height: MediaQuery.of(context).size.height / 7.5,
                    //     width: MediaQuery.of(context).size.width-10,
                    //     decoration: BoxDecoration(color: Colors.white,
                    //       border: Border.all(
                    //         color: Colors.grey,
                    //         width: 0.2,
                    //       ),
                    //       borderRadius: BorderRadius.all(Radius.circular(05)),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             color: Colors.blueGrey.shade200,
                    //             offset: Offset(1, -2),
                    //             blurRadius: 5),
                    //         BoxShadow(
                    //             color: Colors.blueGrey.shade200,
                    //             offset: Offset(-1, 2),
                    //             blurRadius: 5)
                    //       ],
                    //
                    //     ),
                    //     child:Column(
                    //       children: [
                    //         SizedBox(height: 10,),
                    //         InkWell(
                    //           onTap: (){
                    //             _pickFile3();
                    //           },
                    //           child: Container(
                    //             // margin: EdgeInsets.only(left: 220),
                    //             height: 40,
                    //             width: MediaQuery.of(context).size.width -
                    //                 200,
                    //             decoration: BoxDecoration(
                    //                 color: Constant.primaryColor.withOpacity(.5),
                    //                 borderRadius:
                    //                 BorderRadius.circular(10)),
                    //             child: Center(
                    //               child: Text(
                    //                   "Upload Permit Certificate",
                    //                   style: Constant.forButtonLabelStyle,textAlign: TextAlign.center,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         Container(
                    //           // margin: EdgeInsets.only(left: 220),
                    //           height: 45,
                    //           width: MediaQuery.of(context).size.width-10,
                    //           decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius:
                    //               BorderRadius.circular(10)),
                    //           child:fileName3==null?Center(child: Text('--')):Center(child: Text(fileName3)),
                    //         ),
                    //       ],
                    //     )
                    // ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height / 7.5,
                    //   width: MediaQuery.of(context).size.width-30,
                    //   decoration: BoxDecoration(color: Colors.white,
                    //     border: Border.all(
                    //       color: Colors.grey[50],
                    //       width: 0.2,
                    //     ),
                    //     borderRadius: BorderRadius.all(Radius.circular(05)),
                    //     boxShadow: [
                    //       BoxShadow(
                    //           color: Colors.blueGrey.shade200,
                    //           offset: Offset(1, -1),
                    //           blurRadius: 5),
                    //       BoxShadow(
                    //           color: Colors.blueGrey.shade200,
                    //           offset: Offset(-1, -1),
                    //           blurRadius: 2)
                    //     ],
                    //
                    //   ),
                    //   child:
                    //   Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    //           child: Container(
                    //             width: 150,
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 // SizedBox(height: 10,),
                    //                 Text('Permit Certificate',style:Constant.forLabelStyle),
                    //                 SizedBox(height: 5,),
                    //                 InkWell(
                    //                   onTap: (){
                    //                     // _pickFilePermit();
                    //                     // Navigator.push(context,MaterialPageRoute(builder: (context)=>UploadDocument()));
                    //                   },
                    //                   child: Container(
                    //                     // margin: EdgeInsets.only(left: 210),
                    //                     height: 35,
                    //                     width: MediaQuery.of(context).size.width -
                    //                         259,
                    //                     decoration: BoxDecoration(
                    //                         color: Constant.primaryColor,
                    //                         borderRadius:
                    //                         BorderRadius.circular(5)),
                    //                     child: Padding(
                    //                       padding: const EdgeInsets.all(4.0),
                    //                       child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                         children: [
                    //                           Icon(Icons.upload_file,color: Colors.white,),
                    //                           Text(
                    //                               "Choose File",
                    //                               style: Constant.forButtonLabelStyle,textAlign: TextAlign.center
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //
                    //                 // Container(
                    //                 //   // margin: EdgeInsets.only(left: 220),
                    //                 //   height: 40,
                    //                 //   width: MediaQuery.of(context).size.width-10,
                    //                 //   decoration: BoxDecoration(
                    //                 //       color: Colors.white,
                    //                 //       borderRadius:
                    //                 //       BorderRadius.circular(10)),
                    //                 //   // child:fileNamepan==null?Center(child: Text('--')):Center(child: Text(fileNamepan)),
                    //                 //   child:panToDisplay!=null?SizedBox(
                    //                 //     height: 20,width: 20,
                    //                 //     child:Image.file(panToDisplay)):Container()
                    //                 // ),
                    //
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(width: 30,),
                    //         // Column(
                    //         //   mainAxisAlignment: MainAxisAlignment.start,
                    //         //   children: [
                    //         //     // fileNamepan==null?Center(child: Text('--')):Center(child: Text(fileNamepan)),
                    //         //     permitToDisplay!=null?SizedBox(
                    //         //         height: 80,width: 80,
                    //         //         child:Image.file(permitToDisplay)):Container(padding:EdgeInsets.symmetric(vertical: 30),
                    //         //       child: Center(child: Text("No File Chosen")),),
                    //         //   ],
                    //         // )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 5,),
                    // // Container(
                    // //     height: MediaQuery.of(context).size.height / 7.5,
                    // //     width: MediaQuery.of(context).size.width-10,
                    // //     decoration: BoxDecoration(color: Colors.white,
                    // //       border: Border.all(
                    // //         color: Colors.grey,
                    // //         width: 0.2,
                    // //       ),
                    // //       borderRadius: BorderRadius.all(Radius.circular(05)),
                    // //       boxShadow: [
                    // //         BoxShadow(
                    // //             color: Colors.blueGrey.shade200,
                    // //             offset: Offset(1, -2),
                    // //             blurRadius: 5),
                    // //         BoxShadow(
                    // //             color: Colors.blueGrey.shade200,
                    // //             offset: Offset(-1, 2),
                    // //             blurRadius: 5)
                    // //       ],
                    // //
                    // //     ),
                    // //     child:Column(
                    // //       children: [
                    // //         SizedBox(height: 10,),
                    // //         InkWell(
                    // //           onTap: (){
                    // //             _pickFile4();
                    // //           },
                    // //           child: Container(
                    // //             // margin: EdgeInsets.only(left: 220),
                    // //             height: 40,
                    // //             width: MediaQuery.of(context).size.width -
                    // //                 200,
                    // //             decoration: BoxDecoration(
                    // //                 color: Constant.primaryColor.withOpacity(.5),
                    // //                 borderRadius:
                    // //                 BorderRadius.circular(10)),
                    // //             child: Center(
                    // //               child: Text(
                    // //                 "Upload Road Tax Certificate",
                    // //                 style: Constant.forButtonLabelStyle,textAlign: TextAlign.center,
                    // //               ),
                    // //             ),
                    // //           ),
                    // //         ),
                    // //         Container(
                    // //           // margin: EdgeInsets.only(left: 220),
                    // //           height: 45,
                    // //           width: MediaQuery.of(context).size.width-10,
                    // //           decoration: BoxDecoration(
                    // //               color: Colors.white,
                    // //               borderRadius:
                    // //               BorderRadius.circular(10)),
                    // //           child:fileName4==null?Center(child: Text('--')):Center(child: Text(fileName4)),
                    // //         ),
                    // //       ],
                    // //     )
                    // // ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height / 7.5,
                    //   width: MediaQuery.of(context).size.width-30,
                    //   decoration: BoxDecoration(color: Colors.white,
                    //     border: Border.all(
                    //       color: Colors.grey[50],
                    //       width: 0.2,
                    //     ),
                    //     borderRadius: BorderRadius.all(Radius.circular(05)),
                    //     boxShadow: [
                    //       BoxShadow(
                    //           color: Colors.blueGrey.shade200,
                    //           offset: Offset(1, -1),
                    //           blurRadius: 5),
                    //       BoxShadow(
                    //           color: Colors.blueGrey.shade200,
                    //           offset: Offset(-1, -1),
                    //           blurRadius: 2)
                    //     ],
                    //
                    //   ),
                    //   child:
                    //   Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    //           child: Container(
                    //             width: 150,
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 // SizedBox(height: 10,),
                    //                 Text('Road Tax Certificate',style:Constant.forLabelStyle),
                    //                 SizedBox(height: 5,),
                    //                 InkWell(
                    //                   onTap: (){
                    //                     // _pickFileTax();
                    //                     // Navigator.push(context,MaterialPageRoute(builder: (context)=>UploadDocument()));
                    //                   },
                    //                   child: Container(
                    //                     // margin: EdgeInsets.only(left: 210),
                    //                     height: 35,
                    //                     width: MediaQuery.of(context).size.width -
                    //                         259,
                    //                     decoration: BoxDecoration(
                    //                         color: Constant.primaryColor,
                    //                         borderRadius:
                    //                         BorderRadius.circular(5)),
                    //                     child: Padding(
                    //                       padding: const EdgeInsets.all(4.0),
                    //                       child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                         children: [
                    //                           Icon(Icons.upload_file,color: Colors.white,),
                    //                           Text(
                    //                               "Choose File",
                    //                               style: Constant.forButtonLabelStyle,textAlign: TextAlign.center
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //
                    //                 // Container(
                    //                 //   // margin: EdgeInsets.only(left: 220),
                    //                 //   height: 40,
                    //                 //   width: MediaQuery.of(context).size.width-10,
                    //                 //   decoration: BoxDecoration(
                    //                 //       color: Colors.white,
                    //                 //       borderRadius:
                    //                 //       BorderRadius.circular(10)),
                    //                 //   // child:fileNamepan==null?Center(child: Text('--')):Center(child: Text(fileNamepan)),
                    //                 //   child:panToDisplay!=null?SizedBox(
                    //                 //     height: 20,width: 20,
                    //                 //     child:Image.file(panToDisplay)):Container()
                    //                 // ),
                    //
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(width: 30,),
                    //         // Column(
                    //         //   mainAxisAlignment: MainAxisAlignment.start,
                    //         //   children: [
                    //         //     // fileNamepan==null?Center(child: Text('--')):Center(child: Text(fileNamepan)),
                    //         //     taxToDisplay!=null?SizedBox(
                    //         //         height: 80,width: 80,
                    //         //         child:Image.file(taxToDisplay)):Container(padding:EdgeInsets.symmetric(vertical: 30),
                    //         //       child: Center(child: Text("No File Chosen")),),
                    //         //   ],
                    //         // )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 5,),
                    // // Container(
                    // //     height: MediaQuery.of(context).size.height / 7.5,
                    // //     width: MediaQuery.of(context).size.width-10,
                    // //     decoration: BoxDecoration(color: Colors.white,
                    // //       border: Border.all(
                    // //         color: Colors.grey,
                    // //         width: 0.2,
                    // //       ),
                    // //       borderRadius: BorderRadius.all(Radius.circular(05)),
                    // //       boxShadow: [
                    // //         BoxShadow(
                    // //             color: Colors.blueGrey.shade200,
                    // //             offset: Offset(1, -2),
                    // //             blurRadius: 5),
                    // //         BoxShadow(
                    // //             color: Colors.blueGrey.shade200,
                    // //             offset: Offset(-1, 2),
                    // //             blurRadius: 5)
                    // //       ],
                    // //
                    // //     ),
                    // //     child:Column(
                    // //       children: [
                    // //         SizedBox(height: 10,),
                    // //         InkWell(
                    // //           onTap: (){
                    // //             _pickFile5();
                    // //           },
                    // //           child: Container(
                    // //             // margin: EdgeInsets.only(left: 220),
                    // //             height: 40,
                    // //             width: MediaQuery.of(context).size.width -
                    // //                 200,
                    // //             decoration: BoxDecoration(
                    // //                 color: Constant.primaryColor.withOpacity(.5),
                    // //                 borderRadius:
                    // //                 BorderRadius.circular(10)),
                    // //             child: Center(
                    // //               child: Text(
                    // //                 "Upload Pollution Certificate",
                    // //                 style: Constant.forButtonLabelStyle,textAlign: TextAlign.center,
                    // //               ),
                    // //             ),
                    // //           ),
                    // //         ),
                    // //         Container(
                    // //           // margin: EdgeInsets.only(left: 220),
                    // //           height: 40,
                    // //           width: MediaQuery.of(context).size.width-10,
                    // //           decoration: BoxDecoration(
                    // //               color: Colors.white,
                    // //               borderRadius:
                    // //               BorderRadius.circular(10)),
                    // //           child:fileName5==null?Center(child: Text('--')):Center(child: Text(fileName5)),
                    // //         ),
                    // //       ],
                    // //     )
                    // // ),
                    // Container(
                    //   height: MediaQuery.of(context).size.height / 7.5,
                    //   width: MediaQuery.of(context).size.width-30,
                    //   decoration: BoxDecoration(color: Colors.white,
                    //     border: Border.all(
                    //       color: Colors.grey[50],
                    //       width: 0.2,
                    //     ),
                    //     borderRadius: BorderRadius.all(Radius.circular(05)),
                    //     boxShadow: [
                    //       BoxShadow(
                    //           color: Colors.blueGrey.shade200,
                    //           offset: Offset(1, -1),
                    //           blurRadius: 5),
                    //       BoxShadow(
                    //           color: Colors.blueGrey.shade200,
                    //           offset: Offset(-1, -1),
                    //           blurRadius: 5)
                    //     ],
                    //
                    //   ),
                    //   child:
                    //   Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    //           child: Container(
                    //             width: 150,
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 // SizedBox(height: 10,),
                    //                 Text('Pollution Certificate',style:Constant.forLabelStyle),
                    //                 SizedBox(height: 5,),
                    //                 InkWell(
                    //                   onTap: (){
                    //                     // _pickFilePollution();
                    //                     // Navigator.push(context,MaterialPageRoute(builder: (context)=>UploadDocument()));
                    //                   },
                    //                   child: Container(
                    //                     // margin: EdgeInsets.only(left: 210),
                    //                     height: 35,
                    //                     width: MediaQuery.of(context).size.width -
                    //                         259,
                    //                     decoration: BoxDecoration(
                    //                         color: Constant.primaryColor,
                    //                         borderRadius:
                    //                         BorderRadius.circular(5)),
                    //                     child: Padding(
                    //                       padding: const EdgeInsets.all(4.0),
                    //                       child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                         children: [
                    //                           Icon(Icons.upload_file,color: Colors.white,),
                    //                           Text(
                    //                               "Choose File",
                    //                               style: Constant.forButtonLabelStyle,textAlign: TextAlign.center
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //
                    //                 // Container(
                    //                 //   // margin: EdgeInsets.only(left: 220),
                    //                 //   height: 40,
                    //                 //   width: MediaQuery.of(context).size.width-10,
                    //                 //   decoration: BoxDecoration(
                    //                 //       color: Colors.white,
                    //                 //       borderRadius:
                    //                 //       BorderRadius.circular(10)),
                    //                 //   // child:fileNamepan==null?Center(child: Text('--')):Center(child: Text(fileNamepan)),
                    //                 //   child:panToDisplay!=null?SizedBox(
                    //                 //     height: 20,width: 20,
                    //                 //     child:Image.file(panToDisplay)):Container()
                    //                 // ),
                    //
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(width: 30,),
                    //         // Column(
                    //         //   mainAxisAlignment: MainAxisAlignment.start,
                    //         //   children: [
                    //         //     // fileNamepan==null?Center(child: Text('--')):Center(child: Text(fileNamepan)),
                    //         //     pollutionToDisplay!=null?SizedBox(
                    //         //         height: 80,width: 80,
                    //         //         child:Image.file(pollutionToDisplay)):Container(padding:EdgeInsets.symmetric(vertical: 30),
                    //         //       child: Center(child: Text("No File Chosen")),),
                    //         //   ],
                    //         // )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 7.5,
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade100,
                          width: 0.2,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(05)),
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: SizedBox(
                                width: 140,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SizedBox(height: 10,),
                                    Text('Other',
                                        style: Constant.forLabelStyle),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // _pickFileFitness();

                                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>UploadDocument()));
                                      },
                                      child: Container(
                                        // margin: EdgeInsets.only(left: 210),
                                        height: 35,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                259,
                                        decoration: BoxDecoration(
                                            gradient: const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Color(0xff9e27b0),
                                                  Color(0xffED17C9)
                                                ]),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(
                                                Icons.upload_file,
                                                color: Colors.white,
                                              ),
                                              Text("Choose File",
                                                  style: Constant
                                                      .forButtonLabelStyle,
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
                            // Column(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     // fileNamepan==null?Center(child: Text('--')):Center(child: Text(fileNamepan)),
                            //     fitnessToDisplay!=null?SizedBox(
                            //         height: 80,width: 80,
                            //         child:Image.file(fitnessToDisplay)):Container(padding:EdgeInsets.symmetric(vertical: 30),
                            //       child: Center(child: Text("No File Chosen")),),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    // const SizedBox(
                    //   height: 250,
                    // ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen2()));
                      },
                      child: Container(
                        height: 40,
                        // width: MediaQuery.of(context).size.width-80,
                        // margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height-200),
                        // vertical: 10),
                        width: double.infinity,
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
                          'Upload Document',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSheet() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      decoration: const BoxDecoration(
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
              getImage(ImageSource.camera);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.camera_alt,
                    size: 40, color: Constant.primaryColor.withOpacity(.9)),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Camera",
                  style: TextStyle(fontSize: 18, color: Constant.primaryColor),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              getImage(ImageSource.gallery);
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
                const SizedBox(
                  width: 20,
                ),
                const Text("Gallery",
                    style:
                        TextStyle(fontSize: 18, color: Constant.primaryColor)),
              ],
            ),
          )
        ],
      ),
    );
  }

  File? _imageGst;
  String? base64FileForImageGst, imageNameGst;
  final picker = ImagePicker();

  Future getImage(source) async {
    final pickedFile = await picker.getImage(source: source);
    final file = pickedFile;
    imageNameGst = file!.path.split('/').last;
    setState(() {
      if (pickedFile != null) {
        _imageGst = File(pickedFile.path);
        setState(() {
          base64FileForImageGst = base64Encode(_imageGst!.readAsBytesSync());
          // imageName=pickedFile.toString();
          print('imageName');
          print(imageNameGst);
          print('_image');
          print(_imageGst);
          print(_imageGst);
        });
      } else {
        print('No image selected.');
      }
    });
  }

  File? _imageAadhar;
  String? base64FileForImageAadhar, imageName;
  final picker1 = ImagePicker();

  Future getImageAadhar(source) async {
    final pickedFile = await picker1.getImage(source: source);
    final file = pickedFile;
    imageNameGst = file!.path.split('/').last;
    setState(() {
      if (pickedFile != null) {
        _imageAadhar = File(pickedFile.path);
        setState(() {
          base64FileForImageAadhar =
              base64Encode(_imageAadhar!.readAsBytesSync());
          // imageName=pickedFile.toString();
          print('imageName');
          print(imageNameGst);
          print('_image');
          print(_imageGst);
          print(_imageGst);
        });
      } else {
        print('No image selected.');
      }
    });
  }

  // void _openFileExplorer() async {
  //   setState(() => isLoadingPath = true);
  //   try {
  //     if (isMultiPick) {
  //       path = null;
  //       paths = await FilePicker.getMultiFilePath(type: fileType != null? fileType: FileType.any, allowedExtensions: extensions);
  //     }
  //     else {
  //       path = await FilePicker.getFilePath(type: fileType != null? fileType: FileType.any, allowedExtensions: extensions);
  //       paths = null;
  //     }
  //   }
  //   on PlatformException catch (e) {
  //     print("Unsupported operation" + e.toString());
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     isLoadingPath = false;
  //     fileName = path != null ? path.split('/').last : paths != null
  //         ? paths.keys.toString() : '...';
  //   });
  // }
  // void _openFileExplorer1() async {
  //   setState(() => isLoadingPath1 = true);
  //   try {
  //     if (isMultiPick) {
  //       path = null;
  //       paths = await FilePicker.getMultiFilePath(type: fileType != null? fileType: FileType.any, allowedExtensions: extensions);
  //     }
  //     else {
  //       path = await FilePicker.getFilePath(type: fileType != null? fileType: FileType.any, allowedExtensions: extensions);
  //       paths = null;
  //     }
  //   }
  //   on PlatformException catch (e) {
  //     print("Unsupported operation" + e.toString());
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     isLoadingPath1 = false;
  //     fileName1 = path != null ? path.split('/').last : paths != null
  //         ? paths.keys.toString() : '...';
  //   });
  // }
  // void _openFileExplorer2() async {
  //   setState(() => isLoadingPath2 = true);
  //   try {
  //     if (isMultiPick) {
  //       path = null;
  //       paths = await FilePicker.getMultiFilePath(type: fileType != null? fileType: FileType.any, allowedExtensions: extensions);
  //     }
  //     else {
  //       path = await FilePicker.getFilePath(type: fileType != null? fileType: FileType.any, allowedExtensions: extensions);
  //       paths = null;
  //     }
  //   }
  //   on PlatformException catch (e) {
  //     print("Unsupported operation" + e.toString());
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     isLoadingPath2 = false;
  //     fileName2= path != null ? path.split('/').last : paths != null
  //         ? paths.keys.toString() : '...';
  //   });
  // }
  // void _openFileExplorer3() async {
  //   setState(() => isLoadingPath3 = true);
  //   try {
  //     if (isMultiPick) {
  //       path = null;
  //       paths = await FilePicker.getMultiFilePath(type: fileType != null? fileType: FileType.any, allowedExtensions: extensions);
  //     }
  //     else {
  //       path = await FilePicker.getFilePath(type: fileType != null? fileType: FileType.any, allowedExtensions: extensions);
  //       paths = null;
  //     }
  //   }
  //   on PlatformException catch (e) {
  //     print("Unsupported operation" + e.toString());
  //   }
  //   if (!mounted) return;
  //   setState(() {
  //     isLoadingPath3 = false;
  //     fileName3 = path != null ? path.split('/').last : paths != null
  //         ? paths.keys.toString() : '...';
  //   });
  // }
//   String fileName,base64FileForRC;
//   File _fileForRC;
//   var sizeValue,extensionValue;
//   void _pickFileRC() async {
//     File RCFile;
//     // opens storage to pick files and the picked file or files
//     // are assigned into result and if no file is chosen result is null.
//     // you can also toggle "allowMultiple" true or false depending on your need
//     final result = await FilePicker.platform.pickFiles(type: FileType.custom,
//       allowedExtensions: ['jpg', 'png', 'jpeg'],);
//
//     // if no file is picked
//     if (result == null) return;
//
//     // we get the file from result object
//
//     final file = result.files.first;
//     if (file != null) {
//       RCFile = File(file.path);
//       rcToDisplay=File(file.path.toString());
//     }
//     // _openFile(file);
//     print('FileName');
//     print(file.name.toString());
//     print(file.size.toString());
//     print(file.extension.toString());
//     print('Path\n\n');
//     print(file.path.toString());
//
//     setState(() {
//       fileName=file.name.toString();
//       extensionValue=file.extension;
//       sizeValue=file.size;
//       _fileForRC = RCFile;
//       base64FileForRC = base64Encode(_fileForRC.readAsBytesSync());
//     });
//     print(extensionValue.toString()+sizeValue.toString()+fileName.toString());
//     // fileDetails(file);
//
//   }
//   String fileNameFitness;
//   String base64FileForFitness;
//   File _fileForFitness;
//   var sizeValue1,extensionValue1;
//   void _pickFileFitness() async {
//     File fitnessFile;
//     // opens storage to pick files and the picked file or files
//     // are assigned into result and if no file is chosen result is null.
//     // you can also toggle "allowMultiple" true or false depending on your need
//     final result = await FilePicker.platform.pickFiles(type: FileType.custom,
//       allowedExtensions: ['jpg', 'png', 'jpeg'],);
//
//     // if no file is picked
//     if (result == null) return;
//
//     // we get the file from result object
//     final file = result.files.first;
//     if (file != null) {
//       fitnessFile = File(file.path);
//       fitnessToDisplay=File(file.path.toString());
//     }
//     // _openFile(file);
//     print(file.name.toString());
//     print(file.size.toString());
//     print(file.extension.toString());
//     setState(() {
//       fileNameFitness=file.name.toString();
//       extensionValue1=file.extension;
//       sizeValue1=file.size;
//       _fileForFitness = fitnessFile;
//       base64FileForFitness = base64Encode(_fileForFitness.readAsBytesSync());
//     });
//     print(extensionValue1.toString()+sizeValue1.toString()+fileNameFitness.toString());
//     // fileDetails(file);
//
//   }
//   String fileNameInsurance;
//   String base64FileForInsurance;
//   File _fileForInsurance;
//   var sizeValue2,extensionValue2;
//   void _pickFileInsurance() async {
//     File insuranceFile;
//     // opens storage to pick files and the picked file or files
//     // are assigned into result and if no file is chosen result is null.
//     // you can also toggle "allowMultiple" true or false depending on your need
//     final result = await FilePicker.platform.pickFiles(type: FileType.custom,
//       allowedExtensions: ['jpg', 'png', 'jpeg'],);
//
//     // if no file is picked
//     if (result == null) return;
//
//     // we get the file from result object
//     final file = result.files.first;
//     if (file != null) {
//       insuranceFile = File(file.path);
//       insuranceToDisplay=File(file.path.toString());
//     }
//     // _openFile(file);
//     print(file.name.toString());
//     print(file.size.toString());
//     print(file.extension.toString());
//     setState(() {
//       fileNameInsurance=file.name.toString();
//       extensionValue2=file.extension;
//       sizeValue2=file.size;
//       _fileForInsurance = insuranceFile;
//       base64FileForInsurance = base64Encode(_fileForInsurance.readAsBytesSync());
//     });
//     print(extensionValue2.toString()+sizeValue2.toString()+fileNameInsurance.toString());
//     // fileDetails(file);
//
//   }
//   String fileNamePermit;
//   String base64FileForPermit;
//   File _fileForPermit;
//   var sizeValue3,extensionValue3;
//   void _pickFilePermit() async {
//     File permitFile;
//     // opens storage to pick files and the picked file or files
//     // are assigned into result and if no file is chosen result is null.
//     // you can also toggle "allowMultiple" true or false depending on your need
//     final result = await FilePicker.platform.pickFiles(type: FileType.custom,
//       allowedExtensions: ['jpg', 'png', 'jpeg'],);
//
//     // if no file is picked
//     if (result == null) return;
//
//     // we get the file from result object
//     final file = result.files.first;
//     if (file != null) {
//       permitFile = File(file.path);
//       permitToDisplay=File(file.path.toString());
//     }
//     // _openFile(file);
//     print(file.name.toString());
//     print(file.size.toString());
//     print(file.extension.toString());
//     setState(() {
//       fileNamePermit=file.name.toString();
//       extensionValue3=file.extension;
//       sizeValue3=file.size;
//       _fileForPermit = permitFile;
//       base64FileForPermit = base64Encode(_fileForPermit.readAsBytesSync());
//     });
//     print(extensionValue3.toString()+sizeValue3.toString()+fileNamePermit.toString());
//     // fileDetails(file);
//
//   }
//   String fileNameTax;
//   String base64FileForTax;
//   File _fileForTax;
//   var sizeValue4,extensionValue4;
//   void _pickFileTax() async {
//     File taxFile;
//     // opens storage to pick files and the picked file or files
//     // are assigned into result and if no file is chosen result is null.
//     // you can also toggle "allowMultiple" true or false depending on your need
//     final result = await FilePicker.platform.pickFiles(type: FileType.custom,
//       allowedExtensions: ['jpg', 'png', 'jpeg'],);
//
//     // if no file is picked
//     if (result == null) return;
//
//     // we get the file from result object
//     final file = result.files.first;
//     if (file != null) {
//       taxFile = File(file.path);
//       taxToDisplay=File(file.path.toString());
//     }
//     // _openFile(file);
//     print(file.name.toString());
//     print(file.size.toString());
//     print(file.extension.toString());
//     setState(() {
//       fileNameTax=file.name.toString();
//       extensionValue4=file.extension;
//       sizeValue4=file.size;
//       _fileForTax = taxFile;
//       base64FileForTax = base64Encode(_fileForTax.readAsBytesSync());
//     });
//     print(extensionValue4.toString()+sizeValue4.toString()+fileNameTax.toString());
//     // fileDetails(file);
//
//   }
//   String fileNamePollution;
//   String base64FileForPollution;
//   File _fileForPollution;
//   var sizeValue5,extensionValue5;
//   void _pickFilePollution() async {
//     File pollutionFile;
//     // opens storage to pick files and the picked file or files
//     // are assigned into result and if no file is chosen result is null.
//     // you can also toggle "allowMultiple" true or false depending on your need
//     final result = await FilePicker.platform.pickFiles(type: FileType.custom,
//       allowedExtensions: ['jpg', 'png', 'jpeg'],);
//
//     // if no file is picked
//     if (result == null) return;
//
//     // we get the file from result object
//     final file = result.files.first;
//     if (file != null) {
//       pollutionFile = File(file.path);
//       pollutionToDisplay=File(file.path.toString());
//     }
//     // _openFile(file);
//     print(file.name.toString());
//     print(file.size.toString());
//     print(file.extension.toString());
//     setState(() {
//       fileNamePollution=file.name.toString();
//       extensionValue5=file.extension;
//       sizeValue5=file.size;
//       _fileForPollution = pollutionFile;
//       base64FileForPollution = base64Encode(_fileForPollution.readAsBytesSync());
//     });
//     print(extensionValue5.toString()+sizeValue5.toString()+fileNamePollution.toString());
//     // fileDetails(file);
//
//   }
// }
//   }
}
