import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:meal_prep/views/home/controller/home_view_controller.dart';
import 'package:meal_prep/views/home/view/home_day_view.dart';

enum Calendar { day, week, month }

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewController _homeViewController = HomeViewController();
  String _calendarTitle = 'Today';
  DateTime _focusDate = DateTime.now();
  final EasyInfiniteDateTimelineController _dateTimelineController =
      EasyInfiniteDateTimelineController();

  void _handleOnDateChange(DateTime selectedDate) {
    setState(() {
      _focusDate = selectedDate;
      _calendarTitle = _getCalendarTitle();
    });
  }

  void _handleGoToCurrentDate() {
    setState(() {
      _focusDate = DateTime.now();
      _calendarTitle = _getCalendarTitle();
      _dateTimelineController.animateToCurrentData();
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeDayView(
          calendarTitle: _calendarTitle,
          focusDate: _focusDate,
          onDateChange: _handleOnDateChange,
          onPressCalendar: _handleGoToCurrentDate,
          controller: _homeViewController,
          dateTimelineController: _dateTimelineController,
        ),
      ),
    );
  }
}
