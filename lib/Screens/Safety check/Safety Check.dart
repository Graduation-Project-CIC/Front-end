import 'package:flutter/material.dart';
import 'package:full_circle/Screens/home-page.dart';
import '../../design.dart';
import 'SafetyCheck2.dart';

class SafetyCheck1 extends StatefulWidget {
  const SafetyCheck1({Key? key}) : super(key: key);

  static const String id = 'SafetyCheck1';

  @override
  _SafetyCheck1 createState() => _SafetyCheck1();
}

class _SafetyCheck1 extends State<SafetyCheck1> {
  bool expired= false;
  bool leaking=true;
  bool spoiled=true;
  bool cookedIsExpired=false;
  bool cookedIsHot= true;
  bool cookedIsSafe= true;
  bool cookedIsLeaking=false;
  bool cookedIsSpoiled=false;

  List<String> options = [
    'Cans are bloated or dented',
    'Bags are not sealed or cut',
    'Bakery is stale',
    'Fruit is expired',
  ];
  String issues = '';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.2;
    final buttonHeight = screenHeight * 0.04;
    final fontSize1 = screenHeight / 25;
    final fontSize2 = screenHeight / 40;
    final fontSize3 = screenHeight / 55;
    final padding = EdgeInsets.all(screenHeight * 0.01);
    final buttonpadding = EdgeInsets.all(screenHeight * 0.05);
    final double sizedBoxHeight = screenHeight * 0.1;
    final double sizedBoxHeight1 = screenHeight * 0.04;
    final buttonfont = screenHeight / 50;
    final bool isSmallScreen = screenWidth < 600;
    final pointSize = screenHeight / 50;


    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: sizedBoxHeight),
            Text(
              'Donation Safety Checklist',
              style: TextStyle(fontSize: fontSize1,fontWeight: FontWeight.bold),
            ),
            Text(
              'Groceries',
              style: TextStyle(fontSize: fontSize3,fontWeight: FontWeight.bold),
            ),
            //SizedBox(height: sizedBoxHeight),
            Text(
              'Are all items not expired?',
              style: TextStyle(fontSize: fontSize2),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: buttonStyle.copyWith(backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF3D8361))),
                  onPressed: () {
                    setState(() {
                      expired = true;
                    });
                  },
                  child: Text('Yes'),
                ),
                ElevatedButton(
                 style: buttonStyle.copyWith(backgroundColor:
    MaterialStateProperty.all<Color>(Colors.red)),
                  onPressed: () {
                    setState(() {
                      expired = false;
                    });
                  },
                  child: Text('No'),
                ),
              ],
            ),
            SizedBox(height: sizedBoxHeight1),
            Text(
              'Is there any package leaking?',
              style: TextStyle(fontSize: fontSize2),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: buttonStyle.copyWith(backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xff3D8361))),
                  onPressed: () {
                    setState(() {
                      leaking = true;
                    });
                  },
                  child: Text('Yes',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: buttonfont),),
                ),
                ElevatedButton(
                  style: buttonStyle.copyWith(backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    setState(() {
                      leaking = false;
                    });
                  },
                  child: Text('No',style: TextStyle(
                      color: Colors.red,
                      fontSize: buttonfont),
                ),),

              ],
            ),
            SizedBox(height: sizedBoxHeight1),
            Text(
              'Does any of the food smell spoiled?',
              style: TextStyle(fontSize: fontSize2),
            ),
            Row(
              children: [
                ElevatedButton(
            style: buttonStyle.copyWith(backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xff3D8361))),
                  onPressed: () {
                    setState(() {
                      spoiled = true;
                    });
                  },
                  child: Text('Yes'),
                ),
                ElevatedButton(
                  style: buttonStyle.copyWith(backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    setState(() {
                      spoiled = false;
                    });
                  },
                  child: Text('No',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: buttonfont),
                  ),
                  ),
              ],
            ),
            SizedBox(height: sizedBoxHeight1),
            Text(
              'Is there any of the following issues with the food?',
              style: TextStyle(fontSize: fontSize2),
            ),
            Column(
              children: options.map((option) {
                return RadioListTile(
                  title: Text(option),
                  value: option,
                  groupValue: issues,
                  onChanged: (value) {
                    setState(() {
                      issues = value.toString();
                    });
                  },
                );
              }).toList(),
            ),
            ElevatedButton(
              style: buttonStyle.copyWith(backgroundColor:
              MaterialStateProperty.all<Color>(const Color(0xff3D8361))),
              child: Text('Save'),
              onPressed: () {
                if (issues.isNotEmpty) {
                  // do something with the selected option
                  print('Selected option: $issues');
                } else {
                  // show an error message if no option is selected
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Please select an option.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),

            SizedBox(height: sizedBoxHeight1),
            Text(
              'Cooked Meals',
              style: TextStyle(fontSize: fontSize3,fontWeight: FontWeight.bold),
            ),SizedBox(height: sizedBoxHeight1),
            Text(
              'Is there expiry date on meals?',
              style: TextStyle(fontSize: fontSize2),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: buttonStyle.copyWith(backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    setState(() {
                      cookedIsExpired = true;
                    });
                  },
                  child: Text('Yes',
                    style: TextStyle(
                        color: Color(0xff3D8361),
                        fontSize: buttonfont),),
                ),
                ElevatedButton(
                  style: buttonStyle.copyWith(backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.red)),
                  onPressed: () {
                    setState(() {
                      cookedIsExpired = false;
                    });
                  },
                  child: Text('No'),
                ),
              ],
            ),
            SizedBox(height: sizedBoxHeight1),
            Text(
              'Are the meals hot?',
              style: TextStyle(fontSize: fontSize2),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: buttonStyle.copyWith(backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    setState(() {
                      cookedIsHot= true;
                    });
                  },
                  child: Text('Yes',
                    style: TextStyle(
                        color: Color(0xff3D8361),
                        fontSize: buttonfont),),
                ),
                ElevatedButton(
                  style: buttonStyle.copyWith(backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.red)),
                  onPressed: () {
                    setState(() {
                      cookedIsHot = false;
                    });
                  },
                  child: Text('No'),
                ),
              ],
            ),
            SizedBox(height: sizedBoxHeight1),
            Text(
              'Are they safe to handle?',
              style: TextStyle(fontSize: fontSize2),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: buttonStyle.copyWith(backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    setState(() {
                      cookedIsSafe= true;
                    });
                  },
                  child: Text('Yes',
                    style: TextStyle(
                        color: Color(0xff3D8361),
                        fontSize: buttonfont),),
                ),
                ElevatedButton(
                  style: buttonStyle.copyWith(backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.red)),
                  onPressed: () {
                    setState(() {
                      cookedIsSafe = false;
                    });
                  },
                  child: Text('No'),
                ),
              ],
            ),
            SizedBox(height: sizedBoxHeight1),
            Text(
              'Is there anything leaking?',
              style: TextStyle(fontSize: fontSize2),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: buttonStyle.copyWith(backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    setState(() {
                      cookedIsLeaking = true;
                    });
                  },
                  child: Text('Yes',
                    style: TextStyle(
                        color: Color(0xff3D8361),
                        fontSize: buttonfont),),
                ),
                ElevatedButton(
                  style: buttonStyle.copyWith(backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.red)),
                  onPressed: () {
                    setState(() {
                      cookedIsLeaking = false;
                    });
                  },
                  child: Text('No'),
                ),
              ],
            ),
            SizedBox(height: sizedBoxHeight1),
            Text(
              'Does anything smell spoiled?',
              style: TextStyle(fontSize: fontSize2),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: buttonStyle.copyWith(backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    setState(() {
                      cookedIsSpoiled = true;
                    });
                  },
                  child: Text('Yes',
                    style: TextStyle(
                        color: Color(0xff3D8361),
                        fontSize: buttonfont),),
                ),
                ElevatedButton(
                    style: buttonStyle.copyWith(backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red)),
                  onPressed: () {
                    setState(() {
                      cookedIsSpoiled = false;
                    });
                  },
                  child: Text('No'),
                ),
              ],
            ),

            SizedBox(height: sizedBoxHeight1),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
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
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: pointSize,
                              ),
                              Text(
                                'Back',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: buttonfont),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
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
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_circle_right,
                                color: Colors.white,
                                size: pointSize,
                              ),
                              Text(
                                'Done',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: buttonfont),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SafetyCheck2.id);
                      },
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
