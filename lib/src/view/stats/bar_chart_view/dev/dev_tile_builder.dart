import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperInformation extends StatelessWidget {
  DeveloperInformation({super.key});
  final Map<String, String> data = {
    "assets/icons/person.svg": "Junayed Ahamed",
    "assets/icons/uni.svg": "Daffodil International University (CSE)",
    "assets/icons/email.svg": "junayedahamed660@gmail.com",
    "assets/icons/git.svg": "junayedahamed",
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        constraints: BoxConstraints(maxHeight: double.infinity),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 2,
            color: Theme.of(context).iconTheme.color ?? Colors.black,
          ),
          color: MediaQuery.of(context).platformBrightness == Brightness.light
              ? Colors.blueGrey
              : Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
            //   child: Text(
            //     "Developer Info",
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            //   ),
            // ),
            ExpansionTile(
              leading: SvgPicture.asset(
                'assets/icons/dev.svg',
                colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color ?? Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              // shape: RoundedRectangleBorder(
              //   // borderRadius: BorderRadiusGeometry.circular(16),
              // ),
              title: Text("About Developer"),

              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        if (index == 2) {
                          if (!await launchUrl(
                            Uri(
                              scheme: 'mailto',
                              path: "junayedahamed660@gmail.com",
                            ),
                          )) {
                            throw Exception('Could not launch ');
                          }
                        }

                        if (index == 3) {
                          if (!await launchUrl(
                            Uri(
                              scheme: 'https',
                              path: "github.com/junayedahamed",
                            ),
                          )) {
                            throw Exception('Could not launch ');
                          }
                        }
                      },
                      child: ListTile(
                        title: Row(
                          spacing: 6,
                          children: [
                            SvgPicture.asset(
                              data.keys.toList()[index],
                              height: 20,
                              width: 20,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).iconTheme.color ??
                                    Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                data.values.toList()[index],
                                maxLines: 5,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 5);
                  },
                  itemCount: data.length,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
