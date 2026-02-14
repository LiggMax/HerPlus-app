import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

class StressPage extends StatelessWidget {
  const StressPage({super.key});

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
                        SizedBox(width: 16),
                        buildTabs(context),
                      ],
                    ),
                    SizedBox(height: 15),

                    buildPannelGrids(),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            buildLineChart(),
          ],
        ),
      ),
    );
  }

  buildTabs(BuildContext context) {
    return CustomSlidingSegmentedControl<int>(
      fixedWidth: 90,
      height: 40,
      initialValue: 0,
      children: {
        0: Text('日', style: TextStyle(color: Colors.white, fontSize: 16)),
        1: Text('月', style: TextStyle(color: Colors.white, fontSize: 16)),
        2: Text('年', style: TextStyle(color: Colors.white, fontSize: 16)),
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

  buildPannelGrids() {
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: buildPannelGridItem(
                bgImage: 'assets/images/bg_1.png',
                title: '步数',
                unit: '步',
                data: '8567',
                labelPath: 'assets/images/label1.png',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: buildPannelGridItem(
                bgImage: 'assets/images/drop_bg.png',
                title: '心率',
                unit: '次/分',
                data: '78',
                labelPath: 'assets/images/label2.png',
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: buildPannelGridItem(
                bgImage: 'assets/images/breath_bg.png',
                title: '呼吸',
                unit: '次/分',
                data: '18',
                labelPath: 'assets/images/label3.png',
              ),
            ),
            SizedBox(width: 12),

            Expanded(
              child: buildPannelGridItem(
                bgImage: 'assets/images/tem_bg.png',
                title: '体温',
                unit: '℃',
                data: '36.5',
                labelPath: 'assets/images/label4.png',
              ),
            ),
          ],
        ),
      ],
    );
  }

  buildPannelGridItem({
    required String bgImage,
    required String title,
    String? unit,
    String? data,
    required labelPath,
  }) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bgImage), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data ?? '',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(title, style: TextStyle(fontSize: 13, color: Colors.white)),
          Image.asset(labelPath, width: 40, height: 19),
        ],
      ),
    );
  }

  buildLineChart() {
    return Container(
      height: 700,
      padding: EdgeInsets.symmetric(vertical: 22.5, horizontal: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/list_bg.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        children: [
          Row(children: [Text("🤧 压力分析", style: TextStyle(fontSize: 16))]),

          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg5.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),

                  child: Row(
                    children: [
                      SizedBox(width: 64),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("今日平均压力"),
                          Row(
                            children: [
                              Text("42"),
                              SizedBox(width: 2),

                              Image.asset(
                                "assets/images/label2.png",
                                width: 40,
                                height: 19,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 70,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg6.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 64),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("HRV"),
                          Row(children: [Text("58"), Text("ms")]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Image.asset(
            'assets/images/fake_line.png',
            height: 222,
            width: double.infinity,
          ),

          Row(children: [Text("📝 情绪气象记录", style: TextStyle(fontSize: 16))]),
          Image.asset(
            'assets/images/fake_line2.png',
            height: 222,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
