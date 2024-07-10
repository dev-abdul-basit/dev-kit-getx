import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_template/Widgets/common_text.dart';
import 'package:get_template/ui/home/home_controller.dart';
import 'package:get_template/utils/constant.dart';
import 'package:get_template/utils/sizer_utils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: Constant.idHome,
        builder: (logic) {
          return Container(
            color: Colors.amber,
            child: Text(
              'Hello',
              style: TextStyle(color: Colors.black, fontSize: 44),
            ),
          );
        });
  }
}
