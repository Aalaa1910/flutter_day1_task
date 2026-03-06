

import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int currentIndex = 0;

  List items = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.nightlight_round, 'label': 'Sleep'},
    {'icon': Icons.circle_outlined, 'label': 'Zen'},
    {'icon': Icons.music_note, 'label': 'Music'},
    {'icon': Icons.chat_bubble_outline, 'label': 'Chat'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          items[currentIndex]['label'],
          style: TextStyle(fontSize: 30),
        ),
      ),

      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12,
            )
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(items.length, (index) {
            bool isSelected = currentIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: isSelected
                          ? LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.purple,
                        ],
                      )
                          : null,
                    ),

                    child: Icon(
                      items[index]['icon'],
                      color: isSelected ? Colors.white : Colors.grey,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    items[index]['label'],
                    style: TextStyle(
                      color: isSelected ? Colors.blue : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}