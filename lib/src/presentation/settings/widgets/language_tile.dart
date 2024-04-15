import 'package:agroguru/src/config/bloc/global_bloc.dart';
import 'package:agroguru/src/utils/constants/enums/supported_languages.dart';
import 'package:agroguru/src/utils/constants/strings/assets.dart';
import 'package:agroguru/src/utils/extensions/capitalize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../utils/styles/text_styles.dart';

class LanguageTile extends StatefulWidget {
  const LanguageTile({super.key});

  @override
  State<LanguageTile> createState() => _LanguageTileState();
}

class _LanguageTileState extends State<LanguageTile> {
  bool expand = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalBloc, GlobalState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                        child: Image.asset(
                          Assets.language,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.language,
                        style: TextStyles.of(context).heading6(),
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
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
                      width: 1080.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Center(
                            child: ListTile(
                              trailing:
                                (Languages.values[index] != Languages.en)
                                    ? Text(
                                        'Experimental',
                                        style: TextStyles.of(context).small(),
                                      )
                                    : null,
                              dense: true,
                              leading: Container(
                                height: 20.h,
                                width: 20.h,
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  // color: Colors.green,
                                  border: Border.all(
                                    color: Colors.green,
                                  ),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: (state.appLanguage == Languages.values[index])
                                    ? Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                        ),
                                      )
                                    : Container(),
                              ),
                              title: Text(
                                Languages.values[index]
                                    .toString()
                                    .split('.')
                                    .last
                                    .capitalize(),
                                style: TextStyles.of(context).body(),
                              ),
                              onTap: () {
                                // print(ThemeMode.values[index]);
                                BlocProvider.of<GlobalBloc>(context).add(
                                  ChangeLanguageEvent(
                                    lang: Languages.values[index],
                                  ),
                                );
                              },
                              // trailing:
                              //     (state.appLanguage == Languages.values[index])
                              //         ? Container(
                              //             height: 30.h,
                              //             width: 30.h,
                              //             decoration: BoxDecoration(
                              //               color: Colors.lightGreen,
                              //               borderRadius:
                              //                   BorderRadius.circular(30.r),
                              //             ),
                              //             child: const Center(
                              //               child: Icon(
                              //                 Icons.done_outlined,
                              //                 color: Colors.white,
                              //               ),
                              //             ),
                              //           )
                              //         : null,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: Divider(
                              height: 1.h,
                              color: HexColor('#1315130D'),
                            ),
                          );
                        },
                        itemCount: Languages.values.length,
                      ),
                    )
                  : Container(),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 16.h),
              //   child: Divider(
              //     height: 1.h,
              //     color: HexColor('#1315130D'),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
