import 'package:firsttry/util/addProject.dart';
import 'package:firsttry/util/projectCard.dart';
import 'package:flutter/material.dart';
import 'package:firsttry/database_helper.dart';



class ProjectsPage extends StatefulWidget {
  ProjectsPage({super.key, required this.title});
  final String title;

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  late Future<List<Map<String, dynamic>>> _projectsFuture;

  @override
  void initState() {
    super.initState();
    _projectsFuture = DatabaseHelper.instance.fetchProjects();
  }

  void _refreshProjects() {
    setState(() {
      _projectsFuture = DatabaseHelper.instance.fetchProjects();
    });
  }

  void _deleteProject(int id) async {
    await DatabaseHelper.instance.deleteProject(id);
    _refreshProjects();
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
            future: _projectsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No projects found.'));
              } else {
                final projects = snapshot.data!;
                return ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    return ProjectCard(
                      id: project["id"] as int,
                      title: project["title"] as String,
                      description: project["description"] as String,
                      onDelete: () => _deleteProject(project["id"] as int),
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
            MaterialPageRoute(builder: (context) => AddProjectPage()),
          );
          _refreshProjects();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
