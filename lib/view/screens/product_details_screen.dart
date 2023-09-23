import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omar_apps/model/product_models.dart';

import '../widget/productDetails/add_cart.dart';
import '../widget/productDetails/clothes_info.dart';
import '../widget/productDetails/image_sliders.dart';
import '../widget/productDetails/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({
    required this.productModels,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl: productModels.image,
              ),
              ClothesInfo(
                title: productModels.title,
                productId: productModels.id,
                rate: productModels.rating.rate,
                descripition: productModels.description,
              ),
              SizeList(),
              AddCart(
                price: productModels.price,
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
