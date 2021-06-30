import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          width: double.maxFinite,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.trophy),
                Column(
                  children: [
                    Text(
                      "Congrats!",
                      style: AppTextStyles.heading40,
                    ),
                    SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                          text: "You completed!",
                          style: AppTextStyles.body,
                          children: [
                            TextSpan(
                                text: "\n$title ",
                                style: AppTextStyles.bodyBold),
                            TextSpan(
                                text: "\nwith $result out of $length hits",
                                style: AppTextStyles.body)
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ]),
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 68),
                width: double.maxFinite,
                child: NextButtonWidget.purple(
                    label: "Share",
                    onTap: () {
                      Share.share("Quiz Result: $title: \n$result de $length");
                    })),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 68),
                width: double.maxFinite,
                child: NextButtonWidget.white(
                    label: "Back to Start",
                    onTap: () { 
                      Navigator.of(context).pop();
                    })),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
