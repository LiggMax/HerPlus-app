import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: buildContent(),
    );
  }

  buildContent() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle("每日处方流"),
            buildBanner(),
            buildTitle("专家阵容流"),
            SizedBox(height: 10),
            buildTabs(),
            buildExperts(),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 16),
                Image.asset("assets/images/ai_box.png", width: 30, height: 30),
                buildTitle("AI 周期信箱"),
              ],
            ),
            buildBox(),
          ],
        ),
      ),
    );
  }

  buildBanner() {
    return Container(
      height: 220,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 34),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/banner.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("3分钟盒子呼吸法", style: TextStyle(color: Colors.white, fontSize: 20)),
          Row(
            children: [
              Image.asset("assets/images/doctor.png", width: 24, height: 24),
              SizedBox(width: 6),
              Text("李医生·睡眠专家", style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color(0xFF0E0E0E).withAlpha(125),
            ),
            child: Text(
              "助眠/减压/经期/专注/营养/亲密关系",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  buildTitle(String title) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment(-0.19, -2), // ~11 degrees offset
          end: Alignment(0.19, 0.5),
          colors: [Color(0xFF2A2A2A), Color(0xFFB69383)],
        ).createShader(Offset.zero & bounds.size);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Required for ShaderMask to show colors
            ),
          ),
        ],
      ),
    );
  }

  buildTabs() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 16),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 8),
            height: 42,
            width: 85,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/all.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 8,
                  right: 16,
                  child: Text("全部", style: TextStyle(fontSize: 14)),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
          child: Container(
            height: 36.5,
            width: 85,
            margin: EdgeInsets.only(right: 8),

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sleep_tab.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 8,
                  right: 16,
                  child: Text(
                    "助眠",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
          child: Container(
            height: 36.5,
            width: 85,
            margin: EdgeInsets.only(right: 8),

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/stress_tab.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 8,
                  right: 16,
                  child: Text(
                    "减压",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
          child: Container(
            height: 36.5,
            margin: EdgeInsets.only(right: 8),
            width: 85,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/time_tab.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 8,
                  right: 16,
                  child: Text(
                    "经期",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  buildExperts() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 16),
          Container(
            margin: EdgeInsets.only(right: 8),
            padding: EdgeInsets.all(20),
            height: 181,
            width: 127,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/expert_1.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("名字", style: TextStyle(color: Colors.white, fontSize: 18)),
                Text(
                  "专业领域",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            height: 181,
            width: 127,
            margin: EdgeInsets.only(right: 8),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/expert_2.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("名字", style: TextStyle(color: Colors.white, fontSize: 18)),
                Text(
                  "专业领域",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            height: 181,
            width: 127,
            margin: EdgeInsets.only(right: 8),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/expert_2.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("名字", style: TextStyle(color: Colors.white, fontSize: 18)),
                Text(
                  "专业领域",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildBox() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/box_into.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
