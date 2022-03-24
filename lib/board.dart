import 'package:flutter/material.dart';
import 'package:puzzle_hack/grid.dart';
import 'package:puzzle_hack/image_display.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

  void shuffle() {
    setState(() {
      number.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ImageDisplay(imagePath: 'assets/cat.png'),
            const Text(
              'Puzzle Hack',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Grid(number: number, onClick: onClick),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                shuffle();
              },
              child: const Text('Shuffle'),
            ),
          ],
        ),
      ),
    );
  }

  void onClick(index) {
    if (index - 1 >= 0 && number[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && number[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && number[index - 4] == 0) ||
        (index + 4 < 16 && number[index + 4] == 0)) {
      setState(() {
        number[number.indexOf(0)] = number[index];
        number[index] = 0;
      });
    }
    // checkWinner();
  }

  // bool isShorted(List numberList) {
  //   int first = numberList.first;
  //   for (int i = 1; i < numberList.length; i++) {
  //     int nextNumber = numberList[i];
  //     if (first > nextNumber) return false;
  //     first = numberList[i];
  //   }
  //   return true;
  // }

  // void checkWinner() {
  //   bool isWinner = isShorted(number);
  //   if (isWinner) {
  //     print('winner');
  //   } else {
  //     print('not sorted');
  //   }
  // }
}
