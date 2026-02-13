
import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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