
import 'package:flutter/material.dart';
import 'package:herplus/pages/app_page/privacy_commitment.dart';

import 'body_data.dart';
import 'cycle_details.dart';
import 'cycle_details_page.dart';
import 'gender_cognition.dart';

class DataContainer extends StatefulWidget {
  final int initialPage;

  const DataContainer({this.initialPage = 0});

  @override
  State<DataContainer> createState() =>
      _DataContainerState();
}

class _DataContainerState
    extends State<DataContainer> {
  late final PageController _pageController;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage;
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  PageView(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      children: const [GenderCognitionPage(),CycleDetailsPage(),CycleDetails(), BodyDataPage(),PrivacyCommitmentPage()],
    );
  }
}