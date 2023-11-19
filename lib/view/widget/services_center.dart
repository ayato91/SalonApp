import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/view/widget/custom_text.dart';
import 'package:salon_app/view_model/constraints.dart';

class ServiceCenter extends StatelessWidget {
  const ServiceCenter({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(imageList[index % 2]),
                        fit: BoxFit.fill)),
              )),
          Expanded(
            flex: 5,
            child: Container(
                margin: const EdgeInsets.all(15),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Title'),
                    Text('Location'),
                    Row(
                      children: [
                        Icon(Icons.location_on_rounded),
                        Text('\tDistance')
                      ],
                    ),
                    Row(
                      children: [Icon(Icons.star), Text('\tRating | Reviews')],
                    )
                  ],
                )),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                    index == 0
                        ? CupertinoIcons.bookmark_fill
                        : CupertinoIcons.bookmark,
                    color: index == 0
                        ? const Color(0xFFFF0000)
                        : Colors.black), //todo dynamic function Implimentation
                onPressed: () {
                  //todo Favourite Icon and add to the Favourite list
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
