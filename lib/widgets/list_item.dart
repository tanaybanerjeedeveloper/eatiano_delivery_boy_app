import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String imageUrl;
  final String caption;
  final String route;

  ListItem({
    required this.imageUrl,
    required this.caption,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return InkWell(
      splashColor: Colors.transparent,
      // onTap: () => Navigator.of(context).pushReplacementNamed(route),
      onTap: () => Navigator.pushNamed(context, route),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: width * 0.8,
              height: height * 0.08,
              padding: EdgeInsets.only(left: width * 0.02),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(71, 77, 83, 1),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 1),
                        spreadRadius: 5,
                        blurRadius: 5)
                  ]),
              child: Row(children: [
                Container(
                  width: width * 0.12,
                  height: height * 0.1,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey)),
                  child: Image.asset(imageUrl, height: 25, width: 25),
                ),
                SizedBox(width: width * 0.05),
                Text(caption,
                    textScaleFactor: textScale,
                    style: const TextStyle(
                      color: Colors.white,
                    ))
              ]),
            ),
          ),
          Positioned(
            left: width * 0.86,
            child: Container(
              width: width * 0.08,
              height: height * 0.08,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(71, 77, 83, 1),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey)),
              child: const Center(
                  child: Icon(Icons.arrow_forward_ios,
                      color: Colors.red, size: 15)),
            ),
          )
        ],
      ),
    );
  }
}
