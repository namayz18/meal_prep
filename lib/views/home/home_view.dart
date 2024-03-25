import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/views/home/controller/home_view_controller.dart';
import 'package:meal_prep/views/home/view/home_day_view.dart';
import 'package:meal_prep/views/home/view/home_month_view.dart';
import 'package:meal_prep/views/home/view/home_week_view.dart';
import 'package:meal_prep/views/home/widgets/calendar_segment_widget.dart';

enum Calendar { day, week, month }

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewController _homeViewController = HomeViewController();
  Calendar _selected = Calendar.day;
  String _calendarTitle = 'Today';
  DateTime _focusDate = DateTime.now();
  final EasyInfiniteDateTimelineController _dateTimelineController =
      EasyInfiniteDateTimelineController();

  // Function to handle calendar selection change
  void _handleSegmentChange(Set<Calendar> selectedCalendars) {
    setState(() {
      _selected = selectedCalendars.first;
    });
  }

  void _handleOnDateChange(DateTime selectedDate) {
    setState(() {
      _focusDate = selectedDate;
      _calendarTitle = _getCalendarTitle();
    });
  }

  void _handleGoToCurrentDate() {
    if (_selected == Calendar.day) {
      setState(() {
        _focusDate = DateTime.now();
        _calendarTitle = _getCalendarTitle();
        _dateTimelineController.animateToCurrentData();
      });
    }
  }

  String _getDateTimeString(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _getCalendarTitle() {
    String selectedDate = _getDateTimeString(_focusDate);
    String currentDate = _getDateTimeString(DateTime.now());
    if (selectedDate == currentDate) {
      return 'Today';
    }
    return selectedDate;
  }

  Widget getSelectedCalendarView() {
    switch (_selected) {
      case Calendar.day:
        return HomeDayView(
          calendarTitle: _calendarTitle,
          focusDate: _focusDate,
          onDateChange: _handleOnDateChange,
          onPressCalendar: _handleGoToCurrentDate,
          controller: _homeViewController,
          dateTimelineController: _dateTimelineController,
        );
      case Calendar.week:
        return HomeWeekView(
          focusDate: _focusDate,
          onDateChange: _handleOnDateChange,
          onPressCalendar: () {},
          controller: _homeViewController,
        );
      case Calendar.month:
        return HomeMonthView(
          controller: _homeViewController,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                const Spacer(),
                CalendarSegmentWidget(
                  selected: _selected,
                  onPress: _handleSegmentChange,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        body: getSelectedCalendarView(),
        floatingActionButton: FloatingActionButton.small(
          heroTag: "btn1",
          onPressed: () {},
          backgroundColor: context.primary,
          foregroundColor: context.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
