import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  // 选中的日期集合，格式: "月-日"，如 "1-15"
  final Set<String> _selectedDates = {};

  //获取1到12月
  List<String> getMonths() {
    return List.generate(12, (index) => '${index + 1}月');
  }

  // 获取指定月份的天数列表（1-based month: 1~12）
  List<int> getDaysInMonth(int month) {
    final now = DateTime.now();
    final year = now.year;
    // 构造当月第一天，再获取下月第一天，差值即为本月天数
    final firstDay = DateTime(year, month, 1);
    final nextMonth = month == 12
        ? DateTime(year + 1, 1, 1)
        : DateTime(year, month + 1, 1);
    final daysCount = nextMonth.difference(firstDay).inDays;
    return List.generate(daysCount, (i) => i + 1);
  }

  // 获取月份第一天是星期几（1=周一，7=周日）
  int getFirstWeekday(int month) {
    final now = DateTime.now();
    final year = now.year;
    final firstDay = DateTime(year, month, 1);
    // 转换为周一开始（1=周一，7=周日）
    return firstDay.weekday == 7 ? 0 : firstDay.weekday;
  }

  // 获取月份需要显示的日期列表（包含空白）
  List<int?> getDaysWithBlanks(int month) {
    final days = getDaysInMonth(month);
    final firstWeekday = getFirstWeekday(month);
    final result = <int?>[];
    
    // 添加前面的空白
    for (int i = 0; i < firstWeekday; i++) {
      result.add(null);
    }
    
    // 添加日期
    result.addAll(days);
    
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0x8BC7C7C7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x21918264),
            offset: Offset(0, 5),
            blurRadius: 3.7,
          ),
        ],
      ),
      child: Center(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: getMonths().length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            final month = getMonths()[index];
            final monthNumber = index + 1;
            //本月的日（包含空白）
            final daysWithBlanks = getDaysWithBlanks(monthNumber);
            
            return Padding(
              padding: EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 2),child: Text(
                    month,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),),
                  SizedBox(
                    height: 70,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: daysWithBlanks.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        childAspectRatio: 1.0,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                      ),
                      itemBuilder: (BuildContext context, int dayIndex) {
                        final day = daysWithBlanks[dayIndex];
                        if (day == null) {
                          return Container();
                        }
                        return _buildDayCell(monthNumber, day);
                      },
                    ),  
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // 检查日期是否是连续选中区间的起点
  bool _isStartOfContinuousRange(int month, int day) {
    final dateKey = '$month-$day';
    if (!_selectedDates.contains(dateKey)) {
      return false;
    }
    
    // 检查前一个日期是否也被选中
    if (day > 1) {
      final prevDateKey = '$month-${day - 1}';
      if (_selectedDates.contains(prevDateKey)) {
        // 前一个日期也被选中，说明这不是起点
        return false;
      }
    }
    
    // 前一个日期没有被选中，或者这是第一天，说明这是起点
    return true;
  }

  Widget _buildDayCell(int month, int day) {
    final dateKey = '$month-$day';
    final isSelected = _selectedDates.contains(dateKey);
    final showStar = isSelected && _isStartOfContinuousRange(month, day);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedDates.remove(dateKey);
          } else {
            _selectedDates.add(dateKey);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(
          color: isSelected
              ? Color(0xFFD1A481)
              : Colors.transparent,
        ),
        child: Center(
          child: showStar
              ? Icon(
                  Icons.star,
                  size: 8,
                  color: Color(0xFFFFD700),
                  shadows: [
                    Shadow(
                      color: Color(0xFF000000),
                      offset: Offset(0, 0),
                    )
                  ]
                )
              : Text(
                  '$day',
                  style: TextStyle(
                    fontSize: 5,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
        ),
      ),
    );
  }
}
