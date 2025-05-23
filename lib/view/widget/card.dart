import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recognify/util/color.dart';
import 'package:recognify/view/widget/contact_me.dart' show ContactMe;
import 'package:sizer/sizer.dart';

class DeveloperCard extends StatelessWidget {
  const DeveloperCard({super.key, required this.onMore});
  final void Function() onMore;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Device.screenType == ScreenType.mobile ? 300 : 400,
      width: double.maxFinite,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF212121),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            height: Device.screenType == ScreenType.mobile ? 300 : 400,
            width: double.maxFinite,
          ),
          Align(
            alignment:
                Device.screenType == ScreenType.mobile
                    ? Alignment.bottomLeft
                    : Alignment.centerLeft,
            child: DeveloperPicture(),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(),
                Text(
                  'SOFTWARE\nDEVELOPER',
                  textAlign: TextAlign.end,
                  style: GoogleFonts.sen(
                    textStyle: TextStyle(
                      letterSpacing: .25,
                      height: 0.9,
                      fontWeight: FontWeight.w200,
                      color: CustomColor.onDialog(),
                      fontSize: 25.sp,
                    ),
                  ),
                ),

                const Gap(40),
                Text(
                  'DISCOVER THE POWER OF INNOVATION\nAND EMBRACE GROWTH WITH BOLD\nSTRATEGIST',
                  textAlign: TextAlign.end,
                  style: GoogleFonts.sen(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: CustomColor.onDialog(),
                      fontSize: 12.sp,
                      height: 1,
                      letterSpacing: .25,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),

          CustomTextButton(
            alignment: Alignment.topRight,
            label: 'CONTACT ME',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return ContactMe(isDialog: true);
                },
              );
            },
          ),
          CustomTextButton(
            alignment: Alignment.bottomRight,
            label: 'SCROLL FOR MORE',
            onPressed: onMore,
          ),
        ],
      ),
    );
  }
}

class DeveloperPicture extends StatelessWidget {
  const DeveloperPicture({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        bottomLeft: Radius.circular(16),
      ),
      child: Image.asset('assets/dev_clear.png', fit: BoxFit.cover),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.alignment = Alignment.topLeft,
  });
  final String label;
  final void Function() onPressed;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: GoogleFonts.sen(
              textStyle: TextStyle(
                letterSpacing: .25,
                height: 0.9,
                fontWeight: FontWeight.w100,
                color: Colors.grey.shade200,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
