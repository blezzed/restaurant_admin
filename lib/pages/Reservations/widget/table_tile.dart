import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/theme.dart';

class TableTile extends StatelessWidget {
  TableTile({Key? key, required this.reservation}) : super(key: key);

  final ReservationModel reservation;

  RxBool expand = false.obs;
  RxDouble height = 130.0.obs;

  RxDouble orderHeight = 360.0.obs;

  RxBool viewOrders = false.obs;
  RxBool openViewOrders = false.obs;

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

  Widget _buildOrderSection(BuildContext context){
    var headingTextStyle = Theme.of(context).textTheme.labelMedium!.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold
    );
    return Obx(() => AnimatedContainer(
      duration: Duration(milliseconds: 500),
      child: SizedBox(
        height: orderHeight.value.h,
        width: double.maxFinite,
        child: ListView(
          padding: EdgeInsets.only(top: 0.h),
          children: [
            DataTable(
              dataRowMaxHeight: 80.h,
              horizontalMargin: 0,
              columnSpacing: 0,
              columns: [
                DataColumn(label: Text("Items", style: headingTextStyle,)),
                DataColumn(label: Text("Qty", style: headingTextStyle)),
                DataColumn(label: Text("T-Price", style: headingTextStyle)),
              ],
              rows: _createRows(context),
            ),
          ],
        ),
      ),
    ));
  }

  List<DataRow> _createRows(BuildContext context) {
    return reservation.cart
        .map((cart) => DataRow(cells: [
      DataCell(Container(
        width: 210.w,
        child: Row(
          children: [
            Container(
              height: 60.h,
              width: 55.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          cart.product!.img!
                      )
                  )
              ),
            ),
            SizedBox(width: 10.w,),
            Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.product!.category!.name.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 12.sp,
                        color: Colors.lightBlue
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: 140.w
                    ),
                    child: Text(
                      cart.product!.name!,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: cart.product!.stars!,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15.w,
                    ignoreGestures: true,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0.w),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: AppColors.yellowColor,
                      size: 8.w,
                    ),
                    onRatingUpdate: (rating) {
                    },
                  )
                ],
              ),
            )
          ],
        ),
      )),
      DataCell(Container(
        width: 40.w,
        child: Center(child: Text(
            cart.quantity.value.toString(),
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis
            )
        )),
      )),
      DataCell(Container(
        width: 60.w,
        child: Text(
            "\$" + (cart.quantity.value * cart.product!.price!).toStringAsFixed(2),
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis
            )
        ),
      ))
    ]))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: (){
        expand.value = !expand.value;
        openViewOrders.value = !openViewOrders.value;
        if(viewOrders.isTrue){
          viewOrders.value = false;
        }
        height.value = expand.isTrue? 500: 130;
      },
      child: AnimatedContainer(
        onEnd: (){
          if(viewOrders.isFalse && openViewOrders.isTrue){
            viewOrders.value = true;
          }
        },
        duration: const Duration(milliseconds: 500),
        height: height.value.h ,
        margin: EdgeInsets.all(10.h),
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(30.r)
        ),
        child: Column(
          children: [
            Row(
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
                        "${reservation.customer!.name} ${reservation.customer!.surname}",
                        maxLines: 2,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                      Text(
                        "${reservation.status.value.name}".toUpperCase(),
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
                                "${reservation.people}",
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
                                "${reservation.tableNumber}",
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
                          "${reservation.slot}",
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 12.sp
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                _buildTable(context, chairs: reservation.people!),
              ],
            ),
            viewOrders.isTrue? _buildOrderSection(context): SizedBox(),
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

extension on VoidCallback {
  Future<void> delayed(Duration duration) =>
      Future.delayed(duration, this);
}
