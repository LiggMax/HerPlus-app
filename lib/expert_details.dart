import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpertDetailsPage extends StatelessWidget {
  const ExpertDetailsPage({super.key});

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
            final screenHeight = constraints.maxHeight;
            final contentWidth = screenWidth < 375 ? screenWidth : 375.0;
            final spacerHeight = topInset + 280;

            return Stack(
              fit: StackFit.expand,
              children: [
                // ── Background image ──
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
                // ── Gradient overlay ──
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
                // ── Shader mask ──
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

                // ── Expert info at top (fixed) ──
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: contentWidth,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, topInset, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 48,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 48,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        onTap: Navigator.of(context).pop,
                                        borderRadius:
                                            BorderRadius.circular(24),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 48),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF00E676),
                                              Color(0xFF00BFA5),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xFF00BFA5)
                                                  .withOpacity(0.4),
                                              blurRadius: 12,
                                              offset: const Offset(0, 4),
                                              spreadRadius: 0,
                                            ),
                                            BoxShadow(
                                              color: const Color(0xFF00E676)
                                                  .withOpacity(0.2),
                                              blurRadius: 6,
                                              offset: const Offset(0, 2),
                                              spreadRadius: -1,
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 18,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.check,
                                                size: 12,
                                                color: Color(0xFF00BFA5),
                                              ),
                                            ),
                                            const SizedBox(width: 6),
                                            const Text(
                                              'AI 认证',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        'Dr,Zoe',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '临床心理医学博士',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(text: '已陪伴'),
                                            TextSpan(
                                              text: '12,403',
                                              style: TextStyle(
                                                color: Colors.deepPurple,
                                              ),
                                            ),
                                            TextSpan(text: '次练习'),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '关注女性焦虑与压力管理，主张温和的 CBT 疗法',
                                        style: TextStyle(
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Image.asset(
                                      'assets/images/ai_chat/ai_avatar.png',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // ── Scrollable content ──
                Positioned.fill(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Spacer to reveal expert info behind
                        SizedBox(height: spacerHeight),

                        // Main content container
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: screenHeight - spacerHeight,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: const Border(
                                top: BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '精选内容',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // ── Banner 1 ──
                                  InkWell(
                                    onTap: () {
                                      print('路由跳转');
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    child: SizedBox(
                                      height: 200,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20),
                                        child: Stack(
                                          children: [
                                            Positioned.fill(
                                              child: Image.asset(
                                                'assets/images/ai_chat/ai_banner_1.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin:
                                                        Alignment.topCenter,
                                                    end: Alignment
                                                        .bottomCenter,
                                                    colors: [
                                                      Colors.transparent,
                                                      Colors.black
                                                          .withOpacity(0.6),
                                                    ],
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '深度睡眠白噪音',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                          ),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          '00:15',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .white70,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration:
                                                          BoxDecoration(
                                                        color:
                                                            Colors.white24,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    50),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  // ── Banner row 1 ──
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: _buildSmallBanner(
                                          imagePath:
                                              'assets/images/ai_chat/ai_banner_2.png',
                                          title: '十分钟晨间焕新',
                                          subtitle: '00:05',
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: _buildSmallBanner(
                                          imagePath:
                                              'assets/images/ai_chat/ai_banner_3.png',
                                          title: '18种按摩手法',
                                          subtitle: '这是一种比较常见...',
                                          titleBold: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  // ── Banner row 2 ──
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: _buildSmallBanner(
                                          imagePath:
                                              'assets/images/ai_chat/ai_banner_4.png',
                                          title: '十分钟晨间焕新',
                                          subtitle: '00:05',
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: _buildSmallBanner(
                                          imagePath:
                                              'assets/images/ai_chat/ai_banner_5.png',
                                          title: '18种按摩手法',
                                          subtitle: '这是一种比较常见...',
                                          titleBold: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Bottom padding for input bar
                                  SizedBox(height: 80 + bottomInset),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Fixed input bar at bottom ──
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _BottomInputBar(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Small banner card builder
  static Widget _buildSmallBanner({
    required String imagePath,
    required String title,
    required String subtitle,
    bool titleBold = false,
  }) {
    return InkWell(
      onTap: () {
        print('路由跳转');
      },
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 120,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: titleBold
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2),
                            Text(
                              subtitle,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
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

/// Fixed input bar at the bottom
class _BottomInputBar extends StatefulWidget {
  @override
  State<_BottomInputBar> createState() => _BottomInputBarState();
}

class _BottomInputBarState extends State<_BottomInputBar> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewPadding.bottom;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 16,
            bottom: bottomInset + 16,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.2),
            border: Border(
              top: BorderSide(
                width: 1,
                color: Colors.white.withValues(alpha: 0.3),
              ),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: '向 Aura 提问..',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    final text = _textController.text.trim();
                    if (text.isNotEmpty) {
                      print('发送消息: $text');
                      _textController.clear();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        width: 1,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4A90E2), Color(0xFF50C8B8)],
                      ),
                    ),
                    child: const Text(
                      '发送',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
