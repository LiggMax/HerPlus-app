
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CycleDetails extends StatelessWidget {
  const CycleDetails({super.key});

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
                                      color: index == 2? Colors.black : Colors.white60,
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
                              '建立您的专属周期模型',
                              style: TextStyle(
                                fontSize: 28,
                                height: 1.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF333333),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Text('HerPlus 将根据您的历史数据，为您预测下一次能量的高峰与低谷'),
                            const SizedBox(height: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('通常，你的经期会持续几天'),
                                const SizedBox(height: 8),
                                _FixedNumberSelector(
                                  values: const [3, 4, 5, 6, 7],
                                  initialValue: 5,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('两次的访问之间，通常间隔几天？'),
                                const SizedBox(height: 8),
                                _FixedNumberSelector(
                                  values: const [15, 16, 17, 18, 19],
                                  initialValue: 17,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('上一次经期是什么时候开始的'),
                                const SizedBox(height: 8),
                                GridCalendar(),
                              ],
                            ),
                            const SizedBox(height: 15),
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


class _FixedNumberSelector extends StatefulWidget {
  final List<int> values;
  final int initialValue;
  final ValueChanged<int>? onChanged;

  const _FixedNumberSelector({
    required this.values,
    required this.initialValue,
    this.onChanged,
  });

  @override
  State<_FixedNumberSelector> createState() => _FixedNumberSelectorState();
}

class _FixedNumberSelectorState extends State<_FixedNumberSelector> {
  late int _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = widget.values.indexOf(_selectedValue);
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final itemWidth = totalWidth / widget.values.length;
        const double bgHeight = 38;
        const double indicatorHeight = 50;
        const double indicatorWidth = 50;
        const double totalHeight = indicatorHeight;
        const double bgTopOffset = (totalHeight - bgHeight) / 2;
        return SizedBox(
          height: totalHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: bgTopOffset,
                left: 0,
                right: 0,
                height: bgHeight,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0x63FFFFFF),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color(0xFFE4E4E4),
                      width: 1.0,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x21918264),
                        offset: Offset(0, 5),
                        blurRadius: 3.7,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: bgTopOffset,
                left: 0,
                right: 0,
                height: bgHeight,
                child: Row(
                  children: widget.values.map((value) {
                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => _selectedValue = value);
                          widget.onChanged?.call(value);
                        },
                        child: Center(
                          child: Text(
                            '$value',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF888888),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              // 上层：选中指示器（上下溢出背景容器）
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                left:
                selectedIndex * itemWidth +
                    (itemWidth - indicatorWidth) / 2,
                top: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: indicatorWidth,
                    height: indicatorHeight,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white70.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white, width: 1.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x21918264),
                          offset: Offset(0, 5),
                          blurRadius: 3.7,
                        ),
                      ],
                    ),
                    child: Text(
                      '$_selectedValue',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


class GridCalendar extends StatefulWidget {
  const GridCalendar({super.key});

  @override
  State<GridCalendar> createState() => _GridCalendarState();
}

class _GridCalendarState extends State<GridCalendar> {
  DateTime currentMonth = DateTime.now();
  DateTime? selectedDay;

  /// 获取当月第一天
  DateTime get firstDayOfMonth =>
      DateTime(currentMonth.year, currentMonth.month, 1);

  int get daysInMonth =>
      DateTime(currentMonth.year, currentMonth.month + 1, 0).day;

  /// 当月1号是星期几 (1=周一 7=周日)
  int get startWeekday => firstDayOfMonth.weekday;

  /// 生成日历数据（包含前面补空）
  List<DateTime?> get calendarDays {
    final List<DateTime?> list = [];

    // 前面补空位
    for (int i = 1; i < startWeekday; i++) {
      list.add(null);
    }

    // 本月日期
    for (int i = 1; i <= daysInMonth; i++) {
      list.add(DateTime(currentMonth.year, currentMonth.month, i));
    }

    return list;
  }

  void previousMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
    });
  }

  void nextMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    });
  }

  bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) return false;
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0x63FFFFFF),
          borderRadius: BorderRadius.circular(30),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => previousMonth(),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0x63FFFFFF),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color(0xFFE4E4E4),
                          width: 1.0,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x21918264),
                            offset: Offset(0, 5),
                            blurRadius: 3.7,
                          ),
                        ],
                      ),
                      child: Icon(Icons.chevron_left),
                    ),
                  ),
                  Text(
                    "${currentMonth.month}月",
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => nextMonth(),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: const Color(0x63FFFFFF),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color(0xFFE4E4E4),
                          width: 1.0,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x21918264),
                            offset: Offset(0, 5),
                            blurRadius: 3.7,
                          ),
                        ],
                      ),
                      child: Icon(Icons.chevron_right),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250, // 固定高度：5行 × 40px
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 35, // 固定35个格子（5行 × 7列）
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final day = index < calendarDays.length
                      ? calendarDays[index]
                      : null;

                  if (day == null) return const SizedBox();

                  final selected = isSameDay(day, selectedDay);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDay = day;
                      });
                    },
                    child: Center(
                      child: Container(
                        padding: selected
                            ? const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        )
                            : null,
                        decoration: selected
                            ? BoxDecoration(
                          color: const Color(
                            0xFFE9A19A,
                          ).withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(20),
                        )
                            : null,
                        child: selected
                            ? Icon(Icons.star, size: 18, color: Colors.amber)
                            : Text(
                          "${day.day}",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}