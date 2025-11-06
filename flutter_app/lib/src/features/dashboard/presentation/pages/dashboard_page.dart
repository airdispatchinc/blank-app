import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildDashboardCard(
              context,
              icon: Icons.people,
              title: 'Users',
              value: '12,345',
              color: Colors.blue,
            ),
            _buildDashboardCard(
              context,
              icon: Icons.trending_up,
              title: 'Revenue',
              value: '\$1.2M',
              color: Colors.green,
            ),
            _buildDashboardCard(
              context,
              icon: Icons.shopping_cart,
              title: 'Orders',
              value: '8,432',
              color: Colors.orange,
            ),
            _buildDashboardCard(
              context,
              icon: Icons.bar_chart,
              title: 'Growth',
              value: '+24%',
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDashboardCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
