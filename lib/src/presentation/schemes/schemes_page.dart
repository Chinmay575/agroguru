import 'package:agroguru/src/data/models/scheme.dart';
import 'package:agroguru/src/presentation/common/appbar.dart';
import 'package:agroguru/src/presentation/schemes/widgets/schemes_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'bloc/schemes_bloc.dart';

class SchemesPage extends StatefulWidget {
  const SchemesPage({super.key});

  @override
  State<SchemesPage> createState() => _SchemesPageState();
}

class _SchemesPageState extends State<SchemesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SchemesBloc, SchemesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SchemesLoadingState) {
          return Scaffold(
            appBar: customAppBar(),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 27.w),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Skeletonizer(
                    child: SchemesTile(
                      scheme: GovtSchemes(
                        description: '',
                        name: "Lorem ipsum dorem ipsum",
                        publishDate: DateTime.now().toString(),
                        link: 'link',
                        relatedDocument: 'link',
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
        return Scaffold(
          appBar: customAppBar(),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 27.w),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.schemes.length,
              itemBuilder: (context, index) {
                return SchemesTile(scheme: state.schemes[index]);
              },
            ),
          ),
        );
      },
    );
  }
}
