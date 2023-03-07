import 'package:shipcret/common/common_font.dart';
import 'package:shipcret/common/route_wrapper.dart';
import 'package:shipcret/common/widgets/background_image_widget.dart';
import 'package:shipcret/widgets/common/common_string.dart';
import 'package:shipcret/widgets/common/common_widget.dart';

import 'package:flutter/material.dart';

class FWelcomePage extends StatefulWidget {
  const FWelcomePage({super.key});

  @override
  State<FWelcomePage> createState() => _FWelcomePageState();
}

class _FWelcomePageState extends State<FWelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: FCommonWidget.appBarCenterTitle(
      //   '',
      //   context: context,
      // ),
      body: FBackgroundImageWidget(child: _centerWidget(context)),
    );
  }

  Center _centerWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            FCommonString.welcomeTodayTitle,
            style: TextStyle(
              color: Colors.white,
              fontFamily: FCommonFont.family,
              fontSize: 20,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: FCommonWidget.submitButton(
              context: context,
              label: FCommonString.welcomeCreateAccount,
              color: Colors.deepOrange.withOpacity(0.5),
              onPressed: () {
                FAppRoute.push(context, FRouteName.signIn);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  FCommonString.welcomeAlreadyAccont,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: FCommonFont.family,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    FAppRoute.push(context, FRouteName.signUp);
                  },
                  child: Text(
                    FCommonString.welcomeLogin,
                    style: TextStyle(
                      color: Colors.blue.shade400,
                      fontFamily: FCommonFont.family,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
