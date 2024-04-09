import 'package:flutter/cupertino.dart';

class CustomWeightPicker extends StatefulWidget {
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
  final int? selectedWeight;
  const CustomWeightPicker({
    Key? key,
    required this.itemExtent,
    required this.onSelectedItemChanged,
    this.selectedWeight,
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
  State<CustomWeightPicker> createState() => _CustomWeightPickerState();
}

class _CustomWeightPickerState extends State<CustomWeightPicker> {
  late int _selectedWeight;
  late int _selectedWeightIndex;
  late final FixedExtentScrollController _weightcrollController;
  final List<int> _weights = List.generate(100, (index) => index + 1);

  @override
  void initState() {
    super.initState();
    _weightcrollController = FixedExtentScrollController();
    _initWeights();
  }

  void _initWeights() {
    _selectedWeight = widget.selectedWeight ?? 60;
    _selectedWeightIndex = _weights.indexOf(_selectedWeight);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollList(_weightcrollController, _selectedWeightIndex);
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
    _weightcrollController.dispose();
    super.dispose();
  }

  void _onSelectedItemChanged(int index) {
    _selectedWeight = _weights[index];
    _selectedWeightIndex = index;
    setState(() {});
    widget.onSelectedItemChanged(_selectedWeight);
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
          '${values[index]} kg',
          style: index == selectedValueIndex
              ? widget.selectedStyle
              : isDisabled(index)
                  ? widget.disabledStyle
                  : widget.unselectedStyle,
        ),
      ),
    );
  }

  Widget _weightSelector() {
    return _selector(
      values: _weights,
      selectedValueIndex: _selectedWeightIndex,
      scrollController: _weightcrollController,
      isDisabled: (index) => false,
      onSelectedItemChanged: (v) => _onSelectedItemChanged(v),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _weightSelector()),
      ],
    );
  }
}
