import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define theme colors
    final Color primaryColor = Colors.yellow.shade700;
    final Color backgroundColor = Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.yellow),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Summary Cards
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _summaryCard('Total Members', '61', primaryColor),
                  _summaryCard('Total Fees', '₹1,20,000', primaryColor),
                  _summaryCard('Pending Fees', '₹10,000', Colors.redAccent),
                  _summaryCard('Payments Today', '₹5,000', Colors.greenAccent),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Quick Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _actionButton(Icons.person_add, 'Add Member', primaryColor),
                _actionButton(Icons.attach_money, 'Collect Fee', primaryColor),
                _actionButton(Icons.list_alt, 'View Payments', primaryColor),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Transactions',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: List.generate(
                  5,
                  (index) => Card(
                    color: Colors.grey[900],
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      leading: const Icon(Icons.payment, color: Colors.yellow),
                      title: Text(
                        'Member ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '₹${(index + 1) * 1000} collected',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: const Icon(Icons.arrow_forward, color: Colors.yellow),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper for summary cards
  Widget _summaryCard(String title, String value, Color color) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Helper for action buttons
  Widget _actionButton(IconData icon, String label, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color, width: 2),
          ),
          child: Column(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}