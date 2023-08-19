import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/theme.dart';

class TableTile extends StatelessWidget {
  TableTile({Key? key}) : super(key: key);

  RxBool expand = false.obs;
  RxDouble height = 130.0.obs;

  Widget _buildTable(BuildContext context, {double? tableSize, required int chairs}) {
    var sizeChair = tableSize ?? 20.w;
    var sizeTable = sizeChair*2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipPath(
          clipper: const HalfCircleClipper(side: ChairSide.top),
          child: Container(
            width: sizeChair,
            height: sizeChair,
            color: chairs == 3 || chairs == 2 || chairs == 1? Theme.of(context).primaryColor.withAlpha(60): Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 5.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: const HalfCircleClipper(side: ChairSide.left),
              child: Container(
                width: sizeChair,
                height: sizeChair,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(width: 5.w,),
            Container(
              width: sizeTable,
              height: sizeTable,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withAlpha(60),
                borderRadius: BorderRadius.circular(50.r)
              ),
            ),
            SizedBox(width: 5.w,),
            ClipPath(
              clipper: const HalfCircleClipper(side: ChairSide.right),
              child: Container(
                width: sizeChair,
                height: sizeChair,
                color: chairs == 1 ? Theme.of(context).primaryColor.withAlpha(60): Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h,),
        ClipPath(
          clipper: const HalfCircleClipper(side: ChairSide.bottom),
          child: Container(
            width: sizeChair,
            height: sizeChair,
            color: chairs == 2 || chairs == 1 ? Theme.of(context).primaryColor.withAlpha(60): Theme.of(context).primaryColor,
          ),
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: (){
        expand.value = !expand.value;
        height.value = expand.isTrue? 200: 130;
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: height.value.h ,
        margin: EdgeInsets.all(10.h),
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(30.r)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //height: 100.h,
              padding: EdgeInsets.only(left: 20.w),
              constraints: BoxConstraints(
                maxWidth: 220.w
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Linda Jamez",
                    maxLines: 2,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis
                    ),
                  ),
                  Text(
                    "BUSINESS",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 12.sp,
                        color:Theme.of(context).primaryColor
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "4",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Text(
                            "People",
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 12.sp,
                              color: AppColors.paraColor
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 60.w,),
                      Column(
                        children: [
                          Text(
                            "2",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Text(
                            "Table",
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 12.sp,
                              color: AppColors.paraColor
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 7.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Theme.of(context).primaryColor.withAlpha(50),
                    ),
                    child: Text(
                      "18:00 - 19:00",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 12.sp
                      ),
                    ),
                  )
                ],
              ),
            ),
            _buildTable(context, chairs: 4),
          ],
        ),
      ),
    ));
  }
}

enum ChairSide {
  left, right, top, bottom
}

extension ToPath on ChairSide {
  Path toPath(Size size){
    var path = Path();

    late Offset offset;
    late bool clockwise;

    switch (this) {
      case ChairSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case ChairSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
      case ChairSide.top:
        path.moveTo(size.width, size.height);
        offset = Offset(0, size.height);
        clockwise = false;
        break;
      case ChairSide.bottom:
        path.moveTo(size.width, 0);
        offset = const Offset(0, 0);
        clockwise = true;
        break;

    }

    path.arcToPoint(offset, radius: Radius.elliptical(size.width / 2, size.height / 2), clockwise: clockwise);

    path.close();

    return path;

  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final ChairSide side;

  const HalfCircleClipper({ required this. side});

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}
