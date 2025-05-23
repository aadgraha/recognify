import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:recognify/util/color.dart';
import 'package:recognify/util/padding.dart';
import 'package:recognify/view/widget/card.dart';
import 'package:recognify/view/widget/contact_me.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _key1 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Sizer(
      maxTabletWidth: 799,
      builder: (p0, p1, p2) {
        return MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          theme: ThemeData(
            radioTheme: RadioThemeData(
              fillColor: WidgetStateProperty.all(CustomColor.onDialog()),
              overlayColor: WidgetStateProperty.all(CustomColor.onDialog()),
            ),
          ),

          home: SelectionArea(
            child: Scaffold(
              backgroundColor: Colors.black,
              body: SafeArea(
                child: ListView(
                  children: [
                    Gap(20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomPadding.wide(),
                      ),
                      child: DeveloperCard(
                        onMore: () {
                          Scrollable.ensureVisible(
                            _key1.currentContext!,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                    Gap(40),
                    Padding(
                      key: _key1,
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomPadding.wide(),
                      ),
                      child: Text(
                        'About Me',
                        style: GoogleFonts.sen(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: CustomColor.onDialog(),
                            fontSize: 25,
                            height: 0.9,
                            letterSpacing: .25,
                          ),
                        ),
                      ),
                    ),
                    Gap(5),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomPadding.wide(),
                      ),
                      child: Divider(color: CustomColor.label()),
                    ),
                    Gap(40),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomPadding.wide(),
                      ),
                      child: Text(
                        "${'"'}Hi I'm Yahya Adi, a software developer specializing in Flutter and Golang, with a strong background in building robust, scalable applications.\n\nI have hands-on experience leading ERP implementation for one of the largest poultry companies in Indonesia, where I contributed to optimizing business processes through technology.\n\nI pride myself on being a fast learner and highly adaptable to new programming languages, frameworks, and tools. Whether it's building cross-platform mobile apps or developing efficient backend systems, I bring a problem-solving mindset and a commitment to clean, maintainable code.${'"'}",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.merriweather(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: CustomColor.onDialog(),
                            fontSize: 18,
                            height: 1.5,
                            wordSpacing: 5,
                          ),
                        ),
                      ),
                    ),
                    Gap(40),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomPadding.wide(),
                      ),
                      child: Text(
                        'Work Projects',
                        style: GoogleFonts.sen(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: CustomColor.onDialog(),
                            fontSize: 25,
                            height: 0.9,
                            letterSpacing: .25,
                          ),
                        ),
                      ),
                    ),
                    Gap(5),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomPadding.wide(),
                      ),
                      child: Divider(color: CustomColor.label()),
                    ),
                    Gap(20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomPadding.wide(),
                      ),
                      child: ProjectTile(),
                    ),
                    Gap(40),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomPadding.wide(),
                      ),
                      child: Text(
                        'Contact Me',
                        style: GoogleFonts.sen(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: CustomColor.onDialog(),
                            fontSize: 25,
                            height: 0.9,
                            letterSpacing: .25,
                          ),
                        ),
                      ),
                    ),
                    Gap(5),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomPadding.wide(),
                      ),
                      child: Divider(color: CustomColor.label()),
                    ),
                    Gap(20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomPadding.wide(),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ContactMe(isDialog: false),
                      ),
                    ),
                    Gap(40),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProjectTile extends StatelessWidget {
  const ProjectTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 15,
      runSpacing: 15,
      children: List.generate(3, (index) {
        final items = [
          TileProps(
            'voltunes-web.png',
            'Voltunes ERP',
            'ERP solution for integrated poultry management.Running a poultry farm requires precision, consistency, and control. Voltunes ERP is your all-in-one solution for modern poultry management—streamlining daily operations',
            Uri.parse(
              'https://voltunes.com/id/pages/voltunes-poultry-erp-id.html',
            ),
          ),
          TileProps(
            'voltunes-mobile.png',
            'Voltunes Mobile',
            'Voltunes mobile apps offers a modern solution for managing your farm—from recording daily weight and mortality, tracking stock usage and inventory, and logging harvests—all in one streamlined platform.',
            Uri.parse('https://voltunes.com/id/pages/product-detail-id.html'),
          ),
          TileProps(
            'visit-flow.png',
            'Visit Flow Mobile',
            'Visit Flow Mobile Apps is the Visiton app simplifies every step of your visit process—from planning and routing, to real-time check-ins, task execution, and post-visit reports.',
            Uri.parse('https://visitflow.flexurio.com/'),
          ),
        ];
        return GridTile(tileProps: items[index]);
      }),
    );
  }
}

class GridTile extends StatelessWidget {
  const GridTile({super.key, required this.tileProps});
  final TileProps tileProps;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: CustomColor.dialogBackground(),
      ),

      height: 400,
      width: 400,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => Container(
                          color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.close,
                                  color: CustomColor.label(),
                                  size: 31,
                                ),
                              ),
                              Expanded(
                                child: PhotoView(
                                  imageProvider: AssetImage(tileProps.asset),
                                ),
                              ),
                              Gap(12),
                            ],
                          ),
                        ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(tileProps.asset, fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                tileProps.title,
                style: TextStyle(color: CustomColor.onDialog()),
              ),
              subtitle: Text(
                tileProps.desc,
                style: TextStyle(color: CustomColor.label()),
              ),
            ),
          ),
          CustomTextButton(
            alignment: Alignment.centerRight,
            label: 'More...',
            onPressed: () async {
              await launchUrl(tileProps.uri, webOnlyWindowName: '_blank');
            },
          ),
        ],
      ),
    );
  }
}

class TileProps {
  const TileProps(this.asset, this.title, this.desc, this.uri);
  final String asset;
  final String title;
  final String desc;
  final Uri uri;
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}
