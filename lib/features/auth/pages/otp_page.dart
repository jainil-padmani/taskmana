import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:taskmana/common/utils/constants.dart';
import 'package:taskmana/common/widgets/appstyle.dart';
import 'package:taskmana/common/widgets/hieght_spacer.dart';
import 'package:taskmana/common/widgets/reusable_text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HieghtSpacer(hieght: AppConst.kHeight*0.12),
                Padding(padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset("assets/images/todo.png", 
                width: AppConst.kWidth*0.5,),
                ),
                const HieghtSpacer(hieght: 26),
                ReusableText(
                  text: "Enter Your OTP Code", 
                  style: appstyle(18, AppConst.kLight, FontWeight.bold)),
                const HieghtSpacer(hieght: 26),
                Pinput(
                  length: 6,
                  showCursor: true,
                  onCompleted: (value) {
                    if (value.length == 6) {}
                  },
                  onSubmitted: (value) {
                    if (value.length == 6) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}