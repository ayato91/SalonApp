import 'package:flutter/material.dart';
import 'package:salon_app/view_model/constraints.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, this.height, this.count});
  final double? height;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 525,
      child: GridView.builder(
        itemCount: count ?? ctgList.length,
        padding: const EdgeInsets.all(15),
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 170,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 15),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              //TODO
            },
            child: Column(
              children: [
                Container(
                  height: 120,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFF6F6F6),
                  ),
                  child: Image.asset("assets/icons/${index + 1}.png"),
                ),
                SizedBox(
                  height: 45,
                  child: Center(
                      child: Text(ctgList[index],
                          style: const TextStyle(fontWeight: FontWeight.w500))),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
