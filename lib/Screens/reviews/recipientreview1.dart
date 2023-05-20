import 'package:flutter/material.dart';
import 'package:full_circle/Screens/recipientreviews.dart';
import '../../design.dart';

class RecipientReview1 extends StatefulWidget {
  const RecipientReview1({Key? key}) : super(key: key);

  static const String id = 'RecipientReview1';

  @override
  _RecipientReview1 createState() => _RecipientReview1();
}

class _RecipientReview1 extends State<RecipientReview1> {
  double _pickupConvenience = 0;
  double _donorDestination = 0;
  double _packaging = 0;
  String _additionalNotes = '';
  bool _deliveredWel = true;
  bool _fitCategory = false;
  bool _quantityEnough = true;
  String? servingsCount = "<5" "<10" "<50" "<100" "other";
  bool isChecked = false;
  String? _preferredCategory = "COOKED";
  bool isSelected = false;
  String? selectedCategory;
  String? selectedChipIndex;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.2;
    final buttonHeight = screenHeight * 0.04;
    final pointSize = screenHeight / 40;
    final fontSize = screenHeight / 35;
    final fontSize2 = screenHeight / 40;
    final padding = EdgeInsets.all(screenHeight * 0.01);
    final buttonpadding = EdgeInsets.all(screenHeight * 0.05);
    final double sizedBoxHeight = screenHeight * 0.1;
    final double sizedBoxHeight1 = screenHeight * 0.04;
    final buttonfont = screenHeight / 50;

    return Scaffold(
      body: Padding(
        padding: padding,
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: sizedBoxHeight),
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RecipientReviews.id);
                  },
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.circle,
                          color: const Color(0xff3D8361),
                          size: pointSize,
                        ),
                      ),
                      TextSpan(
                        text: 'Your experience with the ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: fontSize,
                        ),
                      ),
                      TextSpan(
                        text: 'driver',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: sizedBoxHeight1),
                Text(
                  'Were the packages delivered in good shape?',
                  style: TextStyle(fontSize: fontSize2),
                ),
                SizedBox(height: sizedBoxHeight1),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: buttonStyle.copyWith(backgroundColor:
                        MaterialStateProperty.all<Color>(const Color(0xff3D8361))),
                        onPressed: () {
                          setState(() {
                            _deliveredWel = true;
                          });
                        },
                        child: const Text('Yes'),
                      ),
                      ElevatedButton(
                        style: buttonStyle.copyWith(backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                        onPressed: () {
                          setState(() {
                            _deliveredWel = false;
                          });
                        },
                        child: const Text('No'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: sizedBoxHeight1),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Additional Notes',
                    fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff3D8361),
                      ),
                    ),
                    hintStyle: TextStyle(fontSize: fontSize2),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _additionalNotes = value;
                    });
                  },
                ),
                SizedBox(height: sizedBoxHeight1),
                Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.circle,
                          color: const Color(0xff3D8361),
                          size: pointSize,
                        ),
                      ),
                      TextSpan(
                        text: 'Your experience with the ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: fontSize,
                        ),
                      ),
                      TextSpan(
                        text: 'driver',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: sizedBoxHeight1),
                Text(
                  'Was this the category of donation you need?',
                  style: TextStyle(fontSize: fontSize2),
                ),
                SizedBox(height: sizedBoxHeight1),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: buttonStyle.copyWith(backgroundColor:
                        MaterialStateProperty.all<Color>(const Color(0xff3D8361))),
                        onPressed: () {
                          setState(() {
                            _fitCategory = true;
                          });
                        },
                        child: const Text('Yes'),
                      ),
                      ElevatedButton(
                        style: buttonStyle.copyWith(backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                        onPressed: () {
                          setState(() {
                            _fitCategory = false;
                          });
                        },
                        child: const Text('No'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: sizedBoxHeight1),
                Text(
                  'What category of donation would you prefer next time?',
                  style: TextStyle(fontSize: fontSize2),
                ),
                SizedBox(height: sizedBoxHeight1),
                DropdownButtonFormField<String>(
                  decoration: textFieldDecoration.copyWith(
                    hintText: "Choose food category",
                    labelText: 'Select a category',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  value: selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                  items: categories
                      .map<DropdownMenuItem<String>>((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: sizedBoxHeight1,
                  child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(categories[index]),
                        onTap: () {
                          setState(() {
                            _preferredCategory = categories[index];
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: sizedBoxHeight1),
                Text(
                  'Was the quantity enough for your needs?',
                  style: TextStyle(fontSize: fontSize2),
                ),
                SizedBox(height: sizedBoxHeight1),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: buttonStyle.copyWith(backgroundColor:
                        MaterialStateProperty.all<Color>(const Color(0xff3D8361))),
                        onPressed: () {
                          setState(() {
                            _quantityEnough = true;
                          });
                        },
                        child: const Text('Yes'),
                      ),
                      ElevatedButton(
                        style: buttonStyle.copyWith(backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                        onPressed: () {
                          setState(() {
                            _quantityEnough = false;
                          });
                        },
                        child: const Text('No'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: sizedBoxHeight1),
                Text(
                  'How many servings would be sufficient for your needs?',
                  style: TextStyle(fontSize: fontSize2),
                ),
                SizedBox(height: sizedBoxHeight1),
                Wrap(
                  children: chipLabels.map((String label) {
                    int index = chipLabels.indexOf(label);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ChoiceChip(
                        label: Text(
                          label,
                          style: TextStyle(
                            color: servingsCount == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        selected: servingsCount == index,
                        onSelected: (bool selected) {
                          setState(() {
                            servingsCount =
                                (selected ? index : null)! as String?;
                          });
                        },
                        selectedColor: const Color(0xFF3D8361),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: sizedBoxHeight1),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Additional Notes',
                    fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff3D8361),
                      ),
                    ),
                    hintStyle: TextStyle(fontSize: fontSize2),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _additionalNotes = value;
                    });
                  },
                ),
                SizedBox(height: sizedBoxHeight1),
                Padding(
                  padding: buttonpadding,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: SizedBox(
                            width: buttonWidth,
                            height: buttonHeight,
                            child: Center(
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    color: Colors.black, fontSize: buttonfont),
                              ),
                            ),
                          ),
                          onPressed: () {
                            //Navigator.pushNamed(context, DriversInstructions.id);
                          },
                        ),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xff3D8361),
                          ),
                          child: SizedBox(
                            width: buttonWidth,
                            height: buttonHeight,
                            child: Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    color: Colors.white, fontSize: buttonfont),
                              ),
                            ),
                          ),
                          onPressed: () {
                            //Navigator.pushNamed(context, DriversInstructions.id);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
