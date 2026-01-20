
import 'package:car_rental/screens/car_detail_screen.dart';
import 'package:flutter/material.dart';

Widget sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
    child: Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}

Widget carCard(BuildContext context, Map<String, dynamic> car) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      tileColor: Colors.grey,
      leading: SizedBox(
        width: 60,
        height: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(car['image'], fit: BoxFit.contain),
        ),
      ),
      title: Text(
        car['name'],
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text('${car['type']} • ₹${car['price']}/day'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CarDetailScreen(car: car)),
        );
      },
    ),
  );
}
