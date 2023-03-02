// // ignore_for_file: always_specify_types

// import 'package:intl/intl.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// import '../../datetime.dart';

// class PrescriptionPrintComponents {
//   static pw.Container buildHeader({
//     required pw.ImageProvider logo,
//     // PrescriptionDetailDTO? consultationResult,
//     required List<String> speciality,
//     // required PrecResult? prescription
//     required String displayName,
//     required String medicalRegNo,
//     required String consultMode,
//   }) =>
//       pw.Container(
//         height: 100,
//         padding: const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         color: PdfColor.fromHex('#FFFFFF'),
//         child: pw.Row(children: [
//           pw.Expanded(
//             child: pw.Container(
//               child: pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Text(
//                     displayName,
//                     style: pw.TextStyle(
//                         fontSize: 20,
//                         fontWeight: pw.FontWeight.bold,
//                         color: PdfColor.fromHex('#0039A9')),
//                   ),
//                   pw.Text(
//                     speciality.map((String e) => e.toString()).join(', '),
//                     style: pw.TextStyle(
//                         fontSize: 10,
//                         fontWeight: pw.FontWeight.bold,
//                         color: PdfColor.fromHex('#000000')),
//                   ),
//                   // if (prescription
//                   //         .displaySpecializations.isNotEmpty ??
//                   //     false)
//                   // pw.Text(
//                   //   consultationResult
//                   //           ?.result?.doctor?.displaySpecializations.first ??
//                   //       '',
//                   //   style: pw.TextStyle(
//                   //       fontSize: 10,
//                   //       fontWeight: pw.FontWeight.bold,
//                   //       color: PdfColor.fromHex('#000000')),
//                   // ),
//                   // if (prescription.doctor?.registrationDetails.isNotEmpty ??
//                   // false)
//                   pw.Text(
//                     'Registration No. $medicalRegNo',
//                     style: pw.TextStyle(
//                         fontSize: 10,
//                         fontWeight: pw.FontWeight.bold,
//                         color: PdfColor.fromHex('#000000')),
//                   ),
//                   pw.Text(
//                     '${consultMode == 'online' ? 'Online' : 'Offline'} Consultation',
//                     style: pw.TextStyle(
//                         fontSize: 14,
//                         fontWeight: pw.FontWeight.bold,
//                         color: PdfColor.fromHex('#0039A9')),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           pw.Image(
//             logo,
//           ),
//         ]),
//       );

//   static pw.Container buildPatientInfo({
//     String? patientName,
//     String? hight,
//     required String? age,
//     required String weight,
//     required String gender,
//     required String consultationId,
//     // required PrecResult? prescription,
//     // required PrecResult prescriptionDataAll,
//     required DateTime dateTime,
//     required String opdId,
//   }) {
//     return pw.Container(
//         padding: const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         color: PdfColor.fromHex('#FFFFFF'),
//         height: 150,
//         width: double.infinity,
//         child: pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text(
//                 'Patient Details',
//                 style: pw.TextStyle(
//                   fontSize: 16,
//                   fontWeight: pw.FontWeight.bold,
//                   color: PdfColor.fromHex('#0039A9'),
//                 ),
//               ),
//               pw.Container(
//                   height: 2,
//                   color: PdfColor.fromHex('#0039A9'),
//                   width: 100,
//                   margin: const pw.EdgeInsets.only(bottom: 10, top: 5)),
//               pw.Expanded(
//                   child: pw.Row(children: [
//                 pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text(
//                       'Name: $patientName',
//                       style: pw.TextStyle(
//                           fontSize: 10,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColor.fromHex('#000000')),
//                     ),
//                     // Patient age
//                     pw.Text(
//                       'Age: $age',
//                       //  ${DateTimeUtils.calculateAge(prescription?.result ?? DateTime.now()).toString()}',
//                       style: pw.TextStyle(
//                           fontSize: 10,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColor.fromHex('#000000')),
//                     ),
//                     // patient gender
//                     pw.Text(
//                       'Gender: $gender',
//                       style: pw.TextStyle(
//                           fontSize: 10,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColor.fromHex('#000000')),
//                     ),
//                     // Patient height
//                     pw.Text(
//                       'Height: $hight',
//                       style: pw.TextStyle(
//                           fontSize: 10,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColor.fromHex('#000000')),
//                     ),
//                     // // Patient weight
//                     pw.Text(
//                       'Weight: $weight',
//                       style: pw.TextStyle(
//                           fontSize: 10,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColor.fromHex('#000000')),
//                     ),
//                   ],
//                 ),
//                 pw.Spacer(),
//                 pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.end,
//                   children: [
//                     // if (prescriptionDataAllisNotEmpty)
//                     pw.Text(
//                       //
//                       'Appointment Date :   ${DateTimeUtils.formatDate(dateTime)}',
//                       style: pw.TextStyle(
//                         fontSize: 12,
//                         fontWeight: pw.FontWeight.bold,
//                         color: PdfColor.fromHex('#000000'),
//                       ),
//                     ),
//                     // if (prescriptionDataAll.isNotEmpty)
//                     pw.Text(
//                       //DateFormat('yyyy-MM-dd – kk:mm').format(now)
//                       //prescriptionDataAll.result.last.createdAt!
//                       'Appointment Time : ${DateFormat('kk:mm').format(dateTime)}',
//                       style: pw.TextStyle(
//                         fontSize: 12,
//                         fontWeight: pw.FontWeight.bold,
//                         color: PdfColor.fromHex('#000000'),
//                       ),
//                     ),
//                     pw.Text(
//                       'Consultation ID: $consultationId',
//                       style: pw.TextStyle(
//                         fontSize: 12,
//                         fontWeight: pw.FontWeight.bold,
//                         color: PdfColor.fromHex('#000000'),
//                       ),
//                     ),
//                     pw.Text(
//                       'OPD No: $opdId',
//                       style: pw.TextStyle(
//                         fontSize: 12,
//                         fontWeight: pw.FontWeight.bold,
//                         color: PdfColor.fromHex('#000000'),
//                       ),
//                     ),
//                   ],
//                 ),
//               ])),
//               pw.Divider(
//                 thickness: 0.25,
//                 color: PdfColor.fromHex('#0039A9'),
//               ),
//             ]));
//   }

//   static pw.Container buildSymptomsAndOtherDetails(
//       {required String title,
//       required String details,
//       double? underlineWidth,
//       double? height}) {
//     return pw.Container(
//         padding: const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         color: PdfColor.fromHex('#FFFFFF'),
//         height: height ?? 40,
//         width: double.infinity,
//         child: pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text(
//                 title,
//                 style: pw.TextStyle(
//                   fontSize: 10,
//                   fontWeight: pw.FontWeight.bold,
//                   color: PdfColor.fromHex('#0039A9'),
//                 ),
//               ),
//               pw.Container(
//                   height: 1,
//                   color: PdfColor.fromHex('#0039A9'),
//                   width: underlineWidth ?? 100,
//                   margin: const pw.EdgeInsets.only(bottom: 2, top: 2)),
//               pw.Expanded(child: pw.Text(details)),
//             ]));
//   }

//   static pw.Container buildBody({
//     // required PrecResult prescriptionData
//     required List<dynamic> medicineList,
//   }) {
//     return pw.Container(
//       height: medicineList.length * 60 + 60.0,
//       padding: const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       color: PdfColor.fromHex('#FFFFFF'),
//       width: double.infinity,
//       child: pw.Column(children: [
//         pw.Expanded(
//             child: pw.Table(
//                 border: pw.TableBorder.all(color: PdfColor.fromHex('#B1CCFF')),
//                 children: [
//               pw.TableRow(children: [
//                 pw.Container(
//                   padding: const pw.EdgeInsets.symmetric(
//                       vertical: 10, horizontal: 5),
//                   color: PdfColor.fromHex('#B1CCFF'),
//                   child: pw.Text('RX',
//                       style: pw.TextStyle(
//                           fontSize: 8,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColor.fromHex('#000000'))),
//                 ),
//                 pw.Container(
//                   padding: const pw.EdgeInsets.symmetric(
//                       vertical: 10, horizontal: 10),
//                   color: PdfColor.fromHex('#B1CCFF'),
//                   child: pw.Text('Medicine Name',
//                       style: pw.TextStyle(
//                           fontSize: 8,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColor.fromHex('#000000'))),
//                 ),
//                 pw.Container(
//                   padding: const pw.EdgeInsets.symmetric(vertical: 10),
//                   color: PdfColor.fromHex('#B1CCFF'),
//                   child: pw.Text('Frequency',
//                       style: pw.TextStyle(
//                           fontSize: 8,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColor.fromHex('#000000'))),
//                 ),
//                 pw.Container(
//                   padding: const pw.EdgeInsets.symmetric(vertical: 10),
//                   color: PdfColor.fromHex('#B1CCFF'),
//                   child: pw.Text('Duration',
//                       style: pw.TextStyle(
//                           fontSize: 8,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColor.fromHex('#000000'))),
//                 ),
//                 pw.Container(
//                   padding: const pw.EdgeInsets.symmetric(vertical: 10),
//                   color: PdfColor.fromHex('#B1CCFF'),
//                   child: pw.Text('Before / After Food',
//                       style: pw.TextStyle(
//                           fontSize: 8,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColor.fromHex('#000000'))),
//                 ),
//                 pw.Container(
//                   padding: const pw.EdgeInsets.symmetric(vertical: 10),
//                   color: PdfColor.fromHex('#B1CCFF'),
//                   child: pw.Text('Doses',
//                       style: pw.TextStyle(
//                           fontSize: 8,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColor.fromHex('#000000'))),
//                 ),
//                 pw.Container(
//                   padding: const pw.EdgeInsets.symmetric(
//                       vertical: 10, horizontal: 5),
//                   color: PdfColor.fromHex('#B1CCFF'),
//                   child: pw.Text('Notes',
//                       style: pw.TextStyle(
//                           fontSize: 8,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColor.fromHex('#000000'))),
//                 ),
//               ]),
//               if (medicineList.isNotEmpty)
//                 ...medicineList
//                     .map((medicine) => pw.TableRow(
//                           verticalAlignment:
//                               pw.TableCellVerticalAlignment.middle,
//                           children: [
//                             pw.Container(
//                               padding:
//                                   const pw.EdgeInsets.symmetric(vertical: 5),
//                               child: pw.Row(
//                                   crossAxisAlignment:
//                                       pw.CrossAxisAlignment.center,
//                                   mainAxisAlignment:
//                                       pw.MainAxisAlignment.center,
//                                   children: [
//                                     pw.Text(
//                                       (medicineList.indexOf(medicine) + 1)
//                                           .toString(),
//                                       style: pw.TextStyle(
//                                         fontSize: 8,
//                                         fontWeight: pw.FontWeight.normal,
//                                         color: PdfColor.fromHex('#000000'),
//                                       ),
//                                     ),
//                                   ]),
//                             ),
//                             pw.Container(
//                               padding: const pw.EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 10),
//                               child: pw.Text(
//                                 medicine.medicineName!,
//                                 style: pw.TextStyle(
//                                   fontSize: 8,
//                                   fontWeight: pw.FontWeight.normal,
//                                   color: PdfColor.fromHex('#000000'),
//                                 ),
//                               ),
//                             ),
//                             pw.Container(
//                               padding:
//                                   const pw.EdgeInsets.symmetric(vertical: 5),
//                               child: pw.Row(
//                                   crossAxisAlignment:
//                                       pw.CrossAxisAlignment.center,
//                                   mainAxisAlignment:
//                                       pw.MainAxisAlignment.center,
//                                   children: [
//                                     pw.Text(
//                                       medicine.frequency ?? '',
//                                       style: pw.TextStyle(
//                                         fontSize: 8,
//                                         fontWeight: pw.FontWeight.normal,
//                                         color: PdfColor.fromHex('#000000'),
//                                       ),
//                                     ),
//                                   ]),
//                             ),
//                             pw.Container(
//                               padding:
//                                   const pw.EdgeInsets.symmetric(vertical: 5),
//                               child: pw.Row(
//                                   crossAxisAlignment:
//                                       pw.CrossAxisAlignment.center,
//                                   mainAxisAlignment:
//                                       pw.MainAxisAlignment.center,
//                                   children: [
//                                     pw.Text(
//                                       '${medicine.medicineDuration?.value.toString() ?? ''} ${medicine.medicineDuration?.type.toString() ?? ''}',
//                                       style: pw.TextStyle(
//                                         fontSize: 8,
//                                         fontWeight: pw.FontWeight.normal,
//                                         color: PdfColor.fromHex('#000000'),
//                                       ),
//                                     ),
//                                   ]),
//                             ),
//                             pw.Container(
//                               padding:
//                                   const pw.EdgeInsets.symmetric(vertical: 5),
//                               child: pw.Row(
//                                   crossAxisAlignment:
//                                       pw.CrossAxisAlignment.center,
//                                   mainAxisAlignment:
//                                       pw.MainAxisAlignment.center,
//                                   children: [
//                                     pw.Text(
//                                       medicine.whenToTake ?? '',
//                                       style: pw.TextStyle(
//                                         fontSize: 8,
//                                         fontWeight: pw.FontWeight.normal,
//                                         color: PdfColor.fromHex('#000000'),
//                                       ),
//                                     ),
//                                   ]),
//                             ),
//                             pw.Container(
//                               padding:
//                                   const pw.EdgeInsets.symmetric(vertical: 5),
//                               child: pw.Row(
//                                 crossAxisAlignment:
//                                     pw.CrossAxisAlignment.center,
//                                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                                 children: [
//                                   pw.Text(
//                                     medicine.dosePerDay
//                                         .map((int e) => e.toString())
//                                         .join(' - '),
//                                     style: pw.TextStyle(
//                                       fontSize: 8,
//                                       fontWeight: pw.FontWeight.normal,
//                                       color: PdfColor.fromHex('#000000'),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             pw.Container(
//                               padding:
//                                   const pw.EdgeInsets.symmetric(vertical: 5),
//                               child: pw.Row(
//                                   crossAxisAlignment:
//                                       pw.CrossAxisAlignment.center,
//                                   mainAxisAlignment:
//                                       pw.MainAxisAlignment.center,
//                                   children: [
//                                     pw.Text(
//                                       medicine.instruction ?? '',
//                                       style: pw.TextStyle(
//                                         fontSize: 8,
//                                         fontWeight: pw.FontWeight.normal,
//                                         color: PdfColor.fromHex('#000000'),
//                                       ),
//                                     ),
//                                   ]),
//                             ),
//                           ],
//                         ))
//                     .toList(),
//               // buildRowsForInventoryItems(prescriptionData: prescriptionData),
//             ])),
//       ]),
//     );
//   }

//   static pw.Container buildFooter(
//       // PrecResult? prescriptionData,
//       // PrescriptionDetailDTO? consultationResult,
//       // AllPrescriptionResultDTO? prescriptionDataAll,
//       DateTime createdAt,
//       int count,
//       String type) {
//     return pw.Container(
//       padding: const pw.EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//       color: PdfColor.fromHex('#FFFFFF'),
//       width: double.infinity,
//       height: 90,
//       child: pw.Row(
//           crossAxisAlignment: pw.CrossAxisAlignment.center,
//           mainAxisAlignment: pw.MainAxisAlignment.center,
//           children: <pw.Widget>[
//             pw.Column(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: [
//                 pw.Text(
//                   'Date : ${DateTimeUtils.formatDate(createdAt)}',
//                   style: pw.TextStyle(
//                     fontSize: 12,
//                     fontWeight: pw.FontWeight.bold,
//                     color: PdfColor.fromHex('#000000'),
//                   ),
//                 ),
//                 // pw.Text(
//                 //   'Place: New Delhi',
//                 //   style: pw.TextStyle(
//                 //     fontSize: 12,
//                 //     fontWeight: pw.FontWeight.bold,
//                 //     color: PdfColor.fromHex('#000000'),
//                 //   ),
//                 // ),
//                 // if (prescriptionDataAll.result.isNotEmpty ?? false)
//                 pw.Text(
//                   'Follow Up Date : ${DateTimeUtils.addDurationInDateTime(createdAt, count: count, type: type)}',
//                   style: pw.TextStyle(
//                     fontSize: 12,
//                     fontWeight: pw.FontWeight.bold,
//                     color: PdfColor.fromHex('#0039A9'),
//                   ),
//                 ),
//               ],
//             ),
//             pw.Spacer(),
//             pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.center,
//                 mainAxisAlignment: pw.MainAxisAlignment.center,
//                 children: [
//                   pw.Text(
//                     'This is computer generated document and does not require Signature.',
//                     style: pw.TextStyle(
//                       fontSize: 8,
//                       fontWeight: pw.FontWeight.normal,
//                       color: PdfColor.fromHex('#000000'),
//                     ),
//                   ),
//                 ]),
//           ]),
//     );
//   }
// }
