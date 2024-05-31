import 'package:firsttry/pages/certificate.dart';
import 'package:firsttry/pages/contact.dart';

import 'package:firsttry/pages/home_page.dart';
import 'package:firsttry/pages/projects.dart';
import 'package:firsttry/pages/skills.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Efehan Şentürk',
      ),
      routes: {
        '/skills': (context) => SkillsPage(
              title: 'Skills',
            ),
        '/projects': (context) => ProjectsPage(
              title: 'Projects',
            ),
        '/contact': (context) => ContactPage(
              title: 'Contact',
            ),
        '/certificate': (context) => CertificatePage(
              title: 'Certificates',
            ),
      },
    );
  }
}
