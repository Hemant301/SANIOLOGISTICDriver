// // ignore_for_file: depend_on_referenced_packages

// import 'package:intl/intl.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// class MedicalCertificateComponents {
//   static pw.Container buildHeader({
   
//     // required List<String> speciality,
//   }) =>
//       pw.Container(
//         height: 100,
//         padding: const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         color: PdfColor.fromHex('#FFFFFF'),
//         child: pw.Row(children: <pw.Widget>[
//           pw.Expanded(
//             child: pw.Container(
//                 child: pw.Column(
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: <pw.Text>[
//                   pw.Text(
//                     displayName,
//                     style: pw.TextStyle(
//                         fontSize: 20,
//                         fontWeight: pw.FontWeight.bold,
//                         color: PdfColor.fromHex('#0039A9')),
//                   ),
//                   // pw.Text(
//                   //   speciality.map((String e) => e.toString()).join(', '),
//                   //   style: pw.TextStyle(
//                   //       fontSize: 10,
//                   //       fontWeight: pw.FontWeight.bold,
//                   //       color: PdfColor.fromHex('#000000')),
//                   // ),
//                   pw.Text(
//                     displaySpecializations.join(''),
//                     style: pw.TextStyle(
//                         fontSize: 10,
//                         fontWeight: pw.FontWeight.bold,
//                         color: PdfColor.fromHex('#000000')),
//                   ),
//                   pw.Text(
//                     'Registration No.  $medicalRegNo',
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
//                 ])),
//           ),
//           pw.Image(
//             logo,
//           ),
//         ]),
//       );

//   static pw.Container buildBody({
//     required String invoiceNo,
//     required String pName,
//     required String mobileNo,
//     required String amount,
//     required DateTime date,
//     required String displayName,
//     required String medicalRegNo,
//   }) =>
//       pw.Container(
//         padding: const pw.EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: <pw.Widget>[
//             pw.Divider(thickness: 3, color: PdfColor.fromHex('#0039A9')),
//             pw.SizedBox(height: 5),
//             pw.Row(
//               mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//               children: <pw.Widget>[
//                 pw.Text(
//                   'Invoice No:$invoiceNo',
//                   style: pw.TextStyle(
//                       fontSize: 14,
//                       fontWeight: pw.FontWeight.bold,
//                       color: PdfColor.fromHex('#000000')),
//                 ),
//                 pw.SizedBox(width: 10),
//                 pw.Text(
//                   'Invoice Date:    ${DateFormat('kk:mm').format(date)}',
//                   style: pw.TextStyle(
//                       fontSize: 14,
//                       fontWeight: pw.FontWeight.bold,
//                       color: PdfColor.fromHex('#000000')),
//                 ),
//               ],
//             ),
//             pw.SizedBox(height: 5),
//             pw.Divider(thickness: 3, color: PdfColor.fromHex('#0039A9')),
//             pw.Row(
//               children: <pw.Text>[
//                 pw.Text(
//                   'Patient Name : ',
//                   style: pw.TextStyle(
//                       fontSize: 14,
//                       // fontWeight: pw.FontWeight.bold,
//                       color: PdfColor.fromHex('#000000')),
//                 ),
//                 pw.Text(
//                   pName,
//                   style: pw.TextStyle(
//                       fontSize: 14,
//                       fontWeight: pw.FontWeight.bold,
//                       color: PdfColor.fromHex('#000000')),
//                 ),
//               ],
//             ),
//             pw.SizedBox(height: 5),
//             pw.Row(
//               children: <pw.Text>[
//                 pw.Text(
//                   'Mobile Number : ',
//                   style: pw.TextStyle(
//                       fontSize: 14,
//                       // fontWeight: pw.FontWeight.bold,
//                       color: PdfColor.fromHex('#000000')),
//                 ),
//                 pw.Text(
//                   mobileNo,
//                   style: pw.TextStyle(
//                       fontSize: 14,
//                       fontWeight: pw.FontWeight.bold,
//                       color: PdfColor.fromHex('#000000')),
//                 ),
//               ],
//             ),
//             pw.SizedBox(height: 5),
//             pw.Row(
//               children: <pw.Text>[
//                 pw.Text(
//                   'Amount : ',
//                   style: pw.TextStyle(
//                       fontSize: 14,
//                       // fontWeight: pw.FontWeight.bold,
//                       color: PdfColor.fromHex('#000000')),
//                 ),
//                 pw.Text(
//                   amount,
//                   style: pw.TextStyle(
//                       fontSize: 14,
//                       fontWeight: pw.FontWeight.bold,
//                       color: PdfColor.fromHex('#000000')),
//                 ),
//               ],
//             ),
//             pw.SizedBox(height: 5),
//             // pw.Row(
//             //   children: <pw.Text>[
//             //     pw.Text(
//             //       'Amount(in words) : ',
//             //       style: pw.TextStyle(
//             //           fontSize: 14,
//             //           // fontWeight: pw.FontWeight.bold,
//             //           color: PdfColor.fromHex('#000000')),
//             //     ),
//             //     pw.Text(
//             //       NumberToWordsEnglish.convert(int.parse(amount)).toString(),
//             //       style: pw.TextStyle(
//             //           fontSize: 14,
//             //           fontWeight: pw.FontWeight.bold,
//             //           color: PdfColor.fromHex('#000000')),
//             //     ),
//             //   ],
//             // ),
//             // pw.SizedBox(height: 5),
//             pw.Divider(thickness: 3, color: PdfColor.fromHex('#0039A9')),
//             pw.SizedBox(height: 5),
//             pw.Text(
//               'Received the above amount towards consultancy provided by $displayName (Medical Reg : $medicalRegNo)',
//               style: pw.TextStyle(
//                   fontSize: 14,
//                   fontWeight: pw.FontWeight.bold,
//                   color: PdfColor.fromHex('#000000')),
//             ),
//             // pw.Text(
//             //   'Received the amount towards consultancy provided by Dr. Amitabh Monga\n(Mwdical Reg : 1234) on',
//             //   style: pw.TextStyle(
//             //       fontSize: 14,
//             //       fontWeight: pw.FontWeight.bold,
//             //       color: PdfColor.fromHex('#000000')),
//             // ),
//           ],
//         ),
//       );

//   static pw.Container buildFooter() {
//     return pw.Container(
//         padding: const pw.EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         color: PdfColor.fromHex('#FFFFFF'),
//         width: double.infinity,
//         // height: 90,
//         child: pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             mainAxisAlignment: pw.MainAxisAlignment.end,
//             children: <pw.Widget>[
//               //         pw.Column(
//               //             crossAxisAlignment: pw.CrossAxisAlignment.start,
//               //             children: [
//               //               pw.Text(
//               //                 'Consultation ID: ${consultation?.consultationId ?? ''}',
//               //                 style: pw.TextStyle(
//               //                   fontSize: 12,
//               //                   fontWeight: pw.FontWeight.bold,
//               //                   color: PdfColor.fromHex('#000000'),
//               //                 ),
//               //               ),
//               //               pw.Text(
//               //                 'Appointment Date : ${DateTimeUtils.formatDate(DateTime.now())}',
//               //                 style: pw.TextStyle(
//               //                   fontSize: 12,
//               //                   fontWeight: pw.FontWeight.bold,
//               //                   color: PdfColor.fromHex('#000000'),
//               //                 ),
//               //               ),
//               //               pw.Text(
//               //                 'Appointment Time :  ${DateTimeUtils.formatTime(TimeOfDay.now())}',
//               //                 style: pw.TextStyle(
//               //                   fontSize: 12,
//               //                   fontWeight: pw.FontWeight.bold,
//               //                   color: PdfColor.fromHex('#000000'),
//               //                 ),
//               //               ),
//               //             ]),
//               pw.SizedBox(height: 20),
//               pw.Container(
//                   width: double.infinity,
//                   alignment: pw.Alignment.center,
//                   child: pw.Text(
//                     'This is computer generated document and does not require Signature.',
//                     style: pw.TextStyle(
//                       fontSize: 10,
//                       fontWeight: pw.FontWeight.normal,
//                       color: PdfColor.fromHex('#000000'),
//                     ),
//                   ))
//             ]));
//   }
// }
