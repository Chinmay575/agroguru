// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/styles/text_styles.dart';

class AboutTile extends StatefulWidget {
  String name;
  String? github;
  String? linkedin;
  String? gmail;
  AboutTile({
    super.key,
    required this.name,
    this.github,
    this.gmail,
    this.linkedin,
  });

  @override
  State<AboutTile> createState() => _AboutTileState();
}

class _AboutTileState extends State<AboutTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 48.r,
            child: Container(
              height: 96.h,
              width: 96.h,
              decoration: BoxDecoration(
                color: randomColor(),
                borderRadius: BorderRadius.circular(64.r),
              ),
              child: Center(
                child: Text(
                  getInitials(widget.name),
                  style: TextStyles.of(context).heading2(color: Colors.white),
                ),
              ),
            ),
          ),
          Text(
            widget.name,
            style: TextStyles.of(context).body(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              (widget.github != null)
                  ? IconButton(
                      onPressed: () async {
                        Uri url = Uri.parse(widget.github!);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      icon: Brand(Brands.github),
                    )
                  : Container(),
              (widget.linkedin != null)
                  ? IconButton(
                      onPressed: () async {
                        Uri url = Uri.parse(widget.linkedin!);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      icon: Brand(Brands.linkedin),
                    )
                  : Container(),
              (widget.gmail != null)
                  ? IconButton(
                      onPressed: () async {
                        Uri url = Uri.parse("mailto:${widget.gmail!}");

                        await launchUrl(url);
                      },
                      icon: Brand(Brands.gmail),
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }

  String getInitials(String name) {
    String r = name.split(' ').map((e) => e[0]).join("");
    return r.substring(0, 2);
  }

  Color randomColor() {
    List<Color> colors = [
      Colors.orange,
      Colors.green,
      Colors.blue,
      Colors.red,
      Colors.lightBlue,
      Colors.lightGreen,
      Colors.black,
      Colors.grey,
      Colors.amber,
      Colors.brown,
      Colors.cyan,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.purple,
      Colors.indigo,
      Colors.lime,
      Colors.teal,
    ];

    return colors[Random().nextInt(colors.length)];
  }
}
