import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';

class SavedCard extends StatelessWidget {
  final String title;
  final String count;

  const SavedCard({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: context.onPrimary,
          border: Border.all(
            color: context.secondary.withOpacity(0.1),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: title.toLowerCase() == 'favorites'
                      ? Colors.red.withOpacity(0.1)
                      : Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: title.toLowerCase() == 'favorites'
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.bookmark,
                            color: Colors.blue,
                          )),
              ),
              const SizedBox(width: 16),
              Column(
                children: [
                  Text(
                    title,
                    style: context.subHeading,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    count,
                    style: context.description,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
