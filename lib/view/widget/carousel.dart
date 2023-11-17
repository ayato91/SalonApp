// ignore_for_file: dead_code

import 'package:flutter/material.dart';

import 'package:salon_app/view_model/constraints.dart';

class CarouselMenu extends StatelessWidget {
  const CarouselMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: SizedBox(
        height: 210,
        child: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: NetworkImage(imageList[index]),
                        fit: BoxFit.fill)),
                child: const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomIndicator(),
                    )));
          },
        ),
      ),
    );
  }
}

class CustomIndicator extends StatefulWidget {
  const CustomIndicator({super.key, this.disabledColor});
  final Color? disabledColor;
  @override
  State<CustomIndicator> createState() => _CustomIndicatorState();
}

class _CustomIndicatorState extends State<CustomIndicator> {
  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.sizeOf(context).width;
    bool isFirst = !false, isSecond = !true, isThird = !true;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 140,
      width: wi / 7,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated
            Container(
              margin: const EdgeInsets.only(right: 5),
              // duration: Duration(milliseconds: 500),
              width: isFirst ? wi / 18 : wi / 50,
              decoration: BoxDecoration(
                shape: isFirst ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: isFirst ? BorderRadius.circular(30) : null,
                color: isFirst
                    ? const Color(0xFF1569E6)
                    : widget.disabledColor ?? Colors.white,
              ),
            ),
            // Animated
            Container(
              margin: const EdgeInsets.only(right: 4),
              // duration: Duration(milliseconds: 500),
              width: isSecond ? wi / 18 : wi / 50,
              decoration: BoxDecoration(
                shape: isSecond ? BoxShape.rectangle : BoxShape.circle,
                borderRadius: isSecond ? BorderRadius.circular(30) : null,
                color: isSecond
                    ? const Color(0xFF1569E6)
                    : widget.disabledColor ?? Colors.white,
              ),
            ),
            // Animated
            Container(
              // duration: Duration(milliseconds: 500),
              width: isThird ? wi / 18 : wi / 50,
              decoration: BoxDecoration(
                  shape: isThird ? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: isThird ? BorderRadius.circular(30) : null,
                  color: isThird
                      ? const Color(0xFF1569E6)
                      : widget.disabledColor ?? Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
