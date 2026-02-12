import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BreathingExercisesPage extends StatefulWidget {
  const BreathingExercisesPage({super.key});

  @override
  State<BreathingExercisesPage> createState() =>
      _BreathingExercisesPageState();
}

class _BreathingExercisesPageState extends State<BreathingExercisesPage>
    with SingleTickerProviderStateMixin {
  // ── 呼吸配置 ──
  static const int _inhaleSeconds = 4;
  static const int _exhaleSeconds = 4;
  static const int _totalCycles = 10;
  static const int _totalSeconds = 150; // 2:30

  late AnimationController _breathController;
  late Animation<double> _scaleAnimation;

  int _remainingSeconds = _totalSeconds;
  int _phaseCountdown = _inhaleSeconds;
  int _completedCycles = 0;
  bool _isInhaling = true;
  bool _isRunning = false;
  Timer? _totalTimer;
  Timer? _phaseTimer;

  // ── 生命周期 ──
  @override
  void initState() {
    super.initState();

    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: _inhaleSeconds),
      reverseDuration: const Duration(seconds: _exhaleSeconds),
    );

    _scaleAnimation = Tween<double>(begin: 0.72, end: 1.0).animate(
      CurvedAnimation(parent: _breathController, curve: Curves.easeInOut),
    );

    _breathController.addStatusListener(_onAnimationStatus);
    _startExercise();
  }

  @override
  void dispose() {
    _isRunning = false;
    _totalTimer?.cancel();
    _phaseTimer?.cancel();
    _breathController.removeStatusListener(_onAnimationStatus);
    _breathController.dispose();
    super.dispose();
  }

  // ── 呼吸控制逻辑 ──
  void _startExercise() {
    _isRunning = true;
    _isInhaling = true;
    _phaseCountdown = _inhaleSeconds;
    _breathController.forward();
    HapticFeedback.lightImpact();

    _totalTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _finishExercise();
        }
      });
    });

    _startPhaseCountdown();
  }

  void _onAnimationStatus(AnimationStatus status) {
    if (!_isRunning || !mounted) return;

    if (status == AnimationStatus.completed) {
      // 吸气结束 → 呼气
      HapticFeedback.lightImpact();
      setState(() {
        _isInhaling = false;
        _phaseCountdown = _exhaleSeconds;
      });
      _startPhaseCountdown();
      _breathController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      // 呼气结束 → 下一个周期
      HapticFeedback.lightImpact();
      setState(() {
        _completedCycles++;
        if (_completedCycles >= _totalCycles || _remainingSeconds <= 0) {
          _finishExercise();
          return;
        }
        _isInhaling = true;
        _phaseCountdown = _inhaleSeconds;
      });
      if (_isRunning) {
        _startPhaseCountdown();
        _breathController.forward();
      }
    }
  }

  void _startPhaseCountdown() {
    _phaseTimer?.cancel();
    _phaseTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_phaseCountdown > 1) {
          _phaseCountdown--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _finishExercise() {
    _isRunning = false;
    _totalTimer?.cancel();
    _phaseTimer?.cancel();
    _breathController.stop();
  }

  void _cancelExercise() {
    _isRunning = false;
    _totalTimer?.cancel();
    _phaseTimer?.cancel();
    _breathController.stop();
    if (mounted) Navigator.of(context).pop();
  }

  String _formatTime(int totalSeconds) {
    final m = totalSeconds ~/ 60;
    final s = totalSeconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

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
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: Stack(
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
            // ── 内容 ──
            SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 450),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        _buildTopBar(),
                        const Spacer(flex: 2),
                        _buildBreathingCircle(),
                        const Spacer(flex: 2),
                        _buildTimerSection(),
                        const SizedBox(height: 20),
                        _buildProgressDots(),
                        const Spacer(flex: 3),
                        _buildCancelButton(),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: _cancelExercise,
                borderRadius: BorderRadius.circular(24),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                ),
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                '呼吸练习',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
            ),
          ),
          const SizedBox(width: 48), // 占位保持标题居中
        ],
      ),
    );
  }

  Widget _buildBreathingCircle() {
    const double maxSize = 210.0;
    const double areaSize = maxSize + 130;

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        final scale = _scaleAnimation.value;
        final circleSize = maxSize * scale;

        return SizedBox(
          width: areaSize,
          height: areaSize,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                ...List.generate(4, (i) {
                  final ringSize = circleSize + (i + 1) * 28.0;
                  final opacity = (0.15 - i * 0.03).clamp(0.03, 0.15);
                  return Container(
                    width: ringSize,
                    height: ringSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromRGBO(212, 168, 85, opacity),
                        width: 1.0,
                      ),
                    ),
                  );
                }),

                Container(
                  width: circleSize + 60,
                  height: circleSize + 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(232, 192, 106, 0.4 * scale),
                        blurRadius: 60,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                ),

                Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      center: Alignment(0.0, -0.15),
                      radius: 0.85,
                      colors: [
                        Color(0xFFF7DFA0), // 亮金
                        Color(0xFFEDC25E), // 中金
                        Color(0xFFD9A73D), // 深金
                      ],
                      stops: [0.0, 0.55, 1.0],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amberAccent.withValues(alpha: 0.8),
                        blurRadius: 35,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_phaseCountdown}s',
                        style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF5C3F1A),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _isInhaling ? '吸气' : '呼气',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF7A5A2C),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ── 计时 & 提示文字 ──
  Widget _buildTimerSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _formatTime(_remainingSeconds),
          style: const TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          '跟随节奏，慢慢放松',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFFC08B2D),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          '每个节拍轻振动提示',
          style: TextStyle(fontSize: 13, color: Color(0xFF999999)),
        ),
      ],
    );
  }

  // ── 进度圆点 ──
  Widget _buildProgressDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_totalCycles, (index) {
        final isCompleted = index < _completedCycles;
        final isCurrent = index == _completedCycles;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3.5),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isCompleted
                ?  Colors.white
                : isCurrent
                    ?  Colors.white60
                    :  Colors.white38,
          ),
        );
      }),
    );
  }

  Widget _buildCancelButton() {
    return GestureDetector(
      onTap: _cancelExercise,
      child: Container(
        height: 50,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            colors: [Color(0xCC000000), Color(0xCC373F34)],
          ),
          border: Border.all(color: Colors.white, width: 1),
          boxShadow: const [
            BoxShadow(color: Color(0x40000000), blurRadius: 18.1),
          ],
        ),
        child: const Text(
          '取消练习',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
