import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;

  Button(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.055,
      child: Center(
        child: Text(
          text,
          textScaleFactor: MediaQuery.of(context).textScaleFactor * 1.2,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 0, 0, 1),
        borderRadius: BorderRadius.circular(28),
      ),
    );
  }
}
