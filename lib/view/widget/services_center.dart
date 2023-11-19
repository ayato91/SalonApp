import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/view/widget/custom_text.dart';
import 'package:salon_app/view_model/cubit/homescreen_cubit/homescreen_cubit.dart';

class ServiceCenter extends StatelessWidget {
  const ServiceCenter({super.key, required this.index, required this.model});
  final int index;
  final HomescreenCubit model;
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
                        image: AssetImage('assets/icons/${index + 1}.png'),
                        fit: BoxFit.fill)),
              )),
          Expanded(
            flex: 5, //TODO
            child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Title ${index + 1}'),
                    Text('Location ${index + 1}'),
                    const Row(
                      children: [
                        Icon(Icons.location_on_rounded),
                        Text('\tDistance')
                      ],
                    ),
                    const Row(
                      children: [Icon(Icons.star), Text('\tRating | Reviews')],
                    )
                  ],
                )),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                splashRadius: 20,
                tooltip: model.isFavourited[index]
                    ? 'Remove from Favourites'
                    : 'Add to Favourites',
                icon: Icon(
                    model.isFavourited[index]
                        ? CupertinoIcons.bookmark_fill
                        : CupertinoIcons.bookmark,
                    color: model.isFavourited[index]
                        ? const Color(0xFFFF0000)
                        : Colors.black),
                onPressed: () {
                  model.favouriteItem(index);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: const Color(0xFD1F4260),
                    behavior: SnackBarBehavior.floating,
                    width: MediaQuery.sizeOf(context).width / 2,
                    duration: const Duration(seconds: 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    content: Center(
                      child: Text(model.isFavourited[index]
                          ? 'Added to Favourites'
                          : 'Removed from Favourites'),
                    ),
                  ));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
