
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_admin/pages/order_details/index.dart';
import 'package:restaurant_admin/pages/order_details/widget/widget.dart';
import 'package:restaurant_admin/theme.dart';

class OrderDetailsPage extends GetView<OrderDetailsController> {
  const OrderDetailsPage({Key? key}) : super(key: key);
  
  Widget _buildHeader(BuildContext context){
    var order = controller.order;
    return Container(
      height: 200.h,
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 8.w),
      child: Row(
        children: [
          Container(
            width: 150.w,
            height: 200.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.9),
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.85,
                image: AssetImage(
                  order.customer!.avatar!
                )
              )
            ),
          ),
          SizedBox(width: 15.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                constraints: BoxConstraints(
                    maxWidth: 140.w
                ),
                child: Text(
                  "${order.customer!.name} ${order.customer!.surname}",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 14.h,
                  ),
                  SizedBox(width: 5.w,),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 140.w
                    ),
                    child: RichText(
                    maxLines: 2,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: 12.sp,
                          overflow: TextOverflow.ellipsis
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: order.location,
                            recognizer: TapGestureRecognizer()..onTap = (){
                              controller.switchCards();
                            },),
                      ],
                    ),
                  )
                  )
                ],
              ),
              Container(
                color: Theme.of(context).primaryColor,
                height: 1.h,
                width: 150.w,
              ),
              Text(
                "#${order.id}",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).primaryColor
                ),
              ),
              Text(
                "23 jan 23, 12:30",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: AppColors.paraColor,
                    fontSize: 12.sp,
                ),
              ),
              Container(
                color: Theme.of(context).primaryColor,
                height: 1.h,
                width: 150.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  statusOrderButton(context, order),
                  SizedBox(width: 10.w,),
                  GestureDetector(
                    onTap: (){
                      controller.deleteOrder();
                    },
                    child: Container(
                      height: 30.h,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          "Delete",
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.red,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHistory(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Row(
        children: [
          Text(
            "\$120.00",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              fontSize: 14.sp
            ),
          ),
          SizedBox(width: 10.w,),
          Text(
            "Total",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w200,
              color: AppColors.paraColor,
              fontSize: 14.sp
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSection(BuildContext context){
    var headingTextStyle = Theme.of(context).textTheme.labelMedium!.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold
    );
    return SizedBox(
      height: 380.h,
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
    );
  }

  List<DataRow> _createRows(BuildContext context) {
    return controller.order.cart
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

  Widget _buildCircleAnimation (BuildContext context) {
    controller.counterClockwiseRotationController..reset()..forward.delayed(Duration(seconds: 1));
    return AnimatedBuilder(
        animation: controller.counterClockwiseRotationController,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateZ(
                  controller.counterClockwiseRotationAnimation.value
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                    animation: controller.flipAnimation,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()
                          ..rotateY(
                              controller.flipAnimation.value
                          ),
                        child: ClipPath(
                          clipper: const HalfCircleClipper(side: CircleSide.left),
                          child: Container(
                            height: 30,
                            width: 30,
                            color: Colors.teal,
                          ),
                        ),
                      );
                    }
                ),
                AnimatedBuilder(
                    animation: controller.flipAnimation,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()
                          ..rotateY(
                              controller.flipAnimation.value
                          ),
                        child: ClipPath(
                          clipper: const HalfCircleClipper(side: CircleSide.right),
                          child: Container(
                            height: 30,
                            width: 30,
                            color: Colors.teal.shade200,
                          ),
                        ),
                      );
                    }
                ),

              ],
            ),
          );
        }
    );
  }

  Widget _buildLocationView (BuildContext context){

    return Container(
      width: double.maxFinite,
      height: 380.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/map.jpeg"
          )
        )
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Positioned(
            child: ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                height: 270.h,
                width: double.maxFinite,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    gradient: SweepGradient(
                        startAngle: 0,
                        endAngle: 5,
                        stops: const [0.1,0.5,0.8],
                        colors: [Colors.teal.shade900,Colors.teal,Colors.teal.shade700]
                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(1, 1)
                      )
                    ]
                ),
              ),
            ),
          ),
          Positioned(
              left: 15.w,
              right: 15.w,
              top: 35.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      )),
                  controller.state.deleteOrder.value? _buildCircleAnimation(context): SizedBox(),
                ],
              )
          ),
          Container(
            margin: EdgeInsets.only(top: 80.h),
            padding: EdgeInsets.all(10.w),
            width: double.maxFinite,
            child: Column(
              children: [
                _buildHeader(context),
                SizedBox(height: 10.h,),
                _buildHistory(context),
                SizedBox(height: 10.h,),
                AnimatedBuilder(
                    animation: controller.animationController,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..rotateY(
                              controller.animation.value
                          ),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 380.h,
                          width: double.maxFinite,
                          margin: EdgeInsets.only(left: 5.w, right: 5.w),
                          decoration: BoxDecoration(
                              color: controller.state.containerColor.value,
                              borderRadius: BorderRadius.circular(10.r)
                          ),
                          child: Column(
                            children: [
                             controller.state.flipContainer.value?
                              AnimatedSwitcher(
                                  duration: Duration(milliseconds: 500),
                                  child: controller.state.orderView.value?
                                  SizedBox(key: Key("1"), child: _buildOrderSection(context)):
                                  SizedBox(key: Key("2"),
                                  )
                              ) :
                              AnimatedSwitcher(
                                  duration: Duration(milliseconds: 500),
                                  child: controller.state.locationView.value?
                                  SizedBox(key: Key("3"), child: _buildLocationView(context)):
                                  SizedBox(key: Key("4"),
                                  )
                              ),

                            ],
                          ),
                        ),
                      );
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    var path = Path();
    //(0,0)  point 1
    path.lineTo(0, h-40); // point 2
    path.quadraticBezierTo(w*0.20, h, w*0.25, h - 70.h);
    path.quadraticBezierTo(w*0.4, h-230.h, w*0.65, h - 200.h);
    path.quadraticBezierTo(w * 0.95, h-160.h, w, h-230.h);
    path.lineTo(w, 0); // point 5
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}

enum CircleSide {
  left, right,
}

extension ToPath on CircleSide {
  Path toPath(Size size){
    var path = Path();

    late Offset offset;
    late bool clockwise;

    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }

    path.arcToPoint(offset, radius: Radius.elliptical(size.width / 2, size.height / 2), clockwise: clockwise);

    path.close();

    return path;

  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final CircleSide side;

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
