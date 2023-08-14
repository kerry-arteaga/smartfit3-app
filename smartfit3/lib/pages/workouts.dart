import 'package:flutter/material.dart';
import 'package:smartfit3/logic/mysql.dart';
import 'package:smartfit3/pages/completed_workouts.dart';
import 'package:smartfit3/pages/hidden_drawer.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  WorkoutPageState createState() => WorkoutPageState();
}

class WorkoutPageState extends State<WorkoutPage> {
  var db = Mysql();
  var workouts = <Map<String, dynamic>>[]; // Use a list to store workout rows
  var workoutDateInput = '';
  int numExercisesInput = 0;
  String workoutTitleInput = '';
  TextEditingController workoutDateController = TextEditingController();
  TextEditingController workoutTitleController = TextEditingController();
  TextEditingController numExercisesController = TextEditingController();


  void getWorkouts() {
    db.getConnection().then((conn) {
      String sql = 'SELECT workout_title, num_exercies FROM fitness.workouts';
      conn.query(sql).then((results) {
        setState(() {
          workouts = results.map((row) => row.fields).toList();
        });
      });
    });
  }


  void addWorkout(String workoutDate, String workoutTitle, int numExercises) {
    db.getConnection().then((conn) {
      String insertWorkoutSql = "INSERT INTO fitness.workouts (workout_date, workout_title, num_exercies) VALUES (?, ?, ?)";
      conn.query(insertWorkoutSql, [workoutDate, workoutTitle, numExercises]).then((workoutResults) {
        getWorkouts(); // Refresh the workouts list to display updated data
      });
    });
  }

  void deleteWorkout(String workoutTitle) {
    db.getConnection().then((conn) {
      String deleteWorkoutSql = "DELETE FROM fitness.workouts WHERE workout_title = ?";
      conn.query(deleteWorkoutSql, [workoutTitle]).then((deleteResults) {
        getWorkouts(); // Refresh the workouts list to display updated data
      });
    });
  }


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
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HiddenDrawer(),
                        ),
                      );
                    },
                    child: const Text("Home"),
                ),
                TextFormField(
                  controller: workoutDateController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.black,
                      hintText: 'Workout Date',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Adjust vertical padding
                      hintStyle: TextStyle(
                      fontSize: 18,
                        fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      height: 2.0,
                    ),
                  ),
                  onChanged: (value) {
                    workoutDateInput = value; // workoutDateInput should be a state variable
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: workoutTitleController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                      hintText: 'Workout Title',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Adjust vertical padding
                      hintStyle: TextStyle(
                      fontSize: 18,
                        fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      height: 2.0,
                  ),
                  ),
                  onChanged: (value) {
                    workoutTitleInput = value; // workoutTitleInput should be a state variable
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: numExercisesController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                      hintText: 'Number of Exercises',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Adjust vertical padding
                      hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      height: 2.0,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      numExercisesInput = int.tryParse(value) ?? 0; // Use int.tryParse to handle invalid input
                    });
                  },
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {
                    addWorkout(workoutDateInput, workoutTitleInput, numExercisesInput);
                    // Clear the input values
                    workoutDateController.clear();
                    workoutTitleController.clear();
                    numExercisesController.clear();

                    print("workout successfully added");
                  },
                  child: const Text('Add Workout'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CompleteWorkoutPage()));
                  },
                  child: const Text('Completed Workouts'),
                ),
                //buildWorkoutTable(),
              ],
          ),
      ),
          ),
      );
  }
}

