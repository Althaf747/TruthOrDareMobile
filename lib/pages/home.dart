import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:truth_or_dare/services/database_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DatabaseService _databaseService = DatabaseService.instance;

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
                bottom: 350,
                right: 25,
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
                        offset: Offset(130, 70), // Custom x and y offsets
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
                  // Add new card action
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
