import 'package:airbnb_clone/models/property.dart';
import 'package:airbnb_clone/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:airbnb_clone/shared/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(textTheme: textTheme),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: Property.sampleData.length,
            itemBuilder: (context, index) {
              return PropertyCard(property: Property.sampleData[index]);
            }),
      ),
    );
  }
}
