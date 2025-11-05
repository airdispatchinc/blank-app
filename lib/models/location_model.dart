import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';

class LocationModel {
  final String? id;
  final String name;
  final String address;
  final LatLng coordinates;
  final int waitTime;
  final String crowdLevel;
  final DateTime? lastUpdated;
  final String? category;
  final Map<String, dynamic>? metadata;

  LocationModel({
    this.id,
    required this.name,
    required this.address,
    required this.coordinates,
    required this.waitTime,
    required this.crowdLevel,
    this.lastUpdated,
    this.category,
    this.metadata,
  });

  factory LocationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return LocationModel(
      id: doc.id,
      name: data['name'] ?? '',
      address: data['address'] ?? '',
      coordinates: LatLng(
        data['latitude'] ?? 0.0,
        data['longitude'] ?? 0.0,
      ),
      waitTime: data['waitTime'] ?? 0,
      crowdLevel: data['crowdLevel'] ?? 'low',
      lastUpdated: (data['lastUpdated'] as Timestamp?)?.toDate(),
      category: data['category'],
      metadata: data['metadata'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'latitude': coordinates.latitude,
      'longitude': coordinates.longitude,
      'waitTime': waitTime,
      'crowdLevel': crowdLevel,
      'lastUpdated': FieldValue.serverTimestamp(),
      'category': category,
      'metadata': metadata,
    };
  }

  LocationModel copyWith({
    String? id,
    String? name,
    String? address,
    LatLng? coordinates,
    int? waitTime,
    String? crowdLevel,
    DateTime? lastUpdated,
    String? category,
    Map<String, dynamic>? metadata,
  }) {
    return LocationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      coordinates: coordinates ?? this.coordinates,
      waitTime: waitTime ?? this.waitTime,
      crowdLevel: crowdLevel ?? this.crowdLevel,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      category: category ?? this.category,
      metadata: metadata ?? this.metadata,
    );
  }
}
