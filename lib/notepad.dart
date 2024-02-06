// import 'package:flutter/material.dart';
// import 'package:homebase/saveload.dart';
//
// class notepad extends StatefulWidget {
//   const notepad({super.key});
//
//   @override
//   State<notepad> createState() => _notepadState();
// }
//
// class _notepadState extends State<notepad> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//
// Widget notepadApp(TextEditingController controller, String homeId,bool change) {
//   return FutureBuilder<String>(
//     future: saveLoad().readFromHomeNotes(homeId),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return CircularProgressIndicator();
//       } else if (snapshot.hasError) {
//         return Text('Error: ${snapshot.error}');
//       } else {
//         String? loadedText = snapshot.data;
//         controller.text = loadedText!;
//         return SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(height: 20),
//               Text(
//                 'Notepad',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//               SizedBox(height: 20),
//               IconButton(
//                   onPressed: () {
//                     saveLoad().writeToHomeNotes(controller.text, homeId);
//                     if (change == true) {
//                       setState(() {
//                         change = false;
//                       });
//                     }
//                   },
//                   icon: Icon(Icons.save_outlined,
//                       size: 50,
//                       color: change ? Colors.greenAccent : Colors.black)),
//               TextField(
//                 controller: controller,
//                 minLines: 30,
//                 maxLines: 80,
//                 onTap: () {
//                   if (change == false) {
//                     setState(() {
//                       change = true;
//                     });
//                   }
//                 },
//                 // onEditingComplete: () {
//                 //   // Save the text whenever the editing is complete
//                 //   saveLoad().writeToHomeNotes(controller.text, homeId);
//                 // },
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Note',
//                 ),
//               ),
//             ],
//           ),
//         );
//       }
//     },
//   );
// }