import 'package:flutter/material.dart';
import 'package:herplus/core/widgets/custom_progress.dart';

class ReportDetailPage extends StatelessWidget {
  const ReportDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: buildContent(context),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bottom_bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  "今日可捐步数",
                  style: TextStyle(
                    color: Colors.white.withAlpha(50),
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "12,089",
                  style: TextStyle(color: Color(0xFF12DFDC), fontSize: 22),
                ),
              ],
            ),
            Spacer(),
            Image.asset("assets/images/inject_btn.png", width: 106, height: 44),
          ],
        ),
      ),
    );
  }

  buildContent(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  "assets/images/head_bg.png",
                  width: double.infinity,
                  height: 379,
                  fit: BoxFit.fill,
                ),
                Column(
                  children: [
                    SizedBox(height: 260 - 95),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: 95,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            child: Container(
                              color: Colors.black,
                              child: Image.asset(
                                "assets/images/list_bg1.png",
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        buildPlanCard(context),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  "项目详情",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //走这里下组件
  buildPlanCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Container(
            height: 178,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/plan_bg.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "肯尼亚经期贫困援助计划",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 12),
                Text(
                  "在肯尼亚的偏远地区，经期贫困不仅是卫生问题，更是阻碍女性教育与发展的社会壁垒。",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(height: 12),
                buildProgress(context),
              ],
            ),
          ),

          buildDonationCardList(),
          buildAricleList(context),
        ],
      ),
    );
  }

  buildProgress(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 54,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 9.5, horizontal: 12),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/progress_bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              CustomProgress(progress: 0.7, progressColor: Color(0xFF12DFDC)),
              SizedBox(height: 12),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        "已筹：",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "\$34,000",
                        style: TextStyle(
                          color: Color(0xFF5FC5FF),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "目标：",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        "\$34,000",
                        style: TextStyle(
                          color: Color(0xFFE5F964),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -21,
          left: MediaQuery.of(context).size.width * 0.7 - 75,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/indicator.png",
                width: 70,
                height: 80,
                fit: BoxFit.fill,
              ),
              Center(
                child: Text(
                  "68%",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildDonationCardList() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        buildDonationCard(
          imagePath: "assets/images/step_donate.png",
          label: "捐款金额",
        ),
        SizedBox(width: 12),
        buildDonationCard(
          imagePath: "assets/images/donated_people.png",
          label: "受益人数",
          unit: "人",
        ),
        SizedBox(width: 12),
        buildDonationCard(
          imagePath: "assets/images/reve.png",
          label: "预计覆盖",
          unit: "校",
        ),
      ],
    );
  }

  buildDonationCard({
    required String imagePath,
    required String label,
    String? unit,
  }) {
    return Expanded(
      child: Container(
        height: 125,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imagePath)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "340",
                  style: TextStyle(color: Color(0xFF12DFDC), fontSize: 20),
                ),
                if (unit != null) ...[
                  SizedBox(width: 4),
                  Text(
                    unit,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildAricleList(BuildContext context) {
    return Column(
      children: [
        buildArticle(context),
        SizedBox(height: 12),
        buildArticle(context),
      ],
    );
  }

  buildArticle(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/article_bg.png"),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.white.withAlpha(200),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("项目背景", style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Row(
              children: [
                Image.asset(
                  "assets/images/article_icon.png",
                  width: 24,
                  height: 24,
                ),
                Text(
                  "月经不应成为成长的“隐形门槛”",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 13.5),
              ],
            ),
            Text(
              "在肯尼亚，月经从来不是一件自然而正常的生理小事，而是困住无数女孩成长的“隐形枷锁”。据研究显示，肯尼亚青少年女孩在经期管理方面面临着多重严峻挑战——匮乏的生理知识、难以获取的卫生用品、短缺的卫生设施，再加上根深蒂固的社会偏见，让她们的健康、教育与尊严都受到了严重损害，这便是被忽视已久的“经期贫困”。",
              style: TextStyle(fontSize: 12, color: Color(0xFF696969)),
            ),
            SizedBox(height: 12),
            Text(
              "尤其是偏远乡村、达达阿布和卡库马难民营等地区，超过半数的学龄女童因经期贫困陷入困境。",
              style: TextStyle(fontSize: 12, color: Color(0xFF696969)),
            ),
            SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/article_image.png",
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
