import 'package:flutter/material.dart';

class TabsView extends StatefulWidget {
  const TabsView({super.key});

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 36.5,
                width: 85,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _selectedIndex == 0
                      ? Colors.white
                      : Colors.black.withValues(alpha: 0.7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE0DA),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.grid_view_rounded,
                        size: 19,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    Text(
                      "全部",
                      style: TextStyle(
                        fontSize: 14,
                        color: _selectedIndex == 0 ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (_selectedIndex == 0)
                Center(
                  child: CustomPaint(
                    size: Size(10, 6),
                    painter: TrianglePainter(),
                  ),
                ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 1;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 36.5,
                width: 85,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _selectedIndex == 1
                      ? Colors.white
                      : Colors.black.withValues(alpha: 0.7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE0DA),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.grass,
                        size: 19,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    Text(
                      "助眠",
                      style: TextStyle(
                        fontSize: 14,
                        color: _selectedIndex == 1 ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (_selectedIndex == 1)
                Center(
                  child: CustomPaint(
                    size: Size(10, 6),
                    painter: TrianglePainter(),
                  ),
                ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 2;
            });
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 36.5,
                width: 85,
                margin: EdgeInsets.only(right: 8),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _selectedIndex == 2
                      ? Colors.white
                      : Colors.black.withValues(alpha: 0.7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE0DA),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.wallpaper,
                        size: 19,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    Text(
                      "减压",
                      style: TextStyle(
                        fontSize: 14,
                        color: _selectedIndex == 2
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (_selectedIndex == 2)
                Center(
                  child: CustomPaint(
                    size: Size(10, 6),
                    painter: TrianglePainter(),
                  ),
                ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 3;
            });
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 36.5,
                width: 85,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _selectedIndex == 3
                      ? Colors.white
                      : Colors.black.withValues(alpha: 0.7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE0DA),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.water_drop_outlined,
                        size: 19,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                    Text(
                      "经期",
                      style: TextStyle(
                        fontSize: 14,
                        color: _selectedIndex == 3 ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              if (_selectedIndex == 3)
                Center(
                  child: CustomPaint(
                    size: Size(10, 6),
                    painter: TrianglePainter(),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

// 绘制倒三角的Painter
class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
