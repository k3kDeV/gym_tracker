import 'package:flutter/material.dart';
import 'package:gym_tracker/data/database.dart';
import 'package:gym_tracker/data/machines_db.dart';
import 'package:gym_tracker/models/reps_sets_weights_model.dart';
import 'package:gym_tracker/models/workout_model.dart';

class NewTrainingPage extends StatefulWidget {
  final Workout workout;
  const NewTrainingPage({super.key, required this.workout});

  @override
  State<NewTrainingPage> createState() => _NewTrainingPageState();
}

class _NewTrainingPageState extends State<NewTrainingPage> {
  String selected = "A1";
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> menuItemList = machines.maschines
        .map((val) => DropdownMenuItem(value: val.name, child: Text(val.name)))
        .toList();

    TextEditingController repsCnt = TextEditingController();
    TextEditingController setsCnt = TextEditingController();
    TextEditingController weightCnt = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (repsCnt.text.isEmpty ||
              setsCnt.text.isEmpty ||
              weightCnt.text.isEmpty) {
            return;
          }

          setState(
            () {
              widget.workout.repsSetsWeights.add(
                RepsSetsWeights(
                  exercise: selected,
                  reps: repsCnt.text,
                  sets: setsCnt.text,
                  weight: weightCnt.text,
                ),
              );
              db.updateDatabase();
            },
          );
        },
        label: const Row(
          children: [Text("Add "), Icon(Icons.add)],
        ),
        backgroundColor: Colors.deepPurple[800],
      ),
      body: Container(
        color: Colors.grey[800],
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Machine",
                    style: TextStyle(color: Colors.white),
                  ),
                  DropdownButton(
                    dropdownColor: Colors.grey[600],
                    value: selected,
                    items: menuItemList,
                    onChanged: (val) => setState(() => selected = val),
                  ),
                  const Text(
                    "Reps",
                    style: TextStyle(color: Colors.white),
                  ),
                  customTextField(repsCnt),
                  const Text(
                    "Sets",
                    style: TextStyle(color: Colors.white),
                  ),
                  customTextField(setsCnt),
                  const Text(
                    "Weight",
                    style: TextStyle(color: Colors.white),
                  ),
                  customTextField(weightCnt),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextField customTextField(TextEditingController controller) {
    return TextField(
      cursorColor: Colors.white,
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "",
        border: inputBorder(),
        enabledBorder: inputBorder(),
      ),
    );
  }

  OutlineInputBorder inputBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      borderSide: BorderSide(color: Colors.deepPurple.shade800, width: 2.0),
    );
  }
}
