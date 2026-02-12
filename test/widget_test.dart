import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:herplus_app/main.dart';

void main() {
  testWidgets('Main page navigates to AI chat page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(MyApp.aiChat), findsOneWidget);

    await tester.tap(find.text(MyApp.aiChat));
    await tester.pumpAndSettle();

    expect(find.text('HerPlus AI'), findsOneWidget);
    expect(find.text('\u8d76\u5de5\u671f'), findsOneWidget);
    expect(find.text('\u53d1\u9001'), findsOneWidget);
  });

  testWidgets('Main page navigates to goal settings page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(MyApp.goalSettings), findsOneWidget);

    await tester.tap(find.text(MyApp.goalSettings));
    await tester.pumpAndSettle();

    expect(find.text(MyApp.goalSettings), findsOneWidget);
    expect(find.text('\u6b65\u6570\u76ee\u6807'), findsOneWidget);
    expect(find.text('\u5361\u8def\u91cc\u76ee\u6807'), findsOneWidget);
    expect(find.text('\u7ad9\u7acb/\u6d3b\u52a8'), findsOneWidget);
    expect(find.text('\u4fdd\u5b58'), findsOneWidget);
  });

  testWidgets('Main page navigates to gender cognition page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(MyApp.genderCognition), findsOneWidget);

    await tester.tap(find.text(MyApp.genderCognition));
    await tester.pumpAndSettle();

    expect(find.text(MyApp.genderCognition), findsOneWidget);
    expect(find.text('HerPlus 致力于解读女性独有的生理语言。'), findsOneWidget);
    expect(find.text('女性'), findsOneWidget);
    expect(find.text('不确定'), findsOneWidget);
  });

  testWidgets('Main page navigates to tracking intent page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(MyApp.trackingIntent), findsOneWidget);

    await tester.tap(find.text(MyApp.trackingIntent));
    await tester.pumpAndSettle();

    expect(find.text(MyApp.trackingIntent), findsOneWidget);
    expect(find.text('愿意完整追踪'), findsOneWidget);
    expect(find.text('先轻量追踪'), findsOneWidget);
  });

  testWidgets('Main page navigates to cycle details page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(MyApp.cycleDetails), findsOneWidget);

    await tester.tap(find.text(MyApp.cycleDetails));
    await tester.pumpAndSettle();

    expect(find.text('周期是身体内在的潮汐'), findsOneWidget);
    expect(find.text('是, HerPlus 请帮我记录'), findsOneWidget);
    expect(find.text('暂时不要'), findsOneWidget);
  });

  testWidgets('Main page navigates to firmware upgrade page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(MyApp.firmwareUpgrade), findsOneWidget);

    await tester.tap(find.text(MyApp.firmwareUpgrade));
    await tester.pumpAndSettle();

    expect(find.text('\u6b63\u5728\u5347\u7ea7\u4e2d...'), findsOneWidget);
    expect(find.text('\u5f53\u524d\u7248\u672c'), findsOneWidget);
    expect(find.text('\u6700\u65b0\u7248\u672c'), findsOneWidget);
    expect(find.text('\u8bbe\u5907\u5347\u7ea7\u4e2d....'), findsOneWidget);
  });

  testWidgets('Main page navigates to data privacy page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(MyApp.dataPrivacy), findsOneWidget);

    await tester.tap(find.text(MyApp.dataPrivacy));
    await tester.pumpAndSettle();

    expect(find.text(MyApp.dataPrivacy), findsOneWidget);
    expect(find.text('PDF \u62a5\u544a'), findsOneWidget);
    expect(find.text('CSV \u539f\u59cb\u6570\u636e'), findsOneWidget);
  });

  testWidgets('Main page can scroll to last item', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.scrollUntilVisible(
      find.text('\u4e13\u5bb6\u8be6\u60c5\u9875'),
      300,
      scrollable: find.byType(Scrollable),
    );

    expect(find.text('\u4e13\u5bb6\u8be6\u60c5\u9875'), findsOneWidget);
  });
}
