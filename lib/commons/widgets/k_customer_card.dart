// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// class KCustomerRow extends StatelessWidget {
//   final String name;
//   final String phone;
//   final String price;
//   final String pickupTime;
//   final String imageUrl;
//
//   const KCustomerRow({
//     super.key,
//     required this.name,
//     required this.phone,
//     required this.price,
//     required this.pickupTime,
//     required this.imageUrl,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return DataRow(
//       cells: [
//         DataCell(
//           Row(
//             children: [
//               ClipOval(
//                 child: SizedBox(
//                   width: 40,
//                   height: 40,
//                   child: CachedNetworkImage(
//                     imageUrl: imageUrl,
//                     fit: BoxFit.cover,
//                     placeholder: (context, url) => const Center(
//                       child: CircularProgressIndicator(strokeWidth: 2),
//                     ),
//                     errorWidget: (context, url, error) =>
//                         const Icon(Icons.person, size: 40, color: Colors.grey),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Text(name),
//             ],
//           ),
//         ),
//         DataCell(Text(phone)),
//         DataCell(Text(price)),
//         DataCell(Text(pickupTime)),
//       ],
//     );
//   }
// }
