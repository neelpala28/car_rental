import 'package:car_rental/car_detail_screen.dart';
import 'package:car_rental/mock_car_data.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sedanCars = cars.where((car) => car['type'] == 'Sedan').toList();
    final suvCars = cars.where((car) => car['type'] == 'SUV').toList();
    final hatchbackCars = cars
        .where((car) => car['type'] == 'Hatchback')
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Available Cars')),
      body: ListView(
        children: [
          sectionTitle('Sedan'),
          ...sedanCars.map((car) => carCard(context, car)),

          sectionTitle('SUV'),
          ...suvCars.map((car) => carCard(context, car)),

          sectionTitle('Hatchback'),
          ...hatchbackCars.map((car) => carCard(context, car)),
        ],
      ),
    );
  }
}

//// ---------------- WIDGETS ----------------

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
