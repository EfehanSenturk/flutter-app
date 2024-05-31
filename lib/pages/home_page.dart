// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Efehan Şentürk',
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Projelerim'),
              onTap: () {
                Navigator.pushNamed(context, '/projects');
              },
            ),
            ListTile(
              title: const Text('Yeteneklerim'),
              onTap: () {
                Navigator.pushNamed(context, '/skills');
              },
            ),
            ListTile(
              title: const Text('Sertifikalarım'),
              onTap: () {
                Navigator.pushNamed(context, '/certificate');
              },
            ),
            ListTile(
              title: const Text('İletişim'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 70),                  
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/profile_picture.jpg'),
              ),
              SizedBox(height: 30),
              Text(
                'İsim: Efehan',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Soyisim: Şentürk',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Hakkımda:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height:10),
              Text(
                'Yazılım geliştirme alanında 3 yıllık deneyime sahip bir yazılım mühendisliği öğrencisiyim. Genellikle mobil uygulama geliştirme üzerine çalışıyorum ve React-Native gibi çeşitli teknolojilerle projeler yapıyorum. Ayrıca, problem çözme yeteneğim güçlüdür ve yeni teknolojilere hızlı bir şekilde adapte olabilirim.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
