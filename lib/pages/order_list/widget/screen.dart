import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/pages/order_list/index.dart';
import 'package:restaurant_admin/theme.dart';

class OrderListScreen extends GetView<OrderListController> {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tableHeaderStyle = Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 12.sp,
                              color: Theme.of(context).scaffoldBackgroundColor);
    var tableCellStyle = Theme.of(context).textTheme.labelSmall!.copyWith( fontSize: 12.sp,);

    return Obx(() => Scaffold(
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            expandedHeight: OrderListController.kExpandedHeight,
            leading: const SizedBox(),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.0,
              titlePadding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
              background: Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: controller.state.appBarHeroTitleOpacity.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your Orders",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 26.sp
                        ),
                      ),
                      SizedBox(height: 5.h,),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: AppColors.paraColor
                          ),
                          children: <TextSpan>[
                            TextSpan(text: '3 ', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.textGrey.withOpacity(0.9), fontWeight: FontWeight.bold)),
                            TextSpan(text: 'new orders  ', ),
                            TextSpan(text: '5 ', style: Theme.of(context).textTheme.labelSmall!.copyWith(color: AppColors.textGrey.withOpacity(0.9), fontWeight: FontWeight.bold)),
                            TextSpan(text: 'on delivery  ', ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: controller.state.appBarTitleOpacity.value,
                    child: Text(
                      "Your Orders",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10.r),
                        child: InkWell(
                          onTap: (){

                          },
                          borderRadius: BorderRadius.circular(10.r),
                          child: Container(
                            padding: EdgeInsets.all(7.h),
                            child: SvgPicture.asset(
                              "assets/icons/Search.svg",
                              colorFilter: const ColorFilter.mode(AppColors.textGrey, BlendMode.srcIn),
                              height: 20.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Material(
                        borderRadius: BorderRadius.circular(5.r),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(5.r),
                          onTap: (){
                            controller.controlMenu();
                          },
                          child: Container(
                            padding: EdgeInsets.all(7.h),
                            child: SvgPicture.asset(
                              "assets/icons/menu_navigation.svg",
                              colorFilter: ColorFilter.mode(AppColors.textGrey.withOpacity(0.9), BlendMode.srcIn),
                              height: 20.h,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.maxFinite,
              height: 640.h,
              padding: EdgeInsets.only(left: 10.w, right: 0.w),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: SizedBox(
                      width: 90.w,
                      child: Column(
                        children: [
                          Table(
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            columnWidths: {
                              0: FlexColumnWidth(1.2),
                            },
                            children: [
                              TableRow(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                      border: Border(right: BorderSide(
                                          color: Theme.of(context).scaffoldBackgroundColor
                                      ))
                                  ),
                                  children: [
                                    Center(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 15.w),
                                        child: Text(
                                          "Order ID",
                                          style: tableHeaderStyle,
                                        ),
                                      ),
                                    ),

                                  ]
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h,),
                          Container(
                            height: 550.h,
                            child: NotificationListener<ScrollNotification>(
                              onNotification: (ScrollNotification scrollInfo) {
                                controller.tableScrollController1.jumpTo(scrollInfo.metrics.pixels);
                                return false;
                              },
                              child: SingleChildScrollView(
                                controller: controller.tableScrollController2,
                                child: Table(
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  columnWidths: {
                                    0: FlexColumnWidth(1.2),
                                  },
                                  children: controller.idDataContents,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        width: 600.w,
                        child: Column(
                          children: [
                            Table(
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              columnWidths: {
                                0: FlexColumnWidth(2),
                                1: FlexColumnWidth(2),
                                2: FlexColumnWidth(2),
                                3: FlexColumnWidth(1),
                                4: FlexColumnWidth(1.5),
                              },
                              children: [
                                TableRow(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                    ),
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 10.w),
                                        child: Text(
                                          "Date",
                                          style: tableHeaderStyle,
                                        ),
                                      ),
                                      Text(
                                        "Customer Name",
                                          style: tableHeaderStyle,
                                      ),
                                      Text(
                                        "Location",
                                        style: tableHeaderStyle,
                                      ),
                                      Text(
                                        "Amount",
                                        style: tableHeaderStyle,
                                      ),
                                      Center(
                                        child: Text(
                                          "Status Order",
                                          style: tableHeaderStyle,
                                        ),
                                      ),

                                    ]
                                ),
                              ],
                            ),
                            SizedBox(height: 30.h,),
                            Container(
                              height: 550.h,
                              child: SingleChildScrollView(
                                controller: controller.tableScrollController1,
                                physics: NeverScrollableScrollPhysics(),
                                child: Table(
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  columnWidths: {
                                    0: FlexColumnWidth(2),
                                    1: FlexColumnWidth(2),
                                    2: FlexColumnWidth(2),
                                    3: FlexColumnWidth(1),
                                    4: FlexColumnWidth(1.5),
                                  },
                                  children: controller.dataContents
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  TableRow tableContents (){
    return TableRow();
  }

  Widget _statusOrderButton(BuildContext context, StatusOrder status){
    var color = status == StatusOrder.newOrder ? Colors.orange:
                status == StatusOrder.onDelivery ? Colors.blue: Colors.green;

    var text = status == StatusOrder.newOrder ? "New Order":
                status == StatusOrder.onDelivery ? "On Delivery": "Delivered";

    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.w, horizontal: 12.w),
      decoration: BoxDecoration(
          color: color.shade100,
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
          color: color,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
