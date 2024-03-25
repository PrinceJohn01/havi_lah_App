import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:havi_lah/core/utils/size_utils.dart';
import 'package:havi_lah/screens/homepagefour_screen/testing.dart';

import '../../core/homeController/home_controller.dart';
import '../../core/utils/image_constant.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';

class HomepagefourScreen extends StatelessWidget {
  const HomepagefourScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 864.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgRectangle114,
                height: 864.v,
                width: 374.h,
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14.v),
                  decoration: AppDecoration.fillBlackC.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderBL30,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomAppBar(
                        leadingWidth: 93.h,
                        leading: AppbarLeadingImage(
                          imagePath: ImageConstant.imgWhatsappImage20230801,
                          margin: EdgeInsets.only(left: 23.h),
                        ),
                        title: AppbarTitle(
                          text: "HAV’I-LAH\nHOME FINANCE",
                          margin: EdgeInsets.only(left: 3.h),
                        ),
                      ),
                      SizedBox(height: 43.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 26.h),
                          child: Text(
                            "BUYING PROPERTIES\nMADE EASY",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 23.h,
                          right: 18.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 38.v,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 38.v,
                                      width: 89.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          9.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Take a tour",
                                          style: CustomTextStyles.bodyMedium15,
                                        ),
                                        CustomImageView(
                                          imagePath: "assets/images/img_4.png",
                                          height: 9.v,
                                          width: 8.h,
                                          margin: EdgeInsets.only(
                                            left: 4.h,
                                            top: 5.v,
                                            bottom: 5.v,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 12.v,
                                bottom: 10.v,
                              ),
                              child: Text(
                                "Welcome, Prince",
                                style: CustomTextStyles.bodyMediumMontserrat,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 29.v),
                      GetBuilder(
                          init: HomeController(),
                          builder: (viewModel) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18.h),
                              child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 171.v,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 17.h,
                                  crossAxisSpacing: 17.h,
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: viewModel.homeItems.length,
                                itemBuilder: (context, index) {
                                  Map item = viewModel.homeItems[index];
                                  return InkWell(
                                    onTap: () {
                                      if (index == 0) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Testing(d: item),
                                            ));
                                      } else if (index == 3) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Testing(d: item),
                                            ));
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 9.h,
                                        vertical: 13.v,
                                      ),
                                      decoration: AppDecoration
                                          .gradientBlueToIndigo
                                          .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder19,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                            imagePath: item["images"],
                                            height: 48.adaptSize,
                                          ),
                                          SizedBox(height: 10.v),
                                          SizedBox(
                                            width: 99.h,
                                            child: Text(
                                              item["textHeader"],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodyLarge,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 133.h,
                                            child: Text(
                                              item["textSub"],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: theme.textTheme.bodySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
