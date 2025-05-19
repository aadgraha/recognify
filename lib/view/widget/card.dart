import 'package:demo_project/util/color.dart';
import 'package:demo_project/view/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DeveloperCard extends StatelessWidget {
  const DeveloperCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520,
      width: double.maxFinite,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF212121),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            height: 520,
            width: double.maxFinite,
            child: Row(
              children: [
                const Expanded(child: DeveloperPicture()),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Spacer(),
                      Text(
                        'SOFTWARE',
                        style: GoogleFonts.sen(
                          textStyle: TextStyle(
                            letterSpacing: .25,
                            height: 0.9,
                            fontWeight: FontWeight.w200,
                            color: CustomColor.onDialog(),
                            fontSize: 70,
                          ),
                        ),
                      ),
                      Text(
                        'DEVELOPER',
                        style: GoogleFonts.sen(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: CustomColor.onDialog(),
                            fontSize: 70,
                            height: 0.9,
                            letterSpacing: .25,
                          ),
                        ),
                      ),
                      const Gap(20),
                      Text(
                        'DISCOVER THE POWER OF INNOVATION',
                        style: GoogleFonts.sen(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: CustomColor.onDialog(),
                            fontSize: 14,
                            height: 1,
                            letterSpacing: .25,
                          ),
                        ),
                      ),
                      Text(
                        'AND EMBRACE GROWTH WITH BOLD',
                        style: GoogleFonts.sen(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: CustomColor.onDialog(),
                            fontSize: 14,
                            height: 1,
                            letterSpacing: .25,
                          ),
                        ),
                      ),
                      Text(
                        'STRATEGIST',
                        style: GoogleFonts.sen(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: CustomColor.onDialog(),
                            fontSize: 14,
                            height: 1,
                            letterSpacing: .25,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Gap(15),
              ],
            ),
          ),
          CustomTextButton(label: 'MENU', onPressed: () {}),
          CustomTextButton(
            alignment: Alignment.topRight,
            label: 'CONTACT ME',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Contact Me',
                      style: TextStyle(color: CustomColor.onDialog()),
                    ),

                    backgroundColor: Color(0xFF333333),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextField(),
                        SizedBox(height: 10),
                        TextField(
                          minLines: 5,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: "Enter message",
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle send logic
                        },
                        child: Text('Send'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          CustomTextButton(
            alignment: Alignment.bottomRight,
            label: 'SCROLL FOR MORE',
            onPressed: () {},
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
    return Image.asset('dev_clear.png', fit: BoxFit.fitWidth);
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
