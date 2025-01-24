import 'package:flutter/material.dart';
import 'package:online_lecture_smwu/screen/commerce/model/product_model.dart';
import 'package:online_lecture_smwu/screen/commerce/util.dart';

class ProductHorizontal extends StatelessWidget {
  const ProductHorizontal({required this.productList, super.key});

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        // physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          ProductModel product = productList[index];
          return GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    product.image,
                    width: 150,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text('${Util.nFormat.format(product.price)}원'),
                  Text('평점 ${product.reviewRating} (${product.reviewCount})'),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 20);
        },
        itemCount: productList.length,
      ),
    );
  }
}
