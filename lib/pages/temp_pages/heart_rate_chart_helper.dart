import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HeartRateSegment {
  final List<FlSpot> spots;
  final bool isBelowThreshold;

  HeartRateSegment({required this.spots, required this.isBelowThreshold});
}

class HeartRateChartHelper {
  /// 根据阈值将心率数据分段
  /// [data] 原始数据点（必须按 x 升序排列）
  /// [threshold] 阈值，默认 80
  static List<HeartRateSegment> splitByThreshold(
    List<FlSpot> data, {
    double threshold = 80,
  }) {
    if (data.isEmpty) return [];

    List<HeartRateSegment> segments = [];
    List<FlSpot> currentSpots = [];
    bool currentBelow = data.first.y < threshold;

    for (int i = 0; i < data.length; i++) {
      final spot = data[i];
      final isBelow = spot.y < threshold;

      if (i == 0) {
        currentSpots.add(spot);
        continue;
      }

      if (isBelow != currentBelow) {
        // 跨越阈值，计算交叉点
        final prev = data[i - 1];
        final crossX = _interpolateX(prev, spot, threshold);
        final crossSpot = FlSpot(crossX, threshold);

        // 结束当前段（加上交叉点）
        currentSpots.add(crossSpot);
        segments.add(
          HeartRateSegment(
            spots: List.from(currentSpots),
            isBelowThreshold: currentBelow,
          ),
        );

        // 开始新段（从交叉点开始）
        currentSpots = [crossSpot, spot];
        currentBelow = isBelow;
      } else {
        currentSpots.add(spot);
      }
    }

    // 添加最后一段
    if (currentSpots.isNotEmpty) {
      segments.add(
        HeartRateSegment(spots: currentSpots, isBelowThreshold: currentBelow),
      );
    }

    return segments;
  }

  /// 线性插值计算交叉点的 x 坐标
  static double _interpolateX(FlSpot a, FlSpot b, double threshold) {
    if (b.y == a.y) return a.x;
    final t = (threshold - a.y) / (b.y - a.y);
    return a.x + t * (b.x - a.x);
  }

  /// 生成 LineChartBarData 列表
  /// [data] 原始数据点
  /// [threshold] 阈值，默认 80
  /// [belowColor] 低于阈值的线段颜色
  /// [aboveColor] 高于等于阈值的线段颜色
  static List<LineChartBarData> buildSegmentedLineBars(
    List<FlSpot> data, {
    double threshold = 80,
    Color belowColor = const Color(0xFFFF8F41),
    Color aboveColor = Colors.white,
  }) {
    final segments = splitByThreshold(data, threshold: threshold);

    return segments.map((segment) {
      final color = segment.isBelowThreshold ? belowColor : aboveColor;
      return LineChartBarData(
        spots: segment.spots,
        isCurved: true,
        preventCurveOverShooting: true,
        color: color,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              color.withOpacity(0.4),
              color.withOpacity(0.1),
              Colors.transparent,
            ],
          ),
        ),
      );
    }).toList();
  }
}
