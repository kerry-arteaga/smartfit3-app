import 'package:flutter/material.dart';
import 'package:smartfit3/logic/mysql.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  WorkoutPageState createState() => WorkoutPageState();
}

class WorkoutPageState extends State<WorkoutPage> {
  var db = Mysql();
  var workouts = <Map<String, dynamic>>[]; // Use a list to store workout rows

  void getWorkouts() {
    db.getConnection().then((conn) {
      String sql = 'SELECT * FROM fitness.workouts';
      conn.query(sql).then((results) {
        setState(() {
          workouts = results.map((row) => row.fields).toList();
        });
      });
    });
  }
  Widget buildWorkoutTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Workout ID')),
          DataColumn(label: Text('Week')),
          DataColumn(label: Text('Day')),
          DataColumn(label: Text('Exercise')),
          DataColumn(label: Text('Repetitions')),
          DataColumn(label: Text('Sets')),
        ],
        rows: workouts.map<DataRow>((Map<String, dynamic> row) {
          return DataRow(
            cells: [
              DataCell(Text(row['workout_id'].toString())),
              DataCell(Text(row['week'].toString())),
              DataCell(Text(row['day'].toString())),
              DataCell(Text(row['exercise'].toString())),
              DataCell(Text(row['repetitions'].toString())),
              DataCell(Text(row['sets'].toString())),
            ],
          );
        }).toList(),
      ),
    );
  }

// ... rest of your code ...


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Container(
        alignment: const Alignment(0, 0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/smartfitlogotransparent.png'),
          ),
        ),
          child: Column(
            children: [
              TextButton(
                onPressed: getWorkouts,
                child: const Text('Completed Workouts'),
              ),
              Wrap(
                children: [
                  buildWorkoutTable(),
                ],
              ),
            ],
          )
      ),
    );
  }
}

