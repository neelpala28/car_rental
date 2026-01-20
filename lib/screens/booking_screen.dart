import 'package:car_rental/screens/booking_confirmation_screen.dart';
import 'package:flutter/material.dart';

class BookingFormScreen extends StatelessWidget {
  final Map<String, dynamic> car;

  const BookingFormScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Name')),
            TextField(
              decoration: const InputDecoration(labelText: 'Pickup Location'),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Start Date'),
            ),
            TextField(decoration: const InputDecoration(labelText: 'End Date')),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ConfirmationScreen(car: car),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: const Text('Confirm Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
