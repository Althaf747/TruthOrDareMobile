

import 'package:flutter/material.dart';
import 'package:truth_or_dare/services/database_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DatabaseService _databaseService = DatabaseService.instance;

  void _showAddQuestionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Question",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Space between question and dropdown
                  Expanded(
                    flex: 1,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: "Truth",
                            child: Text("Truth"),
                          ),
                          DropdownMenuItem(
                            value: "Dare",
                            child: Text("Dare"),
                          ),
                        ],
                        onChanged: (value) {
                          // Handle dropdown value change
                        },
                        hint: Text("Type"),
                      ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Transform.translate(
                offset: Offset(MediaQuery.of(context).size.width*0.31,0),
                child : SizedBox(
                  width: 130,
                  height: 50,
                  child : ElevatedButton(
                    onPressed: () {
                      // Save action
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF373A40), // Dark gray
              Color(0xFF50545B), // Medium gray
              Color(0xFF686D76), // Lighter gray
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // RED CARD
            Positioned(
                top: MediaQuery.of(context).size.height * 0.29,
                left:MediaQuery.of(context).size.width * 0.39,
                child: Container(
                  height: 300,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFFB50800),
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color : Colors.black.withValues(alpha: 0.5),
                        offset: Offset(10, 15),
                        blurRadius: 25.0,
                      )
                    ]
                  ),
                  child: Stack(
                    children: [
                      Transform.translate(
                        offset: Offset(115, 130), // Adjust x and y offsets for "OR"
                        child: Text(
                          "OR",
                          style: TextStyle(
                            color: Color(0xFFEEEEEE),
                            fontSize: 28,
                            fontFamily: 'Inconsolata',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(115, 170), // Adjust x and y offsets for "DARE"
                        child: Text(
                          "DARE",
                          style: TextStyle(
                            color: Color(0xFFEEEEEE),
                            fontSize: 28,
                            fontFamily: 'Inconsolata',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            // START BUTTON
            Positioned(
                height: 35,
                width: 140,
                bottom:MediaQuery.of(context).size.height*0.33,
                right: MediaQuery.of(context).size.width*0.04,
                child: FloatingActionButton(
                  onPressed: () {

                  },
                  backgroundColor: Color(0xFFEEEEEE),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Start",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inconsolata',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ),
            //BLUE CARD
            Positioned(
                top: MediaQuery.of(context).size.height * 0.35,
                right:MediaQuery.of(context).size.width * 0.39,
                child: Container(
                  height: 300,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Color(0xFF00ADB5),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color : Colors.black.withValues(alpha: 0.5),
                          offset: Offset(10, 15),
                          blurRadius: 25.0,
                        )
                      ]
                  ),
                  child: Stack(
                    children: [
                      Transform.translate(
                        offset: Offset(135, 70), // Custom x and y offsets
                        child: Text(
                          "TRUTH",
                          style: TextStyle(
                            color: Color(0xFFEEEEEE),
                            fontSize: 28,
                            fontFamily: 'Inconsolata',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
            //SETTING BUTTON
            Positioned(
              bottom: 40, // Distance from the bottom of the screen
              left: 40, // Distance from the left edge
              child: FloatingActionButton(
                onPressed: () {
                  // Settings action
                },
                backgroundColor: Color(0xFFEEEEEE),
                child: Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ),
            //ADD BUTTON
            Positioned(
              bottom: 40, // Distance from the bottom of the screen
              right: 40, // Distance from the right edge
              child: FloatingActionButton(
                onPressed: () {
                  _showAddQuestionModal(context);
                },
                backgroundColor: Color(0xFFEEEEEE),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
