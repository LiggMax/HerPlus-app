import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:herplus_app/project_details.dart';
import 'package:herplus_app/system_settings.dart';

import 'ai_chat.dart';
import 'algorithm_calibration.dart';
import 'breathing_exercises.dart';
import 'data_privacy.dart';
import 'device_manager.dart';
import 'expert_details.dart';
import 'firmware_upgrade.dart';
import 'goal_settings.dart';
import 'her_plus_event_details.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String dataPrivacy = '数据与隐私';
  static const String firmwareUpgrade = '固件升级';
  static const String aiChat = 'AI聊天';
  static const String goalSettings = '目标设置';
  static const String genderCognition = '性别认知';
  static const String trackingIntent = '追踪意愿';
  static const String cycleDetails = '周期详情';
  static const String bodyData = '身体数据';
  static const String privacyCommitment = '隐私承诺';
  static const String breathingExercisesPage = '呼吸练习';
  static const String systemSettingsPage = '系统设置';
  static const String deviceManager = '设备管家';
  static const String projectDetails = '项目详情';
  static const String expertDetails = '专家详情页';
  static const String algorithmCalibration = '算法校准';
  static const String herPlusEventDetails = 'HerPlus Event Details';

  static const List<String> pageTitles = [
    dataPrivacy,
    firmwareUpgrade,
    aiChat,
    goalSettings,
    genderCognition,
    trackingIntent,
    cycleDetails,
    bodyData,
    privacyCommitment,
    '查找设备',
    breathingExercisesPage,
    systemSettingsPage,
    deviceManager,
    projectDetails,
    expertDetails,
    algorithmCalibration,
    herPlusEventDetails
  ];

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  Widget _buildPageByTitle(String title) {
    if (title == MyApp.dataPrivacy) {
      return const DataPrivacyPage();
    }
    if (title == MyApp.firmwareUpgrade) {
      return const FirmwareUpgradePage();
    }
    if (title == MyApp.aiChat) {
      return const AiChatPage();
    }
    if (title == MyApp.goalSettings) {
      return const GoalSettingsPage();
    }
    if (title == MyApp.genderCognition) {
      return const _CycleAndBodyDataContainer(initialPage: 0);
    }
    if (title == MyApp.trackingIntent) {
      return const _CycleAndBodyDataContainer(initialPage: 1,);
    }
    if (title == MyApp.cycleDetails) {
      return const _CycleAndBodyDataContainer(initialPage: 2);
    }
    if (title == MyApp.bodyData) {
      return const _CycleAndBodyDataContainer(initialPage: 3);
    }
    if (title == MyApp.privacyCommitment) {
      return const _CycleAndBodyDataContainer(initialPage: 4);
    }
    if (title == MyApp.breathingExercisesPage) {
      return const BreathingExercisesPage();
    }
    if (title == MyApp.systemSettingsPage) {
      return const SystemSettingsPage();
    }
    if (title == MyApp.deviceManager) {
      return const DeviceManagerPage();
    }
    if(title == MyApp.projectDetails) {
      return const ProjectDetailPage();
    }
    if (title == MyApp.expertDetails) {
      return const ExpertDetailsPage();
    }
    if(title == MyApp.algorithmCalibration) {
      return const AlgorithmCalibrationPage();
    }
    if (title == MyApp.herPlusEventDetails) {}
    return HerPlusEventDetailsPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemCount: MyApp.pageTitles.length,
          itemBuilder: (context, index) {
            final title = MyApp.pageTitles[index];
            return TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0x0A000000),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Color(0x14FFFFFF), width: 1),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => _buildPageByTitle(title),
                  ),
                );
              },
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  height: 1.3,
                  shadows: [
                    Shadow(
                      color: Color(0x66000000),
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class UiPage extends StatelessWidget {
  const UiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class GenderCognitionPage extends StatefulWidget {
  const GenderCognitionPage({super.key});

  @override
  State<GenderCognitionPage> createState() => _GenderCognitionPageState();
}

class _GenderCognitionPageState extends State<GenderCognitionPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final bottomInset = MediaQuery.of(context).viewPadding.bottom;

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
                        'assets/images/gender_cognition/gc_bg_main.png',
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
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: screenWidth,
                    height: 430,
                    child: IgnorePointer(
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.68, 1.0],
                          colors: [
                            Colors.white,
                            Colors.white,
                            Colors.transparent,
                          ],
                        ).createShader(bounds),
                        blendMode: BlendMode.dstIn,
                        child: Opacity(
                          opacity: 0.86,
                          child: ClipRect(
                            child: Transform.rotate(
                              angle: math.pi,
                              child: SizedBox.expand(
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    heightFactor: 0.41908744,
                                    child: Image.asset(
                                      'assets/images/gender_cognition/gc_bg_top.png',
                                      width: 400,
                                      height: 957,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: contentWidth,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        topInset,
                        0,
                        16 + bottomInset,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    color: index == 0? Colors.black : Colors.white60,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 61),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: leftInset,
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'HerPlus 致力于解读女性独有的生理语言。',
                                  style: TextStyle(
                                    fontSize: 28,
                                    height: 1.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  '为了精准捕捉您身体的每一次细微波动，HerPlus 需要确认您的生理基础。',
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 60),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: leftInset,
                            ),
                            child: Column(
                              children: [
                                _GenderOptionButton(
                                  text: '女性',
                                  icon: Icons.female,
                                  isSelected: selectedIndex == 0,
                                  onTap: () =>
                                      setState(() => selectedIndex = 0),
                                ),
                                const SizedBox(height: 16),
                                _GenderOptionButton(
                                  text: '不确定',
                                  icon: Icons.help_outline_rounded,
                                  isSelected: selectedIndex == 1,
                                  onTap: () =>
                                      setState(() => selectedIndex = 1),
                                ),
                              ],
                            ),
                          ),
                        ],
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

class _GenderOptionButton extends StatelessWidget {
  const _GenderOptionButton({
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: isSelected
                ? [const Color(0xCC000000), const Color(0xCC373F34)]
                : [const Color(0xA6000000), const Color(0xA6373F34)],
          ),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.6),
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
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                height: 1.17,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrackingIntentPage extends StatefulWidget {
  const TrackingIntentPage({super.key});

  @override
  State<TrackingIntentPage> createState() => _TrackingIntentPageState();
}

class _TrackingIntentPageState extends State<TrackingIntentPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final bottomInset = MediaQuery.of(context).viewPadding.bottom;

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
                        'assets/images/tracking_intent/ti_bg_main.png',
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
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: screenWidth,
                    height: 430,
                    child: IgnorePointer(
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.68, 1.0],
                          colors: [
                            Colors.white,
                            Colors.white,
                            Colors.transparent,
                          ],
                        ).createShader(bounds),
                        blendMode: BlendMode.dstIn,
                        child: Opacity(
                          opacity: 0.86,
                          child: ClipRect(
                            child: Transform.rotate(
                              angle: math.pi,
                              child: SizedBox.expand(
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    heightFactor: 0.41908744,
                                    child: Image.asset(
                                      'assets/images/tracking_intent/ti_bg_top.png',
                                      width: 400,
                                      height: 957,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: contentWidth,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        topInset,
                        0,
                        16 + bottomInset,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _TrackingNavBar(
                            onBack: () => Navigator.of(context).pop(),
                          ),
                          const SizedBox(height: 45),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: leftInset,
                            ),
                            child: const _TrackingStepper(),
                          ),
                          const SizedBox(height: 61),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: leftInset,
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '我们会根据你的追踪意愿，定制健康记录与提醒节奏。',
                                  style: TextStyle(
                                    fontSize: 28,
                                    height: 1.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  '你可以选择轻量追踪或完整追踪，后续也可在设置中随时调整。',
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 60),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: leftInset,
                            ),
                            child: Column(
                              children: [
                                _TrackingOptionButton(
                                  text: '愿意完整追踪',
                                  icon: Icons.check_circle_outline,
                                  isSelected: selectedIndex == 0,
                                  onTap: () =>
                                      setState(() => selectedIndex = 0),
                                ),
                                const SizedBox(height: 16),
                                _TrackingOptionButton(
                                  text: '先轻量追踪',
                                  icon: Icons.radio_button_unchecked,
                                  isSelected: selectedIndex == 1,
                                  onTap: () =>
                                      setState(() => selectedIndex = 1),
                                ),
                              ],
                            ),
                          ),
                        ],
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

class _TrackingNavBar extends StatelessWidget {
  const _TrackingNavBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: onBack,
              borderRadius: BorderRadius.circular(22),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    'assets/images/tracking_intent/ti_icon_back.png',
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              MyApp.trackingIntent,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackingStepper extends StatelessWidget {
  const _TrackingStepper();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6,
      child: Row(
        children: const [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(99)),
                color: Color(0x33000000),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                gradient: LinearGradient(
                  colors: [Color(0xCC000000), Color(0xCC373F34)],
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(99)),
                color: Color(0x33000000),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(99)),
                color: Color(0x33000000),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(99)),
                color: Color(0x33000000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackingOptionButton extends StatelessWidget {
  const _TrackingOptionButton({
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: isSelected
                ? [const Color(0xCC000000), const Color(0xCC373F34)]
                : [const Color(0xA6000000), const Color(0xA6373F34)],
          ),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.6),
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
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                height: 1.17,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CycleAndBodyDataContainer extends StatefulWidget {
  final int initialPage;

  const _CycleAndBodyDataContainer({this.initialPage = 0});

  @override
  State<_CycleAndBodyDataContainer> createState() =>
      _CycleAndBodyDataContainerState();
}

class _CycleAndBodyDataContainerState
    extends State<_CycleAndBodyDataContainer> {
  late final PageController _pageController;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [GenderCognitionPage(),CycleDetailsPage(),CycleDetails(), _BodyDataPage(),PrivacyCommitmentPage()],
    );
  }
}

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

class _BodyDataPage extends StatelessWidget {
  const _BodyDataPage({super.key});

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

class PrivacyCommitmentPage extends StatelessWidget {
  const PrivacyCommitmentPage({super.key});

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
                                      color: index == 4? Colors.black : Colors.white60,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'HerPlus',
                                  style: TextStyle(
                                    fontSize: 28,
                                    height: 1.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                                Text(
                                  '视您的隐私为珍宝',
                                  style: TextStyle(
                                    fontSize: 28,
                                    height: 1.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Column(
                              children: [
                                Text('我们坚持数据透明。以下是 HerPlus 将为您守护的核心数据及用途'),
                                const SizedBox(height: 5),
                                Text('HerPlus 郑重承诺：采用 AES-256 银行级加密，您的数据所有权永远属于您'),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2D302D).withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x21918264).withValues(alpha: 0.8),
                                    offset: const Offset(0, 5),
                                    blurRadius: 3.7,
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.white10,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.assignment,
                                      color: Colors.green,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          '生理健康数据',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            height: 1.2,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'HerPlus 记录您的心率、体温与经期，只为读懂身体起伏，预警潜在压力',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white.withValues(
                                              alpha: 0.7,
                                            ),
                                            height: 1.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2D302D).withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x21918264).withValues(alpha: 0.8),
                                    offset: const Offset(0, 5),
                                    blurRadius: 3.7,
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.white10,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.assignment,
                                      color: Colors.green,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          '生活方式数据',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            height: 1.2,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'HerPlus 关注您的睡眠质量与步数，为您定制焕新方案，让身心回归自然',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white.withValues(
                                              alpha: 0.7,
                                            ),
                                            height: 1.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xFF2D302D).withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x21918264).withValues(alpha: 0.8),
                                    offset: const Offset(0, 5),
                                    blurRadius: 3.7,
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.white10,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.assignment,
                                      color: Colors.green,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          '生理健康数据',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            height: 1.2,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          '加密存储您的身高、体重与大致位置，仅用于蓝牙连接、算法校准与 Guardian 安全共享（仅触发时实时发送、不落库），绝不外泄。',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white.withValues(
                                              alpha: 0.7,
                                            ),
                                            height: 1.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
                                '开始HerPlus旅程',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TermsView()
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

class TermsView extends StatefulWidget {
  const TermsView({super.key});

  @override
  State<TermsView> createState() => _TermsViewState();
}

class _TermsViewState extends State<TermsView> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          activeColor: Colors.blue,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(text: '我已阅读并同意 '),
                TextSpan(
                  text: '《隐私协议》',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print('隐私协议被点击'),
                ),
                TextSpan(text: ' '),
                TextSpan(
                  text: '《使用条款》',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print('使用条款被点击'),
                ),
              ],
            ),
          ),
        ),
      ],
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

class CycleDetailsPage extends StatelessWidget {
  const CycleDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final bottomInset = MediaQuery.of(context).viewPadding.bottom;

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
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: screenWidth,
                    height: 430,
                    child: IgnorePointer(
                      child: ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.68, 1.0],
                          colors: [
                            Colors.white,
                            Colors.white,
                            Colors.transparent,
                          ],
                        ).createShader(bounds),
                        blendMode: BlendMode.dstIn,
                        child: Opacity(
                          opacity: 0.86,
                          child: ClipRect(
                            child: Transform.rotate(
                              angle: math.pi,
                              child: SizedBox.expand(
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    heightFactor: 0.41908744,
                                    child: Image.asset(
                                      'assets/images/cycle_details/cd_bg_top.png',
                                      width: 400,
                                      height: 957,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: contentWidth,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        topInset,
                        0,
                        16 + bottomInset,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    color: index == 1? Colors.black : Colors.white60,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 61),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: leftInset,
                            ),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '周期是身体内在的潮汐',
                                  style: TextStyle(
                                    fontSize: 38,
                                    height: 1.25,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  '您愿意让 HerPlus 协助您记录生理周期，寻找情绪与能量的共同点？',
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: leftInset,
                            ),
                            child: const _CyclePrimaryButton(),
                          ),
                          const SizedBox(height: 16),
                          const Center(
                            child: Text(
                              '暂时不要',
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.17,
                                fontWeight: FontWeight.w500,
                                color: Color(0x99333333),
                              ),
                            ),
                          ),
                        ],
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

class _CycleNavBar extends StatelessWidget {
  const _CycleNavBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: onBack,
          borderRadius: BorderRadius.circular(22),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 10, 10),
            child: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                'assets/images/cycle_details/cd_icon_back.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CycleStepper extends StatelessWidget {
  const _CycleStepper();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6,
      child: Row(
        children: const [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(99)),
                color: Color(0x33FFFFFF),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                gradient: LinearGradient(
                  colors: [Color(0xCC2D302D), Color(0xCC565D50)],
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(99)),
                color: Color(0x33000000),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(99)),
                color: Color(0x33000000),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(99)),
                color: Color(0x33000000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CyclePrimaryButton extends StatelessWidget {
  const _CyclePrimaryButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xCC000000), Color(0xCC373F34)],
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.6),
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
      child: const Text(
        '是，HerPlus 请帮我记录',
        style: TextStyle(
          fontSize: 16,
          height: 1.17,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
