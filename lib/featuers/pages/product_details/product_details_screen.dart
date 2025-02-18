import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../domain/entities/ProductsResponseEntity.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int productCounter = 0;
  int selectedColor = -1;
  int selectedSize = -1;

  List<int> sizes = [37, 38, 39, 40];
  List<Color> color = [
    Colors.red,
    Colors.blueAccent,
    Colors.green,
    Colors.yellow,
  ];

  List<String> productImages = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ProductEntity;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Product Details',
            style: AppStyles.semi20Primary,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColors.primaryColor,
                  size: 30,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSlideshow(
                  initialPage: 0,
                  indicatorColor: AppColors.primaryColor,
                  indicatorBottomPadding: 15.h,
                  indicatorPadding: 8.w,
                  indicatorRadius: 5,
                  indicatorBackgroundColor: AppColors.whiteColor,
                  isLoop: true,
                  autoPlayInterval: 3000,
                  height: 260.h,
                  children: args.images!.map((url) {
                    return Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: CachedNetworkImage(
                          width: double.infinity,
                          height: 220.h,
                          fit: BoxFit.cover,
                          imageUrl: url,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: AppColors.yellowColor,
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: AppColors.redColor,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 8.h,
                          right: 8.w,
                          child: CircleAvatar(
                            backgroundColor: AppColors.whiteColor,
                            radius: 20.r,
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    //Todo: add to favorite
                                  },
                                  color: AppColors.primaryColor,
                                  padding: EdgeInsets.zero,
                                  iconSize: 30.r,
                                  // Adjust icon size as needed
                                  icon: Icon(
                                    Icons.favorite_border_rounded,
                                    color: AppColors.primaryColor,
                                  )),
                            ),
                          )),
                    ]);
                  }).toList(),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      args.title ?? '',
                      style: AppStyles.medium18PrimaryDark,
                    )),
                    Text(
                      "EGP ${args.price}",
                      style: AppStyles.medium18PrimaryDark,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        child: Text(
                          "${args.sold} Sold",
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.medium14PrimaryDark,
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        color: AppColors.yellowColor,
                        size: 30,
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Text(
                          '${args.ratingsAverage} (${args.ratingsQuantity})',
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.regular14PrimaryDark,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                productCounter--;
                                setState(() {});
                              },
                              child: Icon(
                                Icons.remove_circle_outline,
                                size: 20.w,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            SizedBox(
                              width: 18.w,
                            ),
                            AutoSizeText(
                              '$productCounter',
                              style: AppStyles.medium18White,
                            ),
                            SizedBox(
                              width: 18.w,
                            ),
                            InkWell(
                              onTap: () {
                                productCounter++;
                                setState(() {});
                              },
                              child: Icon(
                                Icons.add_circle_outline_rounded,
                                color: AppColors.whiteColor,
                                size: 20.w,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 16.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: AppStyles.medium18PrimaryDark,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    ReadMoreText(
                      args.description ?? '',
                      style: AppStyles.medium14LightPrimary,
                      trimMode: TrimMode.Line,
                      trimLines: 2,
                      colorClickableText: AppColors.primaryColor,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total price',
                          style: AppStyles.medium18PrimaryDark.copyWith(
                              color: AppColors.primaryColor.withOpacity(.6)),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'EGP ${args.price}',
                          style: AppStyles.medium18PrimaryDark,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 33.w,
                    ),
                    Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17.r),
                              ),
                              backgroundColor: AppColors.primaryColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 14.h),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_shopping_cart_rounded,
                                  color: AppColors.whiteColor,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                AutoSizeText(
                                  'Add To Cart',
                                  style: AppStyles.medium20White,
                                ),
                                SizedBox(
                                  width: 27.w,
                                )
                              ],
                            )))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
