import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/styles/text_styles.dart';

class PreferencesTile extends StatefulWidget {
  const PreferencesTile({super.key});

  @override
  State<PreferencesTile> createState() => _PreferencesTileState();
}

class _PreferencesTileState extends State<PreferencesTile> {
  List<String> themes = ['light', 'dark', 'system'];

  List<DropdownMenuEntry> options = const [
    DropdownMenuEntry(value: ThemeMode.light, label: 'LIGHT'),
    DropdownMenuEntry(value: ThemeMode.dark, label: 'DARK'),
    DropdownMenuEntry(value: ThemeMode.system, label: 'SYSTEM'),
  ];

  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1080.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 32.h,
                    width: 32.h,
                    margin: EdgeInsets.only(left: 8.w, right: 16.w),
                    child: Image.network(
                      Strings.darkMode,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    'Theme',
                    style: TextStyles.heading6(),
                    overflow: TextOverflow.fade,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    expand = !expand;
                  });
                },
                icon: Icon(
                  (!expand) ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                ),
              ),
            ],
          ),
          (expand)
              ? Container(
                  // height: 100.h,
                  width: 1080.h,
                  // color: Colors.amber,
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          ThemeMode.values[index].toString().split('.').last,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: Divider(
                          height: 1.h,
                          color: HexColor('#1315130D'),
                        ),
                      );
                    },
                    itemCount: ThemeMode.values.length,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
