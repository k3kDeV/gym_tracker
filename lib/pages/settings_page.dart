import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static var trainigs = [
    "Restday",
    "Chest",
    "Legs",
    "Restday",
    "Arms",
    "Restday",
    "Back"
  ];

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0, bottom: 67),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[900],
          ),
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              children: [
                customText("Monday"),
                customDropDown(0),
                customText("Tuesday"),
                customDropDown(1),
                customText("Wednesday"),
                customDropDown(2),
                customText("Thursday"),
                customDropDown(3),
                customText("Friday"),
                customDropDown(4),
                customText("Saturday"),
                customDropDown(5),
                customText("Sunday"),
                customDropDown(6),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text customText(String weekday) {
    return Text(
      weekday,
      style: const TextStyle(color: Colors.white),
    );
  }

  DropdownButton<String> customDropDown(int index) {
    return DropdownButton(
      value: SettingsPage.trainigs[index],
      dropdownColor: Colors.grey[900],
      items: const [
        DropdownMenuItem(
            value: "Arms", child: CustomTextWithStyle(value: "Arms")),
        DropdownMenuItem(
            value: "Back", child: CustomTextWithStyle(value: "Back")),
        DropdownMenuItem(
            value: "Legs", child: CustomTextWithStyle(value: "Legs")),
        DropdownMenuItem(
            value: "Chest", child: CustomTextWithStyle(value: "Chest")),
        DropdownMenuItem(
            value: "Restday", child: CustomTextWithStyle(value: "Restday")),
        DropdownMenuItem(
            value: "Upper Body",
            child: CustomTextWithStyle(value: "Upper Body")),
        DropdownMenuItem(
            value: "Pull", child: CustomTextWithStyle(value: "Pull")),
        DropdownMenuItem(
            value: "Push", child: CustomTextWithStyle(value: "Push")),
      ],
      onChanged: (value) => {
        setState(() {
          SettingsPage.trainigs[index] = value.toString();
        })
      },
    );
  }
}

class CustomTextWithStyle extends StatelessWidget {
  final String value;
  const CustomTextWithStyle({
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(color: Colors.white),
    );
  }
}
