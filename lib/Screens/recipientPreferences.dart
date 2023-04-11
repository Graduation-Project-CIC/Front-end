// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../design.dart';

class RecipientPreferences extends StatefulWidget {
  const RecipientPreferences({Key? key}) : super(key: key);
  static const String id = 'recipient_preferences';

  @override
  // ignore: library_private_types_in_public_api
  _RecipientPreferencesState createState() => _RecipientPreferencesState();
}

class _RecipientPreferencesState extends State<RecipientPreferences> {
  int selectedChipIndex = 0;
  List<bool> checkedItems = List.filled(8, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // TOP ICON
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11.0, right: 11.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Set up your preferences',
                      style: mainLogoName.copyWith(color: Colors.black),
                    ),
                    Text('You can adjust it later in your settings',
                        style: textStyle.copyWith(color: const Color(0xFF838181))),
                    const SizedBox(height: 30),
                    Text(
                        'Would you rather get',
                        style: textStyle.copyWith(color: const Color(0xFF838181))),
                    const SizedBox(height: 5),
                    Wrap(
                      children: preferencesChipLabels.map((String label) {
                        int index = preferencesChipLabels.indexOf(label);
                        return Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ChoiceChip(
                            label: Text(
                              label,
                              style: TextStyle(
                                color: selectedChipIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            selected: selectedChipIndex == index,
                            onSelected: (bool selected) {
                              setState(() {
                                selectedChipIndex =
                                (selected ? index : null)!;
                              });
                            },
                            selectedColor: const Color(0xFF3D8361),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 30),
                    Text(
                        'What items do you need?',
                        style: textStyle.copyWith(color: const Color(0xFF838181))),
                    const Text('Check all that applies',
                      style : TextStyle(
                        color: Color(0xffD7D8DB),),),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: preferencesCheckBox.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Checkbox(
                              value: checkedItems[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  checkedItems[index] = value!;
                                });
                              },
                              activeColor: Color(0xFF3D8361),
                            ),
                            Text(preferencesCheckBox[index], style: textStyle),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  style: buttonStyle.copyWith(
                    minimumSize:
                    MaterialStateProperty.all<Size>(const Size(213, 50)),
                  ),
                  onPressed:(){},
                  child: const Text('Sign Up')),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}