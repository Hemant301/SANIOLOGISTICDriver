// import 'dart:io';

// import 'package:pdf/widgets.dart' as pw;

// import '../../../features/my_records/domain/all_prescription_result_model.dart';
// import '../pdfapi.dart';
// import 'components_view.dart';

// class GeneratePrescription {
//   static Future<File> create({
//     required pw.ImageProvider logo,
//     required String patientName,
//     required String weight,
//     required String hight,
//     required String age,
//     required String gender,
//     required bool isOnline,
//     required String opdId,
//     required List<String> speciality,
//     required DateTime createdAt,
//     required int count,
//     required String type,
//     required String displayName,
//     required String medicalRegNo,
//     required String consultMode,
//     required String consultationId,
//     required List<MedicineList> medicineList,
//     required List<DiagnosticTestList> diagnosticTestList,
//     required List<Symptom> symptoms,
//     required List<Allergy> allergies,
//     required String diagnosis,
//     required String adviseInstruction,
//     required DateTime dateTime,
//   }) async {
//     pw.Document doc = pw.Document();
//     doc.addPage(
//       pw.MultiPage(
//         build: (pw.Context context) => <pw.Widget>[
//           pw.Header(
//             child: PrescriptionPrintComponents.buildHeader(
//               logo: logo,
//               speciality: speciality,
//               displayName: displayName,
//               medicalRegNo: medicalRegNo,
//               consultMode: consultMode,
//             ),
//           ),
//           if (true)
//             PrescriptionPrintComponents.buildPatientInfo(
//               dateTime: dateTime,
//               consultationId: consultationId,
//               gender: gender,
//               hight: hight,
//               weight: weight,
//               age: age,
//               patientName: patientName,
//               opdId: opdId,
//             ),
//           // if (prescriptionData)
//           if (symptoms.isNotEmpty)
//             PrescriptionPrintComponents.buildSymptomsAndOtherDetails(
//                 title: 'Symptoms',
//                 underlineWidth: 55,
//                 details: symptoms
//                     .map((Symptom e) => e.symptomName)
//                     .toList()
//                     .join(', ')),

//           if (symptoms != null)
//             PrescriptionPrintComponents.buildSymptomsAndOtherDetails(
//                 title: 'Diagnosis', underlineWidth: 55, details: diagnosis),

//           PrescriptionPrintComponents.buildBody(medicineList: medicineList),
//           if (diagnosticTestList.isNotEmpty)
//             PrescriptionPrintComponents.buildSymptomsAndOtherDetails(
//                 title: 'Diagnosis Test',
//                 underlineWidth: 55,
//                 height: diagnosticTestList.length * 40.0,
//                 details: diagnosticTestList
//                     .map((DiagnosticTestList e) =>
//                         '${e.testName} - ${e.note ?? ''}')
//                     .toList()
//                     .join('\n')),

//           if (adviseInstruction == null)
//             PrescriptionPrintComponents.buildSymptomsAndOtherDetails(
//                 underlineWidth: 75,
//                 title: 'General Advise',
//                 details: adviseInstruction),
//           if (adviseInstruction.isNotEmpty)
//             PrescriptionPrintComponents.buildSymptomsAndOtherDetails(
//                 title: 'Allergies',
//                 underlineWidth: 45,
//                 details: allergies
//                     .map((Allergy e) => e.allergieName)
//                     .toList()
//                     .join(', ')),
//           PrescriptionPrintComponents.buildFooter(
//             createdAt,
//             count,
//             type,
//           ),
//         ],
//       ),
//     );

//     File pdf = await PdfApi.getSaveDoc(
//       fileName: 'Prescription ${DateTime.now()}',
//       pdf: doc,
//     );

//     return pdf;
//   }
// }
