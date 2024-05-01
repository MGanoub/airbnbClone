import 'package:airbnb_clone/models/property.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class PropertyCard extends StatefulWidget {
  const PropertyCard({super.key, required this.property});
  final Property property;

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  var currentPage = 0;
  final pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: size.width,
              height: size.width - 32,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: widget.property.photoUrls.map((imageUrl) {
                  return Image.network(imageUrl, fit: BoxFit.cover);
                }).toList(),
              ),
            ),
            Positioned(
                bottom: 8.0,
                left: 0,
                right: 0,
                child: DotsIndicator(
                  dotsCount: widget.property.photoUrls.length,
                  position: currentPage,
                  onTap: (index) {
                    pageController.animateToPage(index,
                        duration: const Duration(microseconds: 300),
                        curve: Curves.easeIn);
                  },
                  decorator: DotsDecorator(
                    color: Theme.of(context).colorScheme.onSecondary,
                    activeColor: Theme.of(context).colorScheme.secondary,
                    size: const Size.square(8),
                    activeSize: const Size(12, 8),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.property.country} , ${widget.property.city}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(widget.property.description),
              const SizedBox(height: 8),
              Text(widget.property.amenities.join(", ")),
            ],
          ),
        ),
      ],
    );
  }
}
