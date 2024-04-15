import 'package:agroguru/src/presentation/common/appbar.dart';
import 'package:flutter/material.dart';

class PlantCareTutorialPage extends StatefulWidget {
  const PlantCareTutorialPage({super.key});

  @override
  State<PlantCareTutorialPage> createState() => _PlantCareTutorialPageState();
}

class _PlantCareTutorialPageState extends State<PlantCareTutorialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(),
    );
  }
}
