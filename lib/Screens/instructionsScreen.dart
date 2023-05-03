import 'package:flutter/material.dart';
void main() {
  runApp(const MyScreen());
}
class MyScreen extends StatelessWidget {
  const MyScreen ({Key? key}) : super(key: key);
  static const String id = 'MyScreen';
  @override
  //_MyScreen createState() => _MyScreen();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('instructions'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           const Text(
            'Let us help you in using Full Circle.',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                child: const SizedBox(
                  width: 351,
                  height: 54,
                  child: Center(
                    child: Text('Donor instructions'),
                  ),
                ),
                onPressed: () {
                  // Perform action when button 1 is pressed
                },
              ),
              OutlinedButton(
                //color: Colors.red,
                //textColor: Colors.white,
                child: const SizedBox(
                  width: 351,
                  height: 54,
                child: Center(
                  child: Text('Driver instructions'),
                ),
                ),
                onPressed: () {
                  // Perform action when button 2 is pressed
                },
              ),
              OutlinedButton(
                child: const SizedBox(
                  width: 351,
                  height: 54,
                  child: Center(
                    child:  Text(
                        'Recipient instructions',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                   ),
                  ),
                ),
                onPressed: () {
                  // Navigator.pushNamed(context, .id);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
