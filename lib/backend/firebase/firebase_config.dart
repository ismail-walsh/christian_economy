import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD0g1-Om7cbqf7BjMVXC3eGJdl6pf92Sb4",
            authDomain: "christian-economy.firebaseapp.com",
            projectId: "christian-economy",
            storageBucket: "christian-economy.firebasestorage.app",
            messagingSenderId: "55054983923",
            appId: "1:55054983923:web:6a87e00d311ce2ef664d86",
            measurementId: "G-DFJDKKHNTT"));
  } else {
    await Firebase.initializeApp();
  }
}
