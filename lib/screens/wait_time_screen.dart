import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WaitTimeScreen extends StatefulWidget {
  const WaitTimeScreen({super.key});

  @override
  State<WaitTimeScreen> createState() => _WaitTimeScreenState();
}

class _WaitTimeScreenState extends State<WaitTimeScreen> {
  // Sample data - in real app, this would come from Firebase
  final List<LocationWaitTime> _locations = [
    LocationWaitTime(
      name: 'Popular Cafe',
      address: '123 Main St',
      waitTime: 15,
      crowdLevel: CrowdLevel.moderate,
      distance: 0.5,
    ),
    LocationWaitTime(
      name: 'City Park',
      address: '456 Park Ave',
      waitTime: 5,
      crowdLevel: CrowdLevel.low,
      distance: 1.2,
    ),
    LocationWaitTime(
      name: 'Shopping Mall',
      address: '789 Commerce Blvd',
      waitTime: 30,
      crowdLevel: CrowdLevel.high,
      distance: 2.1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wait Times'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Show filter options
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Refresh data from Firebase
          await Future.delayed(const Duration(seconds: 1));
          setState(() {});
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _locations.length,
          itemBuilder: (context, index) {
            return WaitTimeCard(location: _locations[index]);
          },
        ),
      ),
    );
  }
}

class WaitTimeCard extends StatelessWidget {
  final LocationWaitTime location;

  const WaitTimeCard({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          // Navigate to location details
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          location.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          location.address,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${location.waitTime} min',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: _getWaitTimeColor(location.waitTime),
                            ),
                      ),
                      Text(
                        '${location.distance} km',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildCrowdLevelChip(context, location.crowdLevel),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.directions, size: 18),
                    label: const Text('Directions'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCrowdLevelChip(BuildContext context, CrowdLevel level) {
    Color color;
    IconData icon;
    String label;

    switch (level) {
      case CrowdLevel.low:
        color = Colors.green;
        icon = Icons.sentiment_satisfied;
        label = 'Low';
        break;
      case CrowdLevel.moderate:
        color = Colors.orange;
        icon = Icons.sentiment_neutral;
        label = 'Moderate';
        break;
      case CrowdLevel.high:
        color = Colors.red;
        icon = Icons.sentiment_dissatisfied;
        label = 'High';
        break;
    }

    return Chip(
      avatar: Icon(icon, size: 18, color: color),
      label: Text(label),
      labelStyle: TextStyle(color: color, fontWeight: FontWeight.bold),
      backgroundColor: color.withOpacity(0.1),
      side: BorderSide(color: color),
    );
  }

  Color _getWaitTimeColor(int waitTime) {
    if (waitTime < 10) return Colors.green;
    if (waitTime < 20) return Colors.orange;
    return Colors.red;
  }
}

class LocationWaitTime {
  final String name;
  final String address;
  final int waitTime;
  final CrowdLevel crowdLevel;
  final double distance;

  LocationWaitTime({
    required this.name,
    required this.address,
    required this.waitTime,
    required this.crowdLevel,
    required this.distance,
  });
}

enum CrowdLevel { low, moderate, high }
