import 'package:flutter/material.dart';
import 'package:restaurant_admin/pages/dashboard/widget/widget.dart';
import 'package:restaurant_admin/responsive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_admin/theme.dart';


class TotalRevenueSection extends StatelessWidget {
  const TotalRevenueSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: 20.h),
        Responsive(
          mobile: TotalRevenueCardSection(
           gridCrossCount: _size.width < 850 ? 1 : 2,
          ),
          tablet: TotalRevenueCardSection(),
          desktop: TotalRevenueCardSection(),
        ),
      ],
    );
  }
} 

class TotalRevenueCardSection extends StatelessWidget {
  TotalRevenueCardSection({Key? key, this.gridCrossCount}) : super(key: key);

  int? gridCrossCount = 2;
  var _height = 400;
  var _radius = 30.r;

  @override
  Widget build(BuildContext context) {
    return (gridCrossCount == 1)? ColumnTotalRevenue(context): RowTotalRevenue(context);
  }
  
  Widget RowTotalRevenue(BuildContext context){
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Container(
              height: 400,
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 10.h),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(_radius),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 1.0,
                    ),
                  ]
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only( left: 20.h),
                          child: Text(
                            "Total Revenue",
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textGrey.withOpacity(0.8),
                                fontSize: Responsive.isMobile(context)?16.sp: Responsive.isTablet(context)?14.sp:18.sp
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.w),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                          decoration: BoxDecoration(
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: Responsive.isMobile(context)?15.h: Responsive.isTablet(context)?15.h:20.h,
                                width: Responsive.isMobile(context)?15.h: Responsive.isTablet(context)?15.h:20.h,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20.r)
                                ),
                              ),
                              SizedBox(width: 5.w,),
                              Text(
                                "2022",
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?12.sp:16.sp
                                ),
                              ),
                              SizedBox(width: 20.w,),
                              Container(
                                height: Responsive.isMobile(context)?15.h: Responsive.isTablet(context)?15.h:20.h,
                                width: Responsive.isMobile(context)?15.h: Responsive.isTablet(context)?15.h:20.h,
                                decoration: BoxDecoration(
                                    color: Color(0xff23b6e6),
                                    borderRadius: BorderRadius.circular(20.r)
                                ),
                              ),
                              SizedBox(width: 5.w,),
                              Text(
                                "2023",
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?12.sp:18.sp
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.w,),
                  Expanded(child: RevenueGraph()),
                ],
              ),
            )),
        SizedBox(width: 20.w),
        Expanded(
            flex: 2,
            child: Container(
              height: 400,
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h, bottom: 10.h),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(_radius),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 1.0,
                    ),
                  ]
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only( left: 20.h),
                          child: Text(
                            "Reserve Table Chart",
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textGrey.withOpacity(0.8),
                                fontSize: Responsive.isMobile(context)?14.sp: Responsive.isTablet(context)?14.sp:18.sp
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0.w),
                        child: Material(
                          color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.r),
                          child: InkWell(
                            onTap: (){

                            },
                            borderRadius: BorderRadius.circular(10.r),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                              decoration: BoxDecoration(
                              ),
                              child: Text(
                                "Save Report",
                                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?12.sp:16.sp
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.w,),
                  Expanded(child: ReserveBarChart()),
                ],
              ),
            )),
      ],
    );
  }
  
  Widget ColumnTotalRevenue(BuildContext context){
    return Column(
      children: [
        Container(
          height: 250.h,
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 1.0,
                ),
              ]
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "Total Revenue",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textGrey.withOpacity(0.8),
                            fontSize: Responsive.isMobile(context)?14.sp: Responsive.isTablet(context)?14.sp:18.sp
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 10.w,
                          width: 10.w,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20.r)
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        Text(
                          "2022",
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 11.sp
                          ),
                        ),
                        SizedBox(width: 20.w,),
                        Container(
                          height: 10.w,
                          width: 10.w,
                          decoration: BoxDecoration(
                              color: Color(0xff23b6e6),
                              borderRadius: BorderRadius.circular(20.r)
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        Text(
                          "2023",
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 11.sp
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.w,),
              Expanded(child: RevenueGraph()),
            ],
          ),
        ),
        SizedBox(height: 20.w),
        Container(
          height: 250.h,
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 1.0,
                ),
              ]
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      child: Text(
                        "Reserve Table Chart",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textGrey.withOpacity(0.8),
                            fontSize: Responsive.isMobile(context)?14.sp: Responsive.isTablet(context)?14.sp:18.sp
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.w),
                    child: Material(
                      color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.r),
                      child: InkWell(
                        onTap: (){

                        },
                        borderRadius: BorderRadius.circular(10.r),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                          decoration: BoxDecoration(
                          ),
                          child: Text(
                            "Save Report",
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: Responsive.isMobile(context)?12.sp: Responsive.isTablet(context)?12.sp:16.sp
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.w,),
              Expanded(child: ReserveBarChart()),
            ],
          ),
        ),
      ],
    );
  }
}

