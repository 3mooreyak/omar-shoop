import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/bindings/product_binding.dart';
import 'package:omar_apps/logic/controller/cart_controller.dart';
import 'package:omar_apps/logic/controller/product_controller.dart';
import 'package:omar_apps/model/product_models.dart';
import 'package:omar_apps/utils/theme.dart';
import 'package:omar_apps/view/screens/product_details_screen.dart';
import 'package:omar_apps/view/widget/text_utils.dart';

import '../../../logic/controller/category_controller.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;
  CategoryItems({
    required this.categoryTitle,
    super.key,
  });

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text(categoryTitle),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        ),
        body: Obx(() {
          if (categoryController.isAllCategory.value) {
            return Center(
              child: CircularProgressIndicator(
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
            );
          } else {
            return GridView.builder(
              itemCount: categoryController.categoryList.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 4.0,
                maxCrossAxisExtent: 400,
              ),
              itemBuilder: (context, index) {
                return buildCardItems(
                  image: categoryController.categoryList[index].image,
                  price: categoryController.categoryList[index].price,
                  rate: categoryController.categoryList[index].rating.rate,
                  productId: categoryController.categoryList[index].id,
                  productModels: categoryController.categoryList[index],
                  onTap: () {
                    Get.to(
                      () => ProductDetailsScreen(
                        productModels: categoryController.categoryList[index],
                      ),
                    );
                  },
                );
              },
            );
          }
        }));
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              )
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFaforites(productId);
                      },
                      icon: controller.isFavorites(productId)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.AddProductToCart(productModels);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 3,
                          right: 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: '$rate',
                              color: Colors.white,
                              underLine: TextDecoration.none,
                            ),
                            Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
