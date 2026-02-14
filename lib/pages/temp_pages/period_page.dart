import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class PeriodPage extends StatefulWidget {
  const PeriodPage({super.key});

  @override
  State<PeriodPage> createState() => _PeriodPageState();
}

class _PeriodPageState extends State<PeriodPage> {
  final Set<String> _selectedSymptoms = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                // fit: BoxFit.contain,
                fit: BoxFit.cover,
              ),
            ),
          ),
          buildContent(context),
        ],
      ),
    );
  }

  buildContent(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 32),
                        buildTabs(context),
                      ],
                    ),
                    SizedBox(height: 15),

                    Image.asset(
                      'assets/images/fake2_1.png',
                      height: 195,
                      fit: BoxFit.fitWidth,

                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(height: 20),

                    Container(
                      height: 820,
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/list3.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "🌡 基础温度曲线",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),

                          Image.asset(
                            'assets/images/fake2_2.png',
                            height: 206,
                            fit: BoxFit.fitWidth,

                            width: MediaQuery.of(context).size.width,
                          ),
                          Image.asset(
                            'assets/images/fake2_3.png',
                            height: 106,
                            fit: BoxFit.fitWidth,

                            width: MediaQuery.of(context).size.width,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '我的症状',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF4ECDC4),
                                          Color(0xFF9FD8B0),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Text(
                                          '记录',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  children: [
                                    _card('🤒', '发烧'),
                                    _card('🤕', '头疼'),
                                    _card('🍽️', '食欲好'),
                                    _card('😴', '犯困'),
                                    _card('😩', '乏力疲倦'),
                                    _card('🤢', '反胃'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "🗓 年年周历",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/fake2_5.png'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            height: 432,
                            child: Image.asset(
                              'assets/images/fake2_4.png',
                              height: 408,
                              fit: BoxFit.fitWidth,

                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(String icon, String title) {
    final isSelected = _selectedSymptoms.contains(title);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedSymptoms.remove(title);
          } else {
            _selectedSymptoms.add(title);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        margin: EdgeInsets.only(right: 8, top: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4ECDC4) : const Color(0x63FFFFFF),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(icon, style: TextStyle(fontSize: 10)),
            SizedBox(width: 6),
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? Colors.white : null,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTabs(BuildContext context) {
    return CustomSlidingSegmentedControl<int>(
      fixedWidth: 125,
      height: 40,
      initialValue: 0,
      children: {
        0: Text('周期', style: TextStyle(color: Colors.white, fontSize: 16)),
        1: Text('年', style: TextStyle(color: Colors.white, fontSize: 16)),
      },
      innerPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/tab_bg.png'),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.white.withAlpha(180),
            BlendMode.srcATop,
          ),
        ),
      ),
      thumbDecoration: BoxDecoration(
        color: Color(0x3B000000).withOpacity(0.23),
        borderRadius: BorderRadius.circular(100),
      ),
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
      onValueChanged: (v) {
        print(v);
      },
    );
  }
}
