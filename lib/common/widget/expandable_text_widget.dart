import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/theme.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = 150.h;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty? Text(firstHalf, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 14.sp, color: AppColors.paraColor),): Column(
        children: [
          Text(
              hiddenText?(firstHalf+"...") : ("$firstHalf $secondHalf"),
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: AppColors.paraColor,
              fontSize: 14.sp,
              height: 1.4,
            ),
          ),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                hiddenText?Text(
                  "Read more",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Theme.of(context).primaryColor, fontSize: 14.sp),
                ):Text(
                  "Read less",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Theme.of(context).primaryColor, fontSize: 14.sp),
                ),
                Icon(hiddenText? Icons.arrow_drop_down: Icons.arrow_drop_up, color: Theme.of(context).primaryColor)
              ],
            )
          )
        ],
      ),
    );
  }
}
