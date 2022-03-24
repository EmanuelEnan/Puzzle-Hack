import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  List number = [];
  Function onClick;

  Grid({Key? key, required this.number, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width * .5,
      child: GridView.builder(
          itemCount: number.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (context, index) {
            return number[index] != 0
                ? GestureDetector(
                    onTap: () {
                      onClick(index);
                    },
                    child: Card(
                      elevation: 10,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              number[index].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          }),
    );
  }
}
