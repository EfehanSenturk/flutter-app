import 'package:firsttry/util/addSkill.dart';
import 'package:firsttry/util/skillCard.dart';
import 'package:flutter/material.dart';
import 'package:firsttry/database_helper.dart';



class SkillsPage extends StatefulWidget {
  SkillsPage({super.key, required this.title});
  final String title;

  @override
  _SkillsPageState createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  late Future<List<Map<String, dynamic>>> _skillsFuture;

  @override
  void initState() {
    super.initState();
    _skillsFuture = DatabaseHelper.instance.fetchSkills();
  }

  void _refreshSkills() {
    setState(() {
      _skillsFuture = DatabaseHelper.instance.fetchSkills();
    });
  }

  void _deleteSkill(int id) async {
    await DatabaseHelper.instance.deleteSkill(id);
    _refreshSkills();
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
            future: _skillsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No skills found.'));
              } else {
                final skills = snapshot.data!;
                return ListView.builder(
                  itemCount: skills.length,
                  itemBuilder: (context, index) {
                    final skill = skills[index];
                    return SkillCard(
                      id: skill["id"] as int,
                      title: skill["title"] as String,
                      description: skill["description"] as String,
                      onDelete: () => _deleteSkill(skill["id"] as int),
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
            MaterialPageRoute(builder: (context) => AddSkillPage()),
          );
          _refreshSkills();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
