import 'package:flutter/material.dart';
import 'package:flutter_keyboard/keyboard_screen.dart';

class KeyboardTestStartScreen extends StatefulWidget {
  const KeyboardTestStartScreen({super.key});

  @override
  KeyboardTestStartScreenState createState() => KeyboardTestStartScreenState();
}

class KeyboardTestStartScreenState extends State<KeyboardTestStartScreen> {
  final List<String> keyboardTypes = [
    'macOS',
    'Windows',
    'Full',
    'Tenkey Less',
    '60%',
  ];
  String selectedKeyboard = 'macOS';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                ),
                alignment: Alignment.center,
                child: Text(
                  'K',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Dropdown
              Container(
                width: 360,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedKeyboard,
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                    dropdownColor: Colors.white,
                    style: TextStyle(color: Colors.black),
                    hint: Text("Select Keyboard Type"),
                    items:
                        keyboardTypes.map((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedKeyboard = value!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Start Button
              SizedBox(
                width: 360,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KeyboardScreen()),
                    );
                  },
                  child: Text('Start', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
