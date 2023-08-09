
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_admin/common/entities/entities.dart';
import 'package:restaurant_admin/common/widget/widget.dart';
import 'package:restaurant_admin/pages/add_food/index.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_admin/theme.dart';

class AddFoodPage extends GetView<AddFoodController> {
  const AddFoodPage({Key? key}) : super(key: key);

  Widget _buildAddProductPhoto(context){
    return Obx(() => Stack(
      children: [
        Container(
          width: 130.w,
          height: 130.w,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.all(Radius.circular(100.r)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0,1)
                )
              ]
          ),
          child: controller.state.photo.value !=null?
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(60.w)),
            child: Image(
              fit: BoxFit.cover,
              image: FileImage(
                  controller.state.photo.value!
              ),
            ),
          )
          : Container(
            padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.r),
              ),
              child: SvgPicture.asset(
                "assets/icons/background_image.svg",
                colorFilter: ColorFilter.mode(Theme.of(context).primaryColor.withOpacity(0.5), BlendMode.srcIn),
                height: 24.h,
              ),
          ),
        ),
        Positioned(
          bottom: 0.w,
          right: 0.w,
          height: 35.w,
          child: GestureDetector(
              onTap: (){
                //_showPicker(context);
              },
              child: Container(
                padding: EdgeInsets.all(7.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(40.w)),
                ),
                child: SvgPicture.asset(
                  "assets/icons/add_menu.svg",
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  height: 20.h,
                ),
              )
          ),
        )
      ],
    ));
  }

  Widget _buildNameTextFormField({
    context,
    required String hintText,
    required TextEditingController controller,
    TextInputType? keybordType,
    int maxLines = 1
  }){
    return Container(
      margin: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20.w),
          border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.5)),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.name,
        maxLines: maxLines,
        textCapitalization: TextCapitalization.words,
        style: Theme.of(context).textTheme.labelSmall,
        decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none
        ),
      ),
    );
  }

  Widget _buildDropDownFormField(context){
    return Container(
      margin: EdgeInsets.only(top: 15.h, bottom: 15.h, left: 10.w, right: 10.w),
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20.w),
          border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.5)),
      ),
      child: DropdownButtonFormField(
        hint: const Text(
            "select category"
        ),
        decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none
        ),
        borderRadius: BorderRadius.circular(20.w),
        items: <Category>{Category.fruits,Category.food,Category.drinks,}.map<DropdownMenuItem<Category>>((Category value) {
          return DropdownMenuItem<Category>(
            value: value,
            child: Text(
                value.name,
                style: Theme.of(context).textTheme.labelSmall
            ),
          );
        }).toList(),
        onChanged: (Category? value) {
          print(value);
          controller.category = value ;
        },

      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            expandedHeight: AddFoodController.kExpandedHeight,
            leading: Material(
              borderRadius: BorderRadius.circular(5.r),
              child: InkWell(
                borderRadius: BorderRadius.circular(5.r),
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(7.h),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.0,
              titlePadding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
              background: Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: controller.state.appBarHeroTitleOpacity.value,
                  child: _buildAddProductPhoto(context),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: controller.state.appBarTitleOpacity.value,
                    child: Text(
                      "Create Food Item",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Theme.of(context).secondaryHeaderColor,
                        child: InkWell(
                          onTap: (){

                          },
                          borderRadius: BorderRadius.circular(10.r),
                          child: Container(
                            padding: EdgeInsets.all(7.h),
                            child: Text(
                              "Create",
                              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: Colors.grey[800]
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: Column(
                children: [
                  _buildNameTextFormField(
                    hintText: "Name",
                    context: context,
                    controller: controller.nameController,
                    keybordType: TextInputType.name,
                  ),
                  _buildNameTextFormField(
                      hintText: "Description",
                      context: context,
                      controller: controller.descriptionController,
                      keybordType: TextInputType.multiline,
                      maxLines: 5
                  ),
                  _buildNameTextFormField(
                    hintText: "Price in USD",
                    context: context,
                    controller: controller.priceController,
                    keybordType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                  _buildDropDownFormField(context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
