import 'package:flutter/material.dart';
import 'package:herplus/core/utils/nav_utils.dart';
import 'package:herplus/pages/community/report/report_detail_page.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBody: true,
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
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
          buildContentBackground(),
          buildContent(),
        ],
      ),
    );
  }

  buildContentBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Image.asset("assets/images/light.png"),
          Image.asset("assets/images/dot_bg.png"),
        ],
      ),
    );
  }

  buildContent() {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          buildHead(),
          buildStep(),
          buildBadgeList(),
          Expanded(child: buildProjectList()),
        ],
      ),
    );
  }

  buildHead() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "我的影响力报告",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Spacer(),
              Image.asset("assets/images/avatar1.png", width: 60, height: 60),
            ],
          ),
        ],
      ),
    );
  }

  buildStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "150,000",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              Text("累计捐赠的步数", style: TextStyle(color: Color(0xFF333333))),
            ],
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  Text(
                    "\$",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  Text(
                    "15.0",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ],
              ),
              Text("USD 转化值", style: TextStyle(color: Color(0xFF333333))),
            ],
          ),
        ],
      ),
    );
  }

  buildBadgeList() {
    return SizedBox(
      height: 110,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 10),
            buildBadge(),
            SizedBox(width: 10),
            buildBadge(),
            SizedBox(width: 10),
            buildBadge(),
          ],
        ),
      ),
    );
  }

  buildBadge() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 154,
          height: 67,
          padding: EdgeInsets.only(left: 15, top: 15, bottom: 0, right: 15),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/coin_bg.png"),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "已帮助",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        LinearGradient(
                          colors: [Color(0xFFDBCA43), Color(0xFFF9FFE9)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "位",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
              Text(
                "女孩重返校园",
                style: TextStyle(
                  color: Colors.white.withAlpha(50),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -9,
          top: -20,
          child: Image.asset("assets/images/coin1.png", width: 58, height: 58),
        ),
      ],
    );
  }

  buildProjectList() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/list_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Active Projects", style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            buildProjectItem(),
            SizedBox(height: 16),
            buildProjectItem(),
          ],
        ),
      ),
    );
  }

  buildProjectItem() {
    return Container(
      width: double.infinity,
      height: 280,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/project_bg.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/images/project_badge.png", width: 93, height: 40),
          Container(
            height: 90,
            width: 328,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/detail_bg.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "肯尼亚经期贫困援助计划",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 12),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Stack(
                            children: [
                              Container(
                                height: 6,
                                width: constraints.maxWidth,
                                decoration: BoxDecoration(
                                  color: Color(0xFF979797),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Container(
                                height: 6,
                                width: constraints.maxWidth * 0.7,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 8),
                      Text(
                        "78% Funded",
                        style: TextStyle(
                          color: Colors.white.withAlpha(50),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: () => NavUtils.push(ReportDetailPage()),
                  child: Container(
                    width: 80,
                    height: 32,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/detail_btn.png"),
                      ),
                    ),
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
