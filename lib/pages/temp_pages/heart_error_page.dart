import 'package:flutter/material.dart';

class HeartErrorPage extends StatelessWidget {
  const HeartErrorPage({super.key});
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_ios_new_outlined),

                        Text("心率异常详情", style: TextStyle(fontSize: 16)),
                        Image.asset(
                          'assets/images/heart_setting.png',
                          height: 24,
                          width: 73,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    Image.asset(
                      'assets/images/fake4_1.png',
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(height: 12),
                    Image.asset(
                      'assets/images/fake4_2.png',
                      height: 256,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(height: 12),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/step1.png',
                          height: 110,
                          fit: BoxFit.fitWidth,
                        ),
                        Image.asset(
                          'assets/images/step2.png',
                          height: 110,
                          fit: BoxFit.fitWidth,
                        ),
                        Image.asset(
                          'assets/images/step3.png',
                          height: 110,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/fake4_3.png',
                      height: 172,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
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
}
