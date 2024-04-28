import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskmana/common/utils/constants.dart';
import 'package:taskmana/common/widgets/appstyle.dart';
import 'package:taskmana/common/widgets/custom_otn_btn.dart';
import 'package:taskmana/common/widgets/custome_text.dart';
import 'package:taskmana/common/widgets/hieght_spacer.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HieghtSpacer(hieght: 20),
        
            CoustomtxtField(
              hintText: "Add title", 
              controller: title,
              hintStyle: appstyle(16, AppConst.kGreyLight, FontWeight.w600),
            ),
        
            const HieghtSpacer(hieght: 20),
        
            CoustomtxtField(
              hintText: "Add description", 
              controller: desc, 
              hintStyle: appstyle(16, AppConst.kGreyLight, 
              FontWeight.w600),
            ),

            const HieghtSpacer(hieght: 20),

            CustomOtnBtn(
              height: 52.h, 
              width: AppConst.kWidth, 
              color: AppConst.kLight, 
              text: "Set Date",
              color2: AppConst.kBlueLight,
            ),

            const HieghtSpacer(hieght: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOtnBtn(
                  height: 52.h, 
                  width: AppConst.kWidth*0.4, 
                  color: AppConst.kLight, 
                  text: "Start Time",
                  color2: AppConst.kBlueLight,
                ),

                CustomOtnBtn(
                  height: 52.h, 
                  width: AppConst.kWidth*0.4, 
                  color: AppConst.kLight, 
                  text: "End Time",
                  color2: AppConst.kBlueLight,
                ),
              ],
            ),

            const HieghtSpacer(hieght: 20),

            CustomOtnBtn(
              height: 52.h, 
              width: AppConst.kWidth, 
              color: AppConst.kLight, 
              text: "Submit",
              color2: AppConst.kGreen,
            ),
        
          ],
        ),
      ),
    );
  }
}