import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/views/home/home_view.dart';

class CalendarSegmentWidget extends StatelessWidget {
  final Calendar selected;
  final void Function(Set<Calendar>) onPress;
  const CalendarSegmentWidget(
      {Key? key, required this.selected, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      onSelectionChanged: onPress,
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
          value: Calendar.day,
          label: Text('Day'),
          icon: Icon(Icons.calendar_view_day),
        ),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('Week'),
            icon: Icon(Icons.calendar_view_week)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Month'),
            icon: Icon(Icons.calendar_view_month)),
      ],
      selected: {selected},
      style: ButtonStyle(
        maximumSize: MaterialStateProperty.all<Size>(const Size(100, 40)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return context.primary;
            }
            return context.onPrimary;
          },
        ),
        iconColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return context.onPrimary;
            }
            return context.primary;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return context.onPrimary;
            }
            return context.primary;
          },
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return BorderSide(color: context.primary, width: 2);
            }
            return BorderSide(color: context.primary, width: 1);
          },
        ),
      ),
    );
  }
}
