
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          '设备升级中....',
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

class _FirmwareUpdateCard extends StatelessWidget {
  const _FirmwareUpdateCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '更新内容',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 16),
              Text('·提升心率稳定性'),
              Text('·修复链接指环后出现的设备发热以及部分手机出现不兼容的情况'),
              Text('·优化睡眠分期'),
              Text('·修复连接中断'),
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
          _FirmwareVersionRow(label: '当前版本', value: 'v2.24'),
          Divider(height: 1, thickness: 1, color: Color(0x0D000000)),
          _FirmwareVersionRow(label: '最新版本', value: 'v3.12'),
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

class _FirmwareProgressCard extends StatelessWidget {
  const _FirmwareProgressCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 70,
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
                  '正在升级中...',
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
                      '预计:',
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
          Positioned(
            left: 89,
            top: 91,
            child: Image.asset(
              'assets/images/cycle_details/group.png',
              width: 192,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
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