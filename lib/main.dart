import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:tquestion_tag_app/pages/home_page.dart';
import 'pages/chat_page.dart';

const String apiKey = 'AIzaSyDRmr-qy3lN3RFoSHiLTRi9KQUDIJWkFQY';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Gemini.init(
    apiKey: apiKey,
    enableDebugging: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat AI',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
