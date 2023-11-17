import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salon_app/view/pages/category.dart';
import 'package:salon_app/view/widget/carousel.dart';
import 'package:salon_app/view/widget/services_center.dart';
import 'package:salon_app/view/widget/custom_text.dart';
import 'package:salon_app/view_model/constraints.dart';
import 'package:salon_app/view_model/cubit/homescreen_cubit/homescreen_cubit.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.model});
  final HomescreenCubit model;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leadingWidth: 70,
              leading: const Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 20),
                child: CircleAvatar(
                  radius: 20,
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Good $greet',
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xA1000000))),
                  Text(name,
                      style: const TextStyle(fontSize: 22, color: Colors.black))
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(CupertinoIcons.bell),
                  onPressed: () {
                    //todo
                  },
                ),
                const SizedBox(width: 5),
                IconButton(
                    icon: const Icon(CupertinoIcons.bookmark),
                    onPressed: () {
                      //todo
                    }),
                const SizedBox(width: 10)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 18, left: 22),
              child: SearchBar(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
                leading: const Icon(
                  CupertinoIcons.search,
                  size: 28,
                  color: Colors.black26,
                ),
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.only(left: 15, right: 0)),
                hintText: 'Search',
                hintStyle: const MaterialStatePropertyAll(
                    TextStyle(fontSize: 18, color: Colors.black26)),
                trailing: const [
                  Icon(Icons.tune_sharp, color: Colors.black26),
                  SizedBox(width: 18)
                ],
                backgroundColor:
                    const MaterialStatePropertyAll(Color(0xC7FFFFFF)),
                elevation: const MaterialStatePropertyAll(0.5),
              ),
            ),
            const CarouselMenu(),
            Padding(
              padding: const EdgeInsets.only(
                  top: 12, left: 24, right: 22, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(text: 'Featured Services'),
                  CustomIndicator(disabledColor: Colors.grey.shade400),
                ],
              ),
            ),
            SizedBox(
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          //later
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 145,
                              height: 120,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: const BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15))),
                              child: Center(child: CustomText(text: '$index')),
                            ),
                            Container(
                                height: 60,
                                width: 145,
                                decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: Center(child: Text(index.toString())))
                          ],
                        ),
                      );
                    },
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 14, left: 24, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(text: 'Category'),
                  TextButton(
                      onPressed: () => model.navItemChange(1),
                      child: Text('View All',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue.shade900)))
                ],
              ),
            ),
            const CategoryPage(count: 6, height: 370),
            const Padding(
              padding:
                  EdgeInsets.only(top: 12, left: 24, right: 22, bottom: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(text: 'Most Popular Services')),
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: serviceList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: index == 0 ? 18 : 0, right: 8),
                      child: ChoiceChip(
                        label: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          child: Text(
                            serviceList[index],
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: model.serviceIndex == index
                                    ? Colors.white
                                    : const Color(0xFF173568)),
                          ),
                        ),
                        selectedColor: const Color(0xFF173568),
                        backgroundColor: const Color(0xFFDFF1FF),
                        onSelected: (value) => model.serviceItemChange(index),
                        selected: index == model.serviceIndex ? true : false,
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: SizedBox(
                height: 700,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ServiceCenter(
                        index: index,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
