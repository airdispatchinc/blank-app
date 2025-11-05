import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/location_model.dart';

class FirebaseService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<LocationModel> _locations = [];
  bool _isLoading = false;
  String? _error;

  List<LocationModel> get locations => _locations;
  bool get isLoading => _isLoading;
  String? get error => _error;
  User? get currentUser => _auth.currentUser;

  // Fetch locations from Firestore
  Future<void> fetchLocations() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final snapshot = await _firestore.collection('locations').get();
      _locations = snapshot.docs
          .map((doc) => LocationModel.fromFirestore(doc))
          .toList();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add a new location
  Future<void> addLocation(LocationModel location) async {
    try {
      await _firestore.collection('locations').add(location.toMap());
      await fetchLocations();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  // Update wait time for a location
  Future<void> updateWaitTime(String locationId, int waitTime) async {
    try {
      await _firestore.collection('locations').doc(locationId).update({
        'waitTime': waitTime,
        'lastUpdated': FieldValue.serverTimestamp(),
      });
      await fetchLocations();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  // Stream for real-time updates
  Stream<List<LocationModel>> getLocationsStream() {
    return _firestore.collection('locations').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => LocationModel.fromFirestore(doc))
              .toList(),
        );
  }

  // Sign in anonymously
  Future<void> signInAnonymously() async {
    try {
      await _auth.signInAnonymously();
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
