import 'package:firsttry/util/add-certificate.dart';
import 'package:firsttry/util/certificateCard.dart';
import 'package:flutter/material.dart';
import 'package:firsttry/database_helper.dart';


class CertificatePage extends StatefulWidget {
  CertificatePage({super.key, required this.title});
  final String title;

  @override
  _CertificatePageState createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  late Future<List<Map<String, dynamic>>> _certificatesFuture;

  @override
  void initState() {
    super.initState();
    _certificatesFuture = DatabaseHelper.instance.fetchCertificates();
  }

  void _refreshcertificates() {
    setState(() {
      _certificatesFuture = DatabaseHelper.instance.fetchCertificates();
    });
  }

  void _deleteCertificate(int id) async {
    await DatabaseHelper.instance.deleteCertificate(id);
    _refreshcertificates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _certificatesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No Certificates found.'));
              } else {
                final certificates = snapshot.data!;
                return ListView.builder(
                  itemCount: certificates.length,
                  itemBuilder: (context, index) {
                    final certificate = certificates[index];
                    return CerticateCard(
                      id: certificate["id"] as int,
                      title: certificate["title"] as String,
                      description: certificate["description"] as String,
                      onDelete: () => _deleteCertificate(certificate["id"] as int),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCertificate()),
          );
          _refreshcertificates();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
