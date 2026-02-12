// import 'package:flutter/material.dart';

// class DataPrivacyPage extends StatefulWidget {
//   const DataPrivacyPage({super.key});

//   static const String routeName = '/data-privacy';

//   @override
//   State<DataPrivacyPage> createState() => _DataPrivacyPageState();
// }

// class _DataPrivacyPageState extends State<DataPrivacyPage> {
//   bool _firstResearchEnabled = true;
//   bool _secondResearchEnabled = true;
//   bool _thirdResearchEnabled = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F1E7),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset('assets/images/bg_full.png', fit: BoxFit.cover),
//           ),
//           Positioned(
//             left: 0,
//             top: 0,
//             right: 0,
//             height: 188,
//             child: IgnorePointer(
//               child: Image.asset('assets/images/bg_top.png', fit: BoxFit.cover),
//             ),
//           ),
//           SafeArea(
//             child: Column(
//               children: [
//                 _TopBar(
//                   onBackPressed: () {
//                     Navigator.of(context).maybePop();
//                   },
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     physics: const BouncingScrollPhysics(),
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//                       child: Column(
//                         children: [
//                           _GlassCard(
//                             child: Column(
//                               children: [
//                                 _ResearchSwitchRow(
//                                   iconAsset: 'assets/images/topic_icon_1.png',
//                                   title:
//                                       '\u66f4\u5e74\u671f\u524d\u671f\u7684 REM \u7761\u7720\u56fe\u8c31',
//                                   value: _firstResearchEnabled,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _firstResearchEnabled = value;
//                                     });
//                                   },
//                                 ),
//                                 const _DividerLine(),
//                                 _ResearchSwitchRow(
//                                   iconAsset: 'assets/images/topic_icon_2.png',
//                                   title:
//                                       '\u6708\u7ecf\u5468\u671f\u4e0e\u5fc3\u810f\u5065\u5eb7',
//                                   value: _secondResearchEnabled,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _secondResearchEnabled = value;
//                                     });
//                                   },
//                                 ),
//                                 const _DividerLine(),
//                                 _ResearchSwitchRow(
//                                   iconAsset: 'assets/images/topic_icon_3.png',
//                                   title:
//                                       '\u66f4\u5e74\u671f\u524d\u671f\u7684 REM \u7761\u7720\u56fe\u8c31\u66f4\u5e74\u671f\u524d\u671f\u7684 REM \u7761\u7720\u56fe\u8c31\u66f4\u5e74\u671f\u524d\u671f\u7684 REM \u7761\u7720\u56fe\u8c31\u66f4\u5e74\u671f\u524d\u671f\u7684 REM \u7761\u7720\u56fe\u8c31',
//                                   value: _thirdResearchEnabled,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _thirdResearchEnabled = value;
//                                     });
//                                   },
//                                   maxLines: 2,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           Row(
//                             children: const [
//                               Expanded(
//                                 child: _ReportCard(
//                                   iconAsset: 'assets/images/pdf_icon.png',
//                                   title: 'PDF \u62a5\u544a',
//                                 ),
//                               ),
//                               SizedBox(width: 12),
//                               Expanded(
//                                 child: _ReportCard(
//                                   iconAsset: 'assets/images/csv_icon.png',
//                                   title: 'CSV \u539f\u59cb\u6570\u636e',
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 16),
//                           _GlassCard(
//                             child: Column(
//                               children: const [
//                                 _ActionRow(
//                                   leadingIcon: Icons.delete_outline,
//                                   title: '\u6e05\u9664AI\u8bb0\u5f55',
//                                   rightText: '\u6e05\u9664',
//                                   showRightText: true,
//                                 ),
//                                 _DividerLine(),
//                                 _ActionRow(
//                                   leadingIcon: Icons.settings_outlined,
//                                   title: '\u7cfb\u7edf\u8bbe\u7f6e',
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 220),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Positioned(
//             left: 121,
//             right: 121,
//             bottom: 8,
//             child: SizedBox(
//               height: 5,
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.all(Radius.circular(100)),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _TopBar extends StatelessWidget {
//   const _TopBar({required this.onBackPressed});

//   final VoidCallback onBackPressed;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 88,
//       child: Column(
//         children: [
//           const SizedBox(height: 44),
//           SizedBox(
//             height: 44,
//             child: Stack(
//               children: [
//                 Positioned(
//                   left: 0,
//                   top: 0,
//                   bottom: 0,
//                   width: 100,
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: IconButton(
//                       onPressed: onBackPressed,
//                       splashRadius: 20,
//                       icon: const Icon(
//                         Icons.chevron_left,
//                         size: 28,
//                         color: Color(0xFF333333),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Center(
//                   child: Text(
//                     '\u6570\u636e\u4e0e\u9690\u79c1',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF000000),
//                       height: 1.5,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _GlassCard extends StatelessWidget {
//   const _GlassCard({required this.child});

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: const Color(0x63FFFFFF),
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x21918264),
//             offset: Offset(0, 5),
//             blurRadius: 3.7,
//           ),
//         ],
//       ),
//       child: child,
//     );
//   }
// }

// class _DividerLine extends StatelessWidget {
//   const _DividerLine();

//   @override
//   Widget build(BuildContext context) {
//     return const Divider(height: 1, thickness: 1, color: Color(0x0D000000));
//   }
// }

// class _ResearchSwitchRow extends StatelessWidget {
//   const _ResearchSwitchRow({
//     required this.iconAsset,
//     required this.title,
//     required this.value,
//     required this.onChanged,
//     this.maxLines = 1,
//   });

//   final String iconAsset;
//   final String title;
//   final bool value;
//   final ValueChanged<bool> onChanged;
//   final int maxLines;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: maxLines == 1 ? 64 : 66,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         child: Row(
//           children: [
//             Expanded(
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: 40,
//                     height: 40,
//                     child: Image.asset(iconAsset),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       title,
//                       maxLines: maxLines,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         height: 1.5,
//                         color: Color(0xFF333333),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 16),
//             _IosSwitch(value: value, onChanged: onChanged),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _IosSwitch extends StatelessWidget {
//   const _IosSwitch({required this.value, required this.onChanged});

//   final bool value;
//   final ValueChanged<bool> onChanged;

//   @override
//   Widget build(BuildContext context) {
//     final Color backgroundColor = value
//         ? const Color(0xFF34C759)
//         : const Color(0x4D3C3C43);
//     final Alignment knobAlignment = value
//         ? Alignment.centerRight
//         : Alignment.centerLeft;

//     return GestureDetector(
//       onTap: () => onChanged(!value),
//       child: Container(
//         width: 64,
//         height: 28,
//         padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
//         decoration: BoxDecoration(
//           color: backgroundColor,
//           borderRadius: BorderRadius.circular(100),
//         ),
//         child: Stack(
//           children: [
//             if (value)
//               const Positioned(
//                 left: 10,
//                 top: 7,
//                 child: SizedBox(
//                   width: 1,
//                   height: 10,
//                   child: DecoratedBox(
//                     decoration: BoxDecoration(color: Colors.white),
//                   ),
//                 ),
//               ),
//             if (!value)
//               const Positioned(
//                 right: 9.5,
//                 top: 8,
//                 child: SizedBox(
//                   width: 10,
//                   height: 10,
//                   child: DecoratedBox(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.fromBorderSide(
//                         BorderSide(color: Color(0xFFB3B3B3), width: 1),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             AnimatedAlign(
//               alignment: knobAlignment,
//               duration: const Duration(milliseconds: 160),
//               curve: Curves.easeOut,
//               child: Container(
//                 width: 39,
//                 height: 24,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ReportCard extends StatelessWidget {
//   const _ReportCard({required this.iconAsset, required this.title});

//   final String iconAsset;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return _GlassCard(
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: SizedBox(
//           height: 102,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(width: 32, height: 32, child: Image.asset(iconAsset)),
//               const SizedBox(height: 12),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 14,
//                   height: 1.172,
//                   color: Color(0xFF333333),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               const Spacer(),
//               Row(
//                 children: const [
//                   Expanded(
//                     child: _MiniButton(
//                       text: '\u5206\u4eab',
//                       backgroundColor: Color(0x33000000),
//                     ),
//                   ),
//                   SizedBox(width: 8),
//                   Expanded(
//                     child: _MiniButton(
//                       text: '\u4e0b\u8f7d',
//                       backgroundColor: Color(0x33004DFF),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _MiniButton extends StatelessWidget {
//   const _MiniButton({required this.text, required this.backgroundColor});

//   final String text;
//   final Color backgroundColor;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 30,
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(100),
//       ),
//       alignment: Alignment.center,
//       child: Text(
//         text,
//         style: const TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.w500,
//           color: Colors.white,
//           height: 1.172,
//         ),
//       ),
//     );
//   }
// }

// class _ActionRow extends StatelessWidget {
//   const _ActionRow({
//     required this.leadingIcon,
//     required this.title,
//     this.rightText,
//     this.showRightText = false,
//   });

//   final IconData leadingIcon;
//   final String title;
//   final String? rightText;
//   final bool showRightText;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 59,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
//         child: Row(
//           children: [
//             Icon(leadingIcon, color: const Color(0xFF333333), size: 24),
//             const SizedBox(width: 8),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 height: 1.172,
//                 color: Color(0xFF333333),
//               ),
//             ),
//             const Spacer(),
//             if (showRightText)
//               Text(
//                 rightText ?? '',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   height: 1.172,
//                   color: Color(0xFF999999),
//                 ),
//               ),
//             if (showRightText) const SizedBox(width: 6),
//             const Icon(Icons.chevron_right, size: 20, color: Color(0xFF333333)),
//           ],
//         ),
//       ),
//     );
//   }
// }
