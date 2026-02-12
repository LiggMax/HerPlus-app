import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  static const List<String> pageTitles = [
    dataPrivacy,
    firmwareUpgrade,
    aiChat,
    goalSettings,
    genderCognition,
    trackingIntent,
    cycleDetails,
    bodyData,
    '隐私承诺',
    '查找设备',
    '呼吸练习',
    '系统设置',
    '设备管家',
    '项目详情',
    '专家详情页',
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
      return const GenderCognitionPage();
    }
    if (title == MyApp.trackingIntent) {
      return const TrackingIntentPage();
    }
    if (title == MyApp.cycleDetails) {
      return const CycleDetails();
    }
    if (title == MyApp.bodyData) {
      return const _BodyDataPage();
    }
    return const BlankPage();
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

class DataPrivacyPage extends StatefulWidget {
  const DataPrivacyPage({super.key});

  @override
  State<DataPrivacyPage> createState() => _DataPrivacyPageState();
}

class _DataPrivacyPageState extends State<DataPrivacyPage> {
  bool firstToggle = true;
  bool secondToggle = true;
  bool thirdToggle = false;

  static const Color cardFill = Color(0x63FFFFFF);
  static const Color dividerColor = Color(0x0D000000);
  static const Color shadowColor = Color(0x21918264);

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;
    final bottomInset = MediaQuery.of(context).viewPadding.bottom;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
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

            return Stack(
              fit: StackFit.expand,
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/data_privacy/dp_bg_main.png',
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
                          child: _buildTopTextureOverlay(),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: contentWidth,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(
                        16,
                        topInset + 6,
                        16,
                        24 + bottomInset,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildNavBar(context),
                          const SizedBox(height: 16),
                          _buildToggleCard(),
                          const SizedBox(height: 16),
                          _buildFileCards(),
                          const SizedBox(height: 16),
                          _buildActionsCard(),
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

  Widget _buildTopTextureOverlay() {
    return ClipRect(
      child: Transform.rotate(
        angle: math.pi,
        child: SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.fill,
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.41908744,
              child: Image.asset(
                'assets/images/data_privacy/dp_bg_top.png',
                width: 400,
                height: 957,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              borderRadius: BorderRadius.circular(22),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    'assets/images/data_privacy/dp_icon_back.png',
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              MyApp.dataPrivacy,
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

  Widget _buildToggleCard() {
    return Container(
      decoration: _cardDecoration,
      child: Column(
        children: [
          _ToggleRow(
            iconAsset: 'assets/images/data_privacy/dp_icon_brain.png',
            text: ' REM ',
            value: firstToggle,
            showDivider: true,
            onTap: () => setState(() => firstToggle = !firstToggle),
          ),
          _ToggleRow(
            iconAsset: 'assets/images/data_privacy/dp_icon_drop.png',
            text: '',
            value: secondToggle,
            showDivider: true,
            onTap: () => setState(() => secondToggle = !secondToggle),
          ),
          _ToggleRow(
            iconAsset: 'assets/images/data_privacy/dp_icon_sleep.png',
            text: ' REM  REM  REM  REM ',
            value: thirdToggle,
            showDivider: false,
            onTap: () => setState(() => thirdToggle = !thirdToggle),
            isMultiLine: true,
          ),
        ],
      ),
    );
  }

  Widget _buildFileCards() {
    return Row(
      children: const [
        Expanded(
          child: _FileCard(
            iconAsset: 'assets/images/data_privacy/dp_icon_pdf.png',
            title: 'PDF ',
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _FileCard(
            iconAsset: 'assets/images/data_privacy/dp_icon_csv.png',
            title: 'CSV ',
          ),
        ),
      ],
    );
  }

  Widget _buildActionsCard() {
    return Container(
      height: 118,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: _cardDecoration,
      child: Column(
        children: const [
          _ActionRow(
            iconAsset: 'assets/images/data_privacy/dp_icon_delete.png',
            title: 'AI',
            rightText: '',
          ),
          Divider(height: 1, thickness: 1, color: dividerColor),
          _ActionRow(
            iconAsset: 'assets/images/data_privacy/dp_icon_setting.png',
            title: '',
          ),
        ],
      ),
    );
  }

  BoxDecoration get _cardDecoration {
    return BoxDecoration(
      color: cardFill,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(color: shadowColor, offset: Offset(0, 5), blurRadius: 3.7),
      ],
    );
  }
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({
    required this.iconAsset,
    required this.text,
    required this.value,
    required this.showDivider,
    required this.onTap,
    this.isMultiLine = false,
  });

  final String iconAsset;
  final String text;
  final bool value;
  final bool showDivider;
  final VoidCallback onTap;
  final bool isMultiLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMultiLine ? 66 : 64,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        border: showDivider
            ? const Border(
                bottom: BorderSide(color: Color(0x0D000000), width: 1),
              )
            : null,
      ),
      child: Row(
        children: [
          SizedBox(width: 40, height: 40, child: Image.asset(iconAsset)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              maxLines: isMultiLine ? 2 : 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                fontWeight: FontWeight.w500,
                color: Color(0xFF333333),
              ),
            ),
          ),
          const SizedBox(width: 16),
          _FigmaToggle(value: value, onTap: onTap),
        ],
      ),
    );
  }
}

class _FigmaToggle extends StatelessWidget {
  const _FigmaToggle({required this.value, required this.onTap});

  final bool value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        height: 28,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: value ? const Color(0xFF34C759) : const Color(0x4D3C3C43),
        ),
        child: Stack(
          children: [
            if (value)
              const Positioned(
                left: 12,
                top: 9,
                child: SizedBox(
                  width: 1,
                  height: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
              ),
            Align(
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 39,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FileCard extends StatelessWidget {
  const _FileCard({required this.iconAsset, required this.title});

  final String iconAsset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0x63FFFFFF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x21918264),
            offset: Offset(0, 5),
            blurRadius: 3.7,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 32, height: 32, child: Image.asset(iconAsset)),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              height: 1.17,
              fontWeight: FontWeight.w500,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Expanded(
                child: _FileActionButton(label: '', color: Color(0x33000000)),
              ),
              SizedBox(width: 8),
              Expanded(
                child: _FileActionButton(label: '', color: Color(0x33004DFF)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FileActionButton extends StatelessWidget {
  const _FileActionButton({required this.label, required this.color});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          height: 1.17,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.iconAsset,
    required this.title,
    this.rightText,
  });

  final String iconAsset;
  final String title;
  final String? rightText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.5,
      child: Row(
        children: [
          SizedBox(width: 24, height: 24, child: Image.asset(iconAsset)),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              height: 1.17,
              fontWeight: FontWeight.w400,
              color: Color(0xFF333333),
            ),
          ),
          const Spacer(),
          if (rightText != null)
            Text(
              rightText!,
              style: const TextStyle(
                fontSize: 16,
                height: 1.17,
                fontWeight: FontWeight.w400,
                color: Color(0xFF999999),
              ),
            ),
          if (rightText != null) const SizedBox(width: 6),
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(
              'assets/images/data_privacy/dp_icon_chevron.png',
            ),
          ),
        ],
      ),
    );
  }
}

class FirmwareUpgradePage extends StatelessWidget {
  const FirmwareUpgradePage({super.key});

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

            return Stack(
              fit: StackFit.expand,
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/firmware_upgrade/fw_bg_main.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.32, 0.72, 1.0],
                      colors: [
                        Color(0x14FFFFFF),
                        Color(0x0FECE8D7),
                        Color(0x20E4DFC5),
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
                                      'assets/images/firmware_upgrade/fw_bg_top.png',
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
                    child: SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        topInset + 6,
                        0,
                        20 + bottomInset,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _FirmwareNavBar(
                            onBack: () => Navigator.of(context).pop(),
                          ),
                          const SizedBox(height: 44),
                          const _FirmwareHero(),
                          const SizedBox(height: 12),
                          const _FirmwareProgressCard(),
                          const SizedBox(height: 12),
                          const _FirmwareVersionCard(),
                          const SizedBox(height: 12),
                          const _FirmwareUpdateCard(),
                          const SizedBox(height: 12),
                          const _FirmwareBottomButton(),
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

class _FirmwareNavBar extends StatelessWidget {
  const _FirmwareNavBar({required this.onBack});

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
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    'assets/images/firmware_upgrade/fw_icon_back.png',
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              '',
              style: TextStyle(
                fontFamily: 'PingFang SC',
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

class _FirmwareHero extends StatelessWidget {
  const _FirmwareHero();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: Stack(
        children: [
          Positioned(
            left: -206,
            top: -260,
            child: Transform.rotate(
              angle: -0.287880219240389,
              child: Image.asset(
                'assets/images/firmware_upgrade/fw_glow.png',
                width: 536.7483,
                height: 607.4671,
              ),
            ),
          ),
          const Positioned(left: 89, top: 91, child: _FirmwarePedestal()),
          Positioned(
            left: 136,
            top: 0,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 13.6, sigmaY: 13.6),
              child: Image.asset(
                'assets/images/firmware_upgrade/fw_device.png',
                width: 101.266,
                height: 118.688,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            left: 136,
            top: 0,
            child: Image.asset(
              'assets/images/firmware_upgrade/fw_device.png',
              width: 101.266,
              height: 118.688,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 199,
            top: 146,
            child: SizedBox(
              width: 39,
              height: 29,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  _FirmwareProgressBubbleShape(),
                  const Center(
                    child: Text(
                      '58%',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FirmwarePedestal extends StatelessWidget {
  const _FirmwarePedestal();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 192,
      height: 150,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, -0.94),
                  radius: 1,
                  colors: const [Color(0xFFFFFFFF), Color(0x00FFFFFF)],
                  stops: const [0.21681936085224152, 0.9308355450630188],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 192,
              height: 44,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(96, 22)),
                gradient: RadialGradient(
                  center: Alignment(0, 0),
                  radius: 1,
                  colors: [Color(0xFFFAF7F0), Color(0xFFEAE7DE)],
                ),
              ),
            ),
          ),
          Positioned(
            left: 63,
            top: 24,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 3.1, sigmaY: 3.1),
              child: Opacity(
                opacity: 0.2,
                child: Container(
                  width: 66,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: Color(0xFF3E3F3C),
                    borderRadius: BorderRadius.all(Radius.elliptical(33, 3.5)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FirmwareProgressBubbleShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipPath(
        clipper: _BubbleClipper(),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFC7F0FF), Color(0xFF5ED4FF), Color(0xFFC7F0FF)],
              stops: [0, 0.538, 1],
            ),
            border: Border.all(color: const Color(0x80FFFFFF), width: 1),
            boxShadow: const [
              BoxShadow(
                color: Color(0x26368DFF),
                offset: Offset(0, 2.5419),
                blurRadius: 5.0838,
              ),
              BoxShadow(
                color: Color(0x215ED4FF),
                offset: Offset(0, 8.8967),
                blurRadius: 8.8967,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const radius = 9.0;
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - 8);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - radius,
      size.height,
    );
    path.lineTo(size.width / 2 + 5, size.height);
    path.lineTo(size.width / 2, size.height + 4);
    path.lineTo(size.width / 2 - 5, size.height);
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - 8);
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _FirmwareProgressCard extends StatelessWidget {
  const _FirmwareProgressCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 65,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: const Color(0x63FFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 319,
            height: 9,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.28),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                Container(
                  width: 195,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF54E3E5),
                        Color(0xFFFF9626),
                        Color(0xFFECB188),
                        Color(0xFFA85BE6),
                      ],
                      stops: [0, 0.327, 0.584, 1],
                    ),
                  ),
                ),
                Positioned(
                  left: 187,
                  top: 1,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Opacity(
                opacity: 0.8,
                child: Text(
                  '...',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              Row(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: Text(
                      ':',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.17,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '03:05',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.17,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFF82AF1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FirmwareVersionCard extends StatelessWidget {
  const _FirmwareVersionCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 118,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0x63FFFFFF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x21918264),
            offset: Offset(0, 5),
            blurRadius: 3.7,
          ),
        ],
      ),
      child: Column(
        children: const [
          _FirmwareVersionRow(label: '', value: 'v2.24'),
          Divider(height: 1, thickness: 1, color: Color(0x0D000000)),
          _FirmwareVersionRow(label: '', value: 'v3.12'),
        ],
      ),
    );
  }
}

class _FirmwareVersionRow extends StatelessWidget {
  const _FirmwareVersionRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.5,
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              height: 1.17,
              fontWeight: FontWeight.w400,
              color: Color(0xFF333333),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              height: 1.17,
              fontWeight: FontWeight.w400,
              color: Color(0xFF999999),
            ),
          ),
        ],
      ),
    );
  }
}

class _FirmwareUpdateCard extends StatelessWidget {
  const _FirmwareUpdateCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 185,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: const Color(0x63FFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 176,
            top: 135,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 44.5, sigmaY: 44.5),
              child: Opacity(
                opacity: 0.2,
                child: Container(
                  width: 243,
                  height: 51,
                  decoration: const BoxDecoration(
                    color: Color(0xFF84FFED),
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(121.5, 25.5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 12,
            top: 136,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 33.4, sigmaY: 33.4),
              child: Opacity(
                opacity: 0.2,
                child: Container(
                  width: 90,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFAEAF),
                    borderRadius: BorderRadius.all(Radius.elliptical(45, 25)),
                  ),
                ),
              ),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 16),
              Text(
                '\n'
                '\n'
                '\n'
                ' ',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FirmwareBottomButton extends StatelessWidget {
  const _FirmwareBottomButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 46,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.13),
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Opacity(
        opacity: 0.5,
        child: Text(
          '....',
          style: TextStyle(
            fontSize: 16,
            height: 1.17,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class AiChatPage extends StatelessWidget {
  const AiChatPage({super.key});

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
            final designWidth = screenWidth < 375 ? screenWidth : 375.0;
            final designLeft = (screenWidth - designWidth) / 2;
            final panelTop = topInset + 114;
            final panelHeight = math.max(
              698.0,
              constraints.maxHeight - panelTop + bottomInset,
            );

            return Stack(
              fit: StackFit.expand,
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.12253694, 0.34355118, 0.7346059, 1],
                      colors: [
                        Color(0xFFBBB6AF),
                        Color(0xFFD6CFBE),
                        Color(0xFFD1D2A8),
                        Color(0xFFC9C9BF),
                      ],
                    ),
                  ),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.45, 1.0],
                      colors: [
                        Color(0x14FFFFFF),
                        Color(0x06FFFFFF),
                        Color(0x26000000),
                      ],
                    ),
                  ),
                ),
                _AiTopBackground(
                  screenWidth: screenWidth,
                  designWidth: designWidth,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: screenWidth,
                    child: Stack(
                      children: [
                        Positioned(
                          left: designLeft + 12,
                          top: topInset + 54,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset(
                                'assets/images/ai_chat/ai_icon_back.png',
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: designLeft + 16,
                          top: topInset + 106,
                          child: const _AiProfileCard(),
                        ),
                        Positioned(
                          left: designLeft,
                          top: panelTop,
                          child: _AiGlassPanel(
                            width: designWidth,
                            height: panelHeight,
                            bottomInset: bottomInset,
                          ),
                        ),
                      ],
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

class _AiTopBackground extends StatelessWidget {
  const _AiTopBackground({
    required this.screenWidth,
    required this.designWidth,
  });

  final double screenWidth;
  final double designWidth;

  @override
  Widget build(BuildContext context) {
    final designLeft = (screenWidth - designWidth) / 2;
    return IgnorePointer(
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: screenWidth,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                width: screenWidth,
                height: 341,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: const Alignment(-0.95, -1.06),
                      radius: 0.9,
                      colors: const [Color(0xFF684F3F), Color(0xFF2D2825)],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                width: screenWidth,
                height: 341,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.54606598, 1],
                      colors: [Color(0xFFEBDFCF), Color(0xFFDDBA97)],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: designLeft + 184,
                top: 30,
                width: 216,
                height: 384,
                child: Image.asset(
                  'assets/images/ai_chat/ai_avatar.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              Positioned(
                left: designLeft - 153.75,
                top: -207,
                child: Transform.rotate(
                  angle: -0.287880219240389,
                  child: Image.asset(
                    'assets/images/ai_chat/ai_bg_glow.png',
                    width: 466.7234,
                    height: 528.2162,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                width: screenWidth,
                height: 376,
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
                            'assets/images/ai_chat/ai_bg_top.png',
                            width: 400,
                            height: 957,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: designLeft,
                top: 285,
                width: designWidth,
                height: 527,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0, 0.051, 0.808],
                      colors: [
                        const Color(0xFFE6DFCB).withValues(alpha: 0.6),
                        const Color(0xFFDCD9BD),
                        const Color(0xFFCACAC0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AiProfileCard extends StatelessWidget {
  const _AiProfileCard();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 147,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _AiBadge(),
          SizedBox(height: 8),
          Text(
            'Dr. Zoe',
            style: TextStyle(
              fontSize: 26,
              height: 1.17,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '',
            style: TextStyle(
              fontSize: 18,
              height: 1.17,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            ' 12,403',
            style: TextStyle(
              fontSize: 12,
              height: 1.17,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
          ),
          SizedBox(height: 8),
          Text(
            ' CBT ',
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _AiBadge extends StatelessWidget {
  const _AiBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 79,
      height: 22,
      padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF00E58D), Color(0xFF00C278)],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Opacity(
                opacity: 0.25,
                child: Image.asset(
                  'assets/images/ai_chat/ai_chip_noise.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.verified, size: 10, color: Colors.white),
                SizedBox(width: 1),
                Text(
                  ' AI ',
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AiGlassPanel extends StatelessWidget {
  const _AiGlassPanel({
    required this.width,
    required this.height,
    required this.bottomInset,
  });

  final double width;
  final double height;
  final double bottomInset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.fromLTRB(16, 12, 16, 22 + bottomInset),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.16),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0.9294, 1],
          colors: [
            const Color(0xFF2A3E38).withValues(alpha: 0.7),
            const Color(0xFF313A2A).withValues(alpha: 0.35),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 21.4, sigmaY: 21.4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _AiTopRow(),
              SizedBox(height: 12),
              _AiMessagesArea(),
              SizedBox(height: 12),
              _AiSuggestions(),
              SizedBox(height: 12),
              _AiInputBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AiTopRow extends StatelessWidget {
  const _AiTopRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '',
              style: TextStyle(
                fontSize: 20,
                height: 1.2,
                fontWeight: FontWeight.w600,
                foreground: Paint()
                  ..shader = LinearGradient(
                    colors: [Color(0xFFA0FF52), Color(0xFF1AFBFF)],
                  ).createShader(Rect.fromLTWH(0, 0, 20, 20)),
              ),
            ),
            SizedBox(width: 4),
            Text(
              'HerPlus AI',
              style: TextStyle(
                fontSize: 16,
                height: 1.17,
                fontWeight: FontWeight.w600,
                color: Color(0xFF00FF59),
              ),
            ),
          ],
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.39),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.close, size: 20, color: Colors.white),
        ),
      ],
    );
  }
}

class _AiMessagesArea extends StatelessWidget {
  const _AiMessagesArea();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343,
      height: 508,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: const [
          Positioned(
            left: 0,
            top: 12,
            child: _AiMsgLeft(text: '', width: 279, height: 56),
          ),
          Positioned(
            right: 0,
            top: 80,
            child: _AiMsgRight(text: '', width: 218, height: 40),
          ),
          Positioned(
            left: 0,
            top: 132,
            child: _AiMsgLeft(text: '', width: 245, height: 40),
          ),
          Positioned(
            right: 0,
            top: 184,
            child: _AiMsgRight(text: '', width: 176, height: 40),
          ),
          Positioned(left: 0, top: 129, right: 0, child: _AiContentHeader()),
          Positioned(left: 0, top: 160, child: _AiBannerLarge()),
          Positioned(left: 0, top: 365, width: 343, child: _AiBannerRowOne()),
        ],
      ),
    );
  }
}

class _AiMsgLeft extends StatelessWidget {
  const _AiMsgLeft({
    required this.text,
    required this.width,
    required this.height,
  });

  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.16),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            height: 1.17,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          maxLines: height >= 56 ? 2 : 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _AiMsgRight extends StatelessWidget {
  const _AiMsgRight({
    required this.text,
    required this.width,
    required this.height,
  });

  final String text;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
          color: Colors.white.withValues(alpha: 0.16),
          gradient: const LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            stops: [0.2836538553237915, 1],
            colors: [Color(0xB2313A2A), Color(0xB22A3E38)],
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            height: 1.17,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}

class _AiContentHeader extends StatelessWidget {
  const _AiContentHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          '',
          style: TextStyle(
            fontSize: 16,
            height: 1.17,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        Container(
          width: 79,
          height: 18,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: const FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('5', style: TextStyle(fontSize: 12, color: Colors.white)),
                SizedBox(width: 2),
                Text(
                  'min',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                SizedBox(width: 8),
                Text(
                  'average',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AiBannerLarge extends StatelessWidget {
  const _AiBannerLarge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: 193,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images/ai_chat/ai_banner_1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x00000000), Color(0xA6000000)],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(8, 149, 8, 8),
        child: Row(
          children: const [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '00:15',
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.play_circle_fill, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }
}

class _AiBannerRowOne extends StatelessWidget {
  const _AiBannerRowOne();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: _AiSmallCard(
            image: 'assets/images/ai_chat/ai_banner_2.png',
            title: '',
            subtitle: '00:05',
          ),
        ),
        SizedBox(width: 4),
        Expanded(
          child: _AiSmallCard(
            image: 'assets/images/ai_chat/ai_banner_3.png',
            title: '18',
            subtitle: '',
          ),
        ),
      ],
    );
  }
}

class _AiSmallCard extends StatelessWidget {
  const _AiSmallCard({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x00000000), Color(0xA6000000)],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(8, 121, 8, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                height: 1.17,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AiSuggestions extends StatelessWidget {
  const _AiSuggestions();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _AiSuggestionChip(text: ''),
        SizedBox(width: 12),
        _AiSuggestionChip(text: ''),
        SizedBox(width: 12),
        _AiSuggestionChip(text: ''),
      ],
    );
  }
}

class _AiSuggestionChip extends StatelessWidget {
  const _AiSuggestionChip({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          height: 1.17,
          fontWeight: FontWeight.w400,
          color: Color(0xFF5DE4FF),
        ),
      ),
    );
  }
}

class _AiInputBar extends StatelessWidget {
  const _AiInputBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.39),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x21918264),
            offset: Offset(0, 5),
            blurRadius: 3.7,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
            opacity: 0.5,
            child: Text(
              '',
              style: TextStyle(
                fontSize: 16,
                height: 1.17,
                fontWeight: FontWeight.w400,
                color: Colors.white.withValues(alpha: 1),
              ),
            ),
          ),
          Container(
            width: 60,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                begin: const Alignment(0.89, 0.05),
                end: const Alignment(-0.03, 1.05),
                stops: const [0, 0.538, 1],
                colors: [
                  const Color(0xFFC7F0FF).withValues(alpha: 0.4),
                  const Color(0xFF5ED4FF).withValues(alpha: 0.4),
                  const Color(0xFFC7F0FF).withValues(alpha: 0.4),
                ],
              ),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.6),
                width: 1,
              ),
            ),
            child: const Text(
              '',
              style: TextStyle(
                fontSize: 14,
                height: 1.17,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GoalSettingsPage extends StatelessWidget {
  const GoalSettingsPage({super.key});

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

            return Stack(
              fit: StackFit.expand,
              children: [
                const DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/goal_settings/gs_bg_main.png',
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
                                      'assets/images/goal_settings/gs_bg_top.png',
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
                        16,
                        topInset + 6,
                        16,
                        16 + bottomInset,
                      ),
                      child: Column(
                        children: [
                          _GoalNavBar(
                            onBack: () => Navigator.of(context).pop(),
                          ),
                          const SizedBox(height: 16),
                          const _GoalTargetCard(
                            title: '',
                            value: '10,000',
                            icon: Icons.directions_run,
                            iconColor: Color(0xFFFF4D7F),
                            iconBg: Color(0xFFFFE8EE),
                          ),
                          const SizedBox(height: 12),
                          const _GoalTargetCard(
                            title: '',
                            value: '2,500',
                            unit: 'kcal',
                            icon: Icons.local_fire_department,
                            iconColor: Color(0xFF91D824),
                            iconBg: Color(0xFFEFFEDE),
                          ),
                          const SizedBox(height: 12),
                          const _GoalTargetCard(
                            title: '/',
                            value: '12',
                            unit: '',
                            icon: Icons.access_time_filled,
                            iconColor: Color(0xFF3AA7FF),
                            iconBg: Color(0xFFE3F2FF),
                          ),
                          const Spacer(),
                          const _GoalSaveButton(),
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

class _GoalNavBar extends StatelessWidget {
  const _GoalNavBar({required this.onBack});

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
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    'assets/images/goal_settings/gs_icon_back.png',
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              MyApp.goalSettings,
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

class _GoalTargetCard extends StatelessWidget {
  const _GoalTargetCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    this.unit,
  });

  final String title;
  final String value;
  final String? unit;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 88),
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      decoration: BoxDecoration(
        color: const Color(0x63FFFFFF),
        borderRadius: BorderRadius.circular(16),
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
          Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: iconBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 11),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.17,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const _GoalAdjustButton(symbol: '-'),
              Expanded(
                child: Center(
                  child: unit == null
                      ? Text(
                          value,
                          style: const TextStyle(
                            fontSize: 40,
                            height: 0.95,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF333333),
                          ),
                        )
                      : RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: value,
                                style: const TextStyle(
                                  fontSize: 40,
                                  height: 0.95,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              TextSpan(
                                text: unit,
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.17,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB8B8B8),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              const _GoalAdjustButton(symbol: '+'),
            ],
          ),
        ],
      ),
    );
  }
}

class _GoalAdjustButton extends StatelessWidget {
  const _GoalAdjustButton({required this.symbol});

  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        symbol,
        style: const TextStyle(
          fontSize: 22,
          height: 1,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _GoalSaveButton extends StatelessWidget {
  const _GoalSaveButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.85),
          width: 2,
        ),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF1C1F1C), Color(0xFF5D6355)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x21918264),
            offset: Offset(0, 5),
            blurRadius: 3.7,
          ),
        ],
      ),
      child: const Text(
        '',
        style: TextStyle(
          fontSize: 16,
          height: 1.17,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
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
                          _GenderNavBar(
                            onBack: () => Navigator.of(context).pop(),
                          ),
                          const SizedBox(height: 45),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: leftInset,
                            ),
                            child: const _GenderStepper(),
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

class _GenderNavBar extends StatelessWidget {
  const _GenderNavBar({required this.onBack});

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
                    'assets/images/gender_cognition/gc_icon_back.png',
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              MyApp.genderCognition,
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

class _GenderStepper extends StatelessWidget {
  const _GenderStepper();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6,
      child: Row(
        children: const [
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
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: const Color(0x63FFFFFF),
                                        borderRadius: BorderRadius.circular(18),
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('1993'),
                                          Text(
                                            '年',
                                            style: TextStyle(
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 100,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: const Color(0x63FFFFFF),
                                        borderRadius: BorderRadius.circular(18),
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('11'),
                                          Text(
                                            '月',
                                            style: TextStyle(
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 100,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: const Color(0x63FFFFFF),
                                        borderRadius: BorderRadius.circular(18),
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('30'),
                                          Text(
                                            '日',
                                            style: TextStyle(
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0x63FFFFFF),
                                borderRadius: BorderRadius.circular(18),
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
                              child: _RulerPicker(
                                label: '身高',
                                unit: 'cm',
                                minValue: 100,
                                maxValue: 220,
                                initialValue: 165,
                              ),
                            ),
                            const SizedBox(height: 10),
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

    return Column(
      mainAxisSize: MainAxisSize.min,
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
        const SizedBox(height: 8),
        // 刻度尺
        SizedBox(
          height: 40,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final viewWidth = constraints.maxWidth;
              final sidePadding = viewWidth / 2;
              return Stack(
                children: [
                  // 滚动刻度
                  NotificationListener<ScrollEndNotification>(
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
                        return SizedBox(
                          width: _tickSpacing,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (showLabel)
                                SizedBox(
                                  height: 12,
                                  child: OverflowBox(
                                    maxWidth: 40,
                                    child: Text(
                                      '$value',
                                      style: const TextStyle(
                                        fontSize: 9,
                                        color: Color(0xFF999999),
                                      ),
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 2),
                              Container(
                                width: isMajor ? 1.5 : 0.8,
                                height: isMajor ? 18 : 10,
                                color: isMajor
                                    ? const Color(0xFF999999)
                                    : const Color(0xFFCCCCCC),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  // 中心指示线
                  Positioned(
                    left: viewWidth / 2 - 1,
                    bottom: 0,
                    child: Container(
                      width: 2.5,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: calendarDays.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final day = calendarDays[index];

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
                          _CycleNavBar(
                            onBack: () => Navigator.of(context).pop(),
                          ),
                          const SizedBox(height: 45),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: leftInset,
                            ),
                            child: const _CycleStepper(),
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
