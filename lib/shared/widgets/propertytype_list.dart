import 'package:airbnb_clone/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:airbnb_clone/models/models.dart';

class PropertyTypeList extends StatefulWidget {
  PropertyTypeList({super.key, this.selectedIndex = 0});
  int selectedIndex = 0;

  @override
  State<PropertyTypeList> createState() => _PropertyTypeListState();
}

class _PropertyTypeListState extends State<PropertyTypeList> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 56.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: Properties.propertyTypes.length,
        itemBuilder: (context, index) {
          return Container(
            width: size.width * 0.2,
            margin: const EdgeInsets.only(right: 4, left: 4, top: 4),
            child: Column(
              children: [
                Icon(Properties.propertyTypes[index]["icon"], color: appBlack),
                SizedBox(height: 2),
                Text(Properties.propertyTypes[index]["type"],
                    style: textTheme.bodySmall!.copyWith(
                      fontWeight: (index == widget.selectedIndex)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    )),
                (index == widget.selectedIndex)
                    ? Container(
                        margin: const EdgeInsets.only(top: 2),
                        height: 2,
                        width: 64,
                        color: appBlack)
                    : const SizedBox()
              ],
            ),
          );
        },
      ),
    );
  }
}
