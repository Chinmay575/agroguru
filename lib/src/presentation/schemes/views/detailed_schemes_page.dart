import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/back_button.dart';

class DetailedSchemesPage extends StatefulWidget {
  const DetailedSchemesPage({super.key});

  @override
  State<DetailedSchemesPage> createState() => _DetailedSchemesPageState();
}

class _DetailedSchemesPageState extends State<DetailedSchemesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const CustomBackButton(),
        leadingWidth: 96.w,
      ),
      body: Container(),
    );
  }
}
