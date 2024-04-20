import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../manager/main_game.dart';

class MainMenu extends StatelessWidget {
  final MainGame game;
  static const String id = 'mainMenu';

  const MainMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Align(
          alignment: Alignment.topRight,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                return states.contains(MaterialState.hovered) ? Colors.black : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                return states.contains(MaterialState.pressed) ? Colors.white :
                states.contains(MaterialState.hovered) ? Colors.white : Colors.transparent;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            child: const Text(
              'EXIT',
              style: TextStyle(
                fontFamily: 'esamanru',
              ),
            ),
          ),
        ),
      ],
    );
  }
}