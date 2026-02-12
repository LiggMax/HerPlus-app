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
            buildTitle("每日处方流"),
            buildTabs(),
            buildExperts(),
            Row(
              children: [
                SizedBox(width: 16),
                Image.asset("assets/images/ai_box.png", width: 30, height: 30),
                buildTitle("每日处方流"),
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/banner.png"),
          fit: BoxFit.fill,
        ),
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
        Container(
          margin: EdgeInsets.only(right: 8),
          height: 42,
          width: 85,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/all.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 36.5,
          width: 85,
          margin: EdgeInsets.only(right: 8),

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/sleep_tab.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 36.5,
          width: 85,
          margin: EdgeInsets.only(right: 8),

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/stress_tab.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          height: 36.5,
          margin: EdgeInsets.only(right: 8),
          width: 85,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/time_tab.png"),
              fit: BoxFit.fill,
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
            height: 181,
            width: 127,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/expert_1.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: 181,
            width: 127,
            margin: EdgeInsets.only(right: 8),

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/expert_2.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            height: 181,
            width: 127,
            margin: EdgeInsets.only(right: 8),

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/expert_3.png"),
                fit: BoxFit.fill,
              ),
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
