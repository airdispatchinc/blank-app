import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/core/app.dart';

/// Enterprise Flutter Application
/// 
/// Production-ready application with:
/// - State management (Riverpod)
/// - Responsive design
/// - Material 3 design
/// - Clean architecture

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    const ProviderScope(
      child: EnterpriseApp(),
    ),
  );
}
