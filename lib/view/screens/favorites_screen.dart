import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/logic/controller/product_controller.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(
        () {
          if (controller.FavoritesList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/heart.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Please add your favorite product',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18),
                  )
                ],
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                return buildFavItems(
                  image: controller.FavoritesList[index].image,
                  price: controller.FavoritesList[index].price,
                  title: controller.FavoritesList[index].title,
                  productid: controller.FavoritesList[index].id,
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.FavoritesList.length,
            );
          }
        },
      ),
    );
  }

  Widget buildFavItems({
    required String image,
    required double price,
    required String title,
    required int productid,
  }) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$ $price',
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  controller.manageFaforites(productid);
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
