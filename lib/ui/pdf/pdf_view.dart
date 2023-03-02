// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// import '../../app/consts/color_pallete.dart';

// class PdfViewFile extends StatefulWidget {
//   final File file;
//   const PdfViewFile({
//     Key? key,
//     required this.file,
//   }) : super(key: key);

//   @override
//   State<PdfViewFile> createState() => _PdfViewFileState();
// }

// class _PdfViewFileState extends State<PdfViewFile> {
//   late PdfViewerController _pdfViewerController;
//   late PdfTextSearchResult _searchResult;

//   @override
//   void initState() {
//     super.initState();
//     _pdfViewerController = PdfViewerController();
//     _searchResult = PdfTextSearchResult();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HomeColor.homeHeaderColor,
//         title: const Text('PDF Viewer'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.search,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               _searchResult = _pdfViewerController.searchText('a');
//               _searchResult.addListener(() {
//                 if (_searchResult.hasResult) {
//                   setState(() {});
//                 }
//               });
//             },
//           ),
//           Visibility(
//             visible: _searchResult.hasResult,
//             child: IconButton(
//               icon: const Icon(
//                 Icons.clear,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 setState(() {
//                   _searchResult.clear();
//                 });
//               },
//             ),
//           ),
//           Visibility(
//             visible: _searchResult.hasResult,
//             child: IconButton(
//               icon: const Icon(
//                 Icons.keyboard_arrow_up,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 _searchResult.previousInstance();
//               },
//             ),
//           ),
//           Visibility(
//             visible: _searchResult.hasResult,
//             child: IconButton(
//               icon: const Icon(
//                 Icons.keyboard_arrow_down,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 _searchResult.nextInstance();
//               },
//             ),
//           ),
//         ],
//       ),
//       body: SfPdfViewer.file(widget.file,
//           canShowPaginationDialog: true,
//           canShowScrollHead: true,
//           canShowScrollStatus: true,
//           controller: _pdfViewerController,
//           currentSearchTextHighlightColor: Colors.yellow.withOpacity(0.6),
//           otherSearchTextHighlightColor: Colors.yellow.withOpacity(0.3)),
//     );
//   }
// }
