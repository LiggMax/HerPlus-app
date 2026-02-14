
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BodyDataPage extends StatelessWidget {
  const BodyDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: Scaffold(
        // appBar: AppBar(),
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final contentWidth = screenWidth < 375 ? screenWidth : 375.0;
            final leftInset = (contentWidth - 319) / 2;
            return Stack(
              fit: StackFit.expand,
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/cycle_details/cd_bg_main.png',
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.34, 0.72, 1.0],
                      colors: [
                        Color(0x14FFFFFF),
                        Color(0x0FECE8D7),
                        Color(0x22E4DFC5),
                        Color(0x2ED7D2B4),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: leftInset),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    width: 50,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: index == 3? Colors.black : Colors.white60,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              '建立您的能量基石',
                              style: TextStyle(
                                fontSize: 28,
                                height: 1.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF333333),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Text('HerPlus 结合您的基础数据，才能精准计算每一次心跳带来的能量消耗'),
                            const SizedBox(height: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('出生日期'),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    _VerticalPicker(
                                      values: List.generate(
                                        100,
                                            (index) => 1950 + index,
                                      ),
                                      initialValue: 1993,
                                      suffix: '年',
                                    ),
                                    _VerticalPicker(
                                      values: List.generate(12, (index) => index + 1),
                                      initialValue: 11,
                                      suffix: '月',
                                    ),
                                    _VerticalPicker(
                                      values: List.generate(31, (index) => index + 1),
                                      initialValue: 30,
                                      suffix: '日',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            _RulerPicker(
                              label: '身高',
                              unit: 'cm',
                              minValue: 100,
                              maxValue: 220,
                              initialValue: 165,
                            ),
                            const SizedBox(height: 10),
                            _RulerPicker(
                              label: '体重',
                              unit: 'kg',
                              minValue: 40,
                              maxValue: 200,
                              initialValue: 65,
                            ),
                            Spacer(),
                            Container(
                              height: 50,
                              width: 350,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xCC000000),
                                    const Color(0xCC373F34),
                                  ],
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x40000000),
                                    blurRadius: 18.1,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Text(
                                '下一步',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _VerticalPicker extends StatefulWidget {
  final List<int> values;
  final int initialValue;
  final String suffix;
  final ValueChanged<int>? onChanged;

  const _VerticalPicker({
    required this.values,
    required this.initialValue,
    required this.suffix,
    this.onChanged,
  });

  @override
  State<_VerticalPicker> createState() => _VerticalPickerState();
}

class _VerticalPickerState extends State<_VerticalPicker> {
  late final ScrollController _scrollController;
  late int _selectedValue;
  static const double _itemHeight = 40.0;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
    final index = widget.values.indexOf(_selectedValue);
    _scrollController = ScrollController(
      initialScrollOffset: index * _itemHeight,
    );
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final index = (offset / _itemHeight).round().clamp(
      0,
      widget.values.length - 1,
    );
    final newValue = widget.values[index];
    if (newValue != _selectedValue) {
      setState(() => _selectedValue = newValue);
      widget.onChanged?.call(newValue);
    }
  }

  void _snapToNearestItem() {
    final offset = _scrollController.offset;
    final index = (offset / _itemHeight)
        .round()
        .clamp(0, widget.values.length - 1);
    final targetOffset = index * _itemHeight;
    if ((offset - targetOffset).abs() > 0.5) {
      _scrollController.animateTo(
        targetOffset,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0x63FFFFFF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          NotificationListener<ScrollEndNotification>(
            onNotification: (notification) {
              _snapToNearestItem();
              return true;
            },
            child: ListView.builder(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                vertical: (50 - _itemHeight) / 2,
              ),
              itemCount: widget.values.length,
              itemExtent: _itemHeight,
              itemBuilder: (context, index) {
                final value = widget.values[index];
                final isSelected = value == _selectedValue;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          '$value',
                          style: TextStyle(
                            fontSize: isSelected ? 16 : 14,
                            fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                            color: isSelected
                                ? const Color(0xFF333333)
                                : const Color(0xFF999999),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                      child: Center(
                        child: Text(
                          widget.suffix,
                          style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class _RulerPicker extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final String unit;
  final String label;
  final ValueChanged<int>? onChanged;

  const _RulerPicker({
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    this.unit = '',
    this.label = '',
    this.onChanged,
  });

  @override
  State<_RulerPicker> createState() => _RulerPickerState();
}

class _RulerPickerState extends State<_RulerPicker> {
  late final ScrollController _scrollController;
  late int _currentValue;

  /// 每个最小刻度的宽度
  static const double _tickSpacing = 8.0;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
    _scrollController = ScrollController(
      initialScrollOffset: (_currentValue - widget.minValue) * _tickSpacing,
    );
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final value = (offset / _tickSpacing).round() + widget.minValue;
    final clamped = value.clamp(widget.minValue, widget.maxValue);
    if (clamped != _currentValue) {
      setState(() => _currentValue = clamped);
      widget.onChanged?.call(clamped);
    }
  }

  void _snapToValue() {
    final targetOffset = (_currentValue - widget.minValue) * _tickSpacing;
    _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final totalTicks = widget.maxValue - widget.minValue;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0x63FFFFFF),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE4E4E4), width: 1.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x21918264),
            offset: Offset(0, 5),
            blurRadius: 3.7,
          ),
        ],
      ),
      child: Column(
        children: [
          // 标签 + 数值
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '${widget.label} '),
                TextSpan(
                  text: '$_currentValue',
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(text: ' ${widget.unit}'),
              ],
              style: const TextStyle(fontSize: 14),
            ),
          ),
          // 刻度尺
          SizedBox(
            height: 100,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final viewWidth = constraints.maxWidth;
                final sidePadding = viewWidth / 2;
                return NotificationListener<ScrollEndNotification>(
                  onNotification: (notification) {
                    _snapToValue();
                    return true;
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: sidePadding),
                    itemCount: totalTicks + 1,
                    itemBuilder: (context, index) {
                      final value = widget.minValue + index;
                      final isMajor = value % 5 == 0;
                      final showLabel = value % 5 == 0;
                      final isCenter = value == _currentValue;
                      return SizedBox(
                        width: _tickSpacing,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: isCenter ? 2.5 : (isMajor ? 2 : 1),
                              height: isCenter ? 40 : (isMajor ? 30 : 22),
                              decoration: BoxDecoration(
                                color: isCenter
                                    ? Colors.deepPurple
                                    : Colors.black26,
                                borderRadius: isCenter
                                    ? BorderRadius.circular(2)
                                    : null,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                              child: showLabel
                                  ? SizedBox(
                                height: 12,
                                child: OverflowBox(
                                  maxWidth: 40,
                                  child: Text(
                                    '$value',
                                    style: TextStyle(
                                      fontSize: 9,
                                      color: const Color(0xFF999999),
                                      fontWeight: isCenter
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              )
                                  : null,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}