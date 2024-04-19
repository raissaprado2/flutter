import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(GymTrainingScreen());
}

class GymTrainingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Treino de Academia'),
        ),
        body: GymTrainingList(),
      ),
    );
  }
}

class GymTrainingList extends StatefulWidget {
  @override
  _GymTrainingListState createState() => _GymTrainingListState();
}

class _GymTrainingListState extends State<GymTrainingList> {
  List<String> exercises = [
    'Supino',
    'Agachamento',
    'Barra Fixa',
    'Remada baixa',
    'Abdominais',
    'Prancha',
    'Flexora',
    'Crucifixo',
    'Fly inverso',
    'cardio',
  ];

  Map<String, bool> completedExercises = {};

  @override
  void initState() {
    super.initState();
    _loadCompletedExercises();
  }

  void _loadCompletedExercises() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      exercises.forEach((exercise) {
        completedExercises[exercise] = prefs.getBool(exercise) ?? false;
      });
    });
  }

  void _toggleExerciseStatus(String exercise) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      completedExercises[exercise] = !completedExercises[exercise]!;
      prefs.setBool(exercise, completedExercises[exercise]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        String exercise = exercises[index];
        return ListTile(
          title: Text(exercise),
          trailing: Checkbox(
            value: completedExercises[exercise],
            onChanged: (value) {
              _toggleExerciseStatus(exercise);
            },
          ),
        );
      },
    );
  }
}
