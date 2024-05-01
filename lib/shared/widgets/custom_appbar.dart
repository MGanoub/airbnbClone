import 'package:airbnb_clone/shared/theme/colors.dart';
import 'package:airbnb_clone/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextTheme textTheme;

  const CustomAppBar({
    super.key,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 128,
      flexibleSpace: Stack(
        children: [
          // type of properties listed
          Positioned(bottom: 0, left: 0, right: 0, child: PropertyTypeList()),
          // search input
          Positioned(
            left: 16,
            right: 72,
            top: 64.0,
            child: Expanded(
              child: GestureDetector(
                onTap: () {
                  context.pushNamed("booking_details");
                },
                child: Hero(
                  tag: "search-widget",
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        color: appWhite,
                        border: Border.all(color: appGrey, width: 3),
                        borderRadius: BorderRadius.circular(32.0),
                        boxShadow: [
                          BoxShadow(
                            color: appGrey.withOpacity(0.5),
                            blurRadius: 8.0,
                            offset: const Offset(0.0, 4.0),
                          )
                        ]),
                    child: Row(
                      children: [
                        const Icon(Icons.search),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Where to?",
                                style: textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Text("AnyWhere . AnyWeek . Add guest",
                                style: textTheme.bodyMedium!
                                    .copyWith(color: appBlack.withAlpha(130))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 70.0,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.tune, size: 30)),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 170);
}
