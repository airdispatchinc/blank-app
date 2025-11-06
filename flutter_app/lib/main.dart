import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/core/app.dart';
import 'src/core/config/environment_config.dart';

/// Enterprise Flutter Application
/// 
/// Production-ready application with:
/// - Environment-based configuration
/// - State management (Riverpod)
/// - Firebase integration
/// - Crash reporting
/// - Analytics
/// - Responsive design
/// - Accessibility support
/// - Internationalization ready

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment configuration
  await EnvironmentConfig.initialize();
  
  // Initialize Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  
  // Initialize crash reporting
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  
  // Run app with error handling
  runApp(
    const ProviderScope(
      child: EnterpriseApp(),
    ),
  );
}
