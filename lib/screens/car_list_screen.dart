import 'package:car_rental/data/mock_car_data.dart';
import 'package:car_rental/widgets/car_card.dart';
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
