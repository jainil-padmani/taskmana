import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:taskmana/common/utils/constants.dart';
import 'package:taskmana/common/widgets/appstyle.dart';
import 'package:taskmana/common/widgets/custom_otn_btn.dart';
import 'package:taskmana/common/widgets/custome_text.dart';
import 'package:taskmana/common/widgets/hieght_spacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import 'package:taskmana/features/todo/controllers/dates/dates_provider.dart';

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
    var scheduleDate = ref.watch(dateStateProvider);
    var start = ref.watch(startTimeStateProvider);
    var finish = ref.watch(finishStateProvider);

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
              onTap: () {
                picker.DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2024, 1, 1),
                      maxTime: DateTime(2035, 1, 1),
                      theme: const picker.DatePickerTheme(
                          doneStyle:
                              TextStyle(color: AppConst.kGreen, fontSize: 16)),
                      onConfirm: (date) {
                        ref.read(dateStateProvider.notifier).setDate(date.toString());
                  }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
              },
              height: 52.h, 
              width: AppConst.kWidth, 
              color: AppConst.kLight, 
              text: scheduleDate == "" ? "Set Date": scheduleDate.substring(0,10),
              color2: AppConst.kBlueLight,
            ),

            const HieghtSpacer(hieght: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOtnBtn(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      onConfirm: (date) {
                        ref.read(startTimeStateProvider.notifier).setStart(date.toString());
                    }, locale: picker.LocaleType.en);
                  },
                  height: 52.h, 
                  width: AppConst.kWidth*0.4, 
                  color: AppConst.kLight, 
                  text: start == "" ? "Start Time": start.substring(10,16),
                  color2: AppConst.kBlueLight,
                ),

                CustomOtnBtn(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      onConfirm: (date) {
                        ref.read(finishStateProvider.notifier).setFinish(date.toString());
                    }, locale: picker.LocaleType.en);
                  },
                  height: 52.h, 
                  width: AppConst.kWidth*0.4, 
                  color: AppConst.kLight, 
                  text: finish == "" ? "Finish Time": finish.substring(10,16),
                  color2: AppConst.kBlueLight,
                ),
              ],
            ),

            const HieghtSpacer(hieght: 20),

            CustomOtnBtn(
              onTap: () {
                    
                  },
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


//  6 52 43     ---------------------------------------