import 'package:flutter/cupertino.dart';

class CustomHeightPicker extends StatefulWidget {
  final double itemExtent;
  final Widget selectionOverlay;
  final double diameterRatio;
  final Color? backgroundColor;
  final double offAxisFraction;
  final bool useMaginifier;
  final double magnification;
  final double squeeze;
  final void Function(int) onSelectedItemChanged; // Text style of selected item
  final TextStyle? selectedStyle; // Text style of unselected item
  final TextStyle? unselectedStyle; // Text style of disabled item
  final TextStyle? disabledStyle; // Minimum selectable date
  final int? selectedHeight;
  const CustomHeightPicker({
    Key? key,
    required this.itemExtent,
    required this.onSelectedItemChanged,
    this.selectedHeight,
    this.selectedStyle,
    this.unselectedStyle,
    this.disabledStyle,
    this.backgroundColor,
    this.squeeze = 1.45,
    this.diameterRatio = 1.1,
    this.magnification = 1.0,
    this.offAxisFraction = 0.0,
    this.useMaginifier = false,
    this.selectionOverlay = const CupertinoPickerDefaultSelectionOverlay(),
  }) : super(key: key);
  @override
  State<CustomHeightPicker> createState() => _CustomHeightPickerState();
}

class _CustomHeightPickerState extends State<CustomHeightPicker> {
  late int _selectedHeight;
  late int _selectedHeightIndex;
  late final FixedExtentScrollController _heightScrollController;
  final List<int> _heights = List.generate(100, (index) => index + 100);

  @override
  void initState() {
    super.initState();
    _heightScrollController = FixedExtentScrollController();
    _initHeights();
  }

  void _initHeights() {
    _selectedHeight = widget.selectedHeight ?? 150;
    _selectedHeightIndex = _heights.indexOf(_selectedHeight);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollList(_heightScrollController, _selectedHeightIndex);
    });
  }

  void _scrollList(FixedExtentScrollController controller, int index) {
    controller.animateToItem(
      index,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _heightScrollController.dispose();
    super.dispose();
  }

  void _onSelectedItemChanged(int index) {
    _selectedHeight = _heights[index];
    _selectedHeightIndex = index;
    setState(() {});
    widget.onSelectedItemChanged(_selectedHeight);
  }

  Widget _selector({
    required List<dynamic> values,
    required int selectedValueIndex,
    required bool Function(int) isDisabled,
    required void Function(int) onSelectedItemChanged,
    required FixedExtentScrollController scrollController,
  }) {
    return CupertinoPicker.builder(
      childCount: values.length,
      squeeze: widget.squeeze,
      itemExtent: widget.itemExtent,
      scrollController: scrollController,
      useMagnifier: widget.useMaginifier,
      diameterRatio: widget.diameterRatio,
      magnification: widget.magnification,
      backgroundColor: widget.backgroundColor,
      offAxisFraction: widget.offAxisFraction,
      selectionOverlay: widget.selectionOverlay,
      onSelectedItemChanged: onSelectedItemChanged,
      itemBuilder: (context, index) => Container(
        height: widget.itemExtent,
        alignment: Alignment.center,
        child: Text(
          '${values[index]} cm',
          style: index == selectedValueIndex
              ? widget.selectedStyle
              : isDisabled(index)
                  ? widget.disabledStyle
                  : widget.unselectedStyle,
        ),
      ),
    );
  }

  Widget _heightSelector() {
    return _selector(
      values: _heights,
      selectedValueIndex: _selectedHeightIndex,
      scrollController: _heightScrollController,
      isDisabled: (index) => false,
      onSelectedItemChanged: (v) => _onSelectedItemChanged(v),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _heightSelector()),
      ],
    );
  }
}
