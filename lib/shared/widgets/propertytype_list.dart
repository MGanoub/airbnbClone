import 'package:airbnb_clone/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:airbnb_clone/models/models.dart';

class PropertyTypeList extends StatefulWidget {
  const PropertyTypeList({super.key});

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
            child: Column(
              children: [
                Icon(Properties.propertyTypes[index]["icon"], color: appBlack),
                SizedBox(height: 2),
                Text(Properties.propertyTypes[index]["type"],
                    style: textTheme.bodySmall),
              ],
            ),
          );
        },
      ),
    );
  }
}
