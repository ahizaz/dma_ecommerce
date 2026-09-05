import 'package:dma_e_commerce/core/theme/app_colors.dart';
import 'package:dma_e_commerce/features/home/data/home_models.dart';
import 'package:flutter/material.dart';

class FeaturedProducts extends StatelessWidget {
  final List<FeaturedProductModel> products;

  const FeaturedProducts({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 188,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) =>
            const SizedBox(width: 9),
        itemBuilder: (_, index) {
          return _FeaturedProductCard(
            product: products[index],
          );
        },
      ),
    );
  }
}


class _FeaturedProductCard
    extends StatelessWidget {

  final FeaturedProductModel product;

  const _FeaturedProductCard({
    required this.product,
  });


  @override
  Widget build(BuildContext context) {

    return Container(
      width: 180,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(11),

        border: Border.all(
          color: AppColors.border,
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          // ==========================
          // PRODUCT IMAGE
          // ==========================

          Stack(
            children: [

              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(
                  top: Radius.circular(11),
                ),

                child: Image.network(
                  product.imageUrl,

                  height: 91,

                  width: double.infinity,

                  fit: BoxFit.cover,

                  errorBuilder:
                      (_, __, ___) {

                    return Container(
                      height: 91,

                      color:
                          Colors.grey.shade200,

                      child: const Icon(
                        Icons.image_outlined,
                      ),
                    );
                  },
                ),
              ),


              // TAG

              Positioned(
                top: 6,
                left: 6,

                child: Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),

                  decoration: BoxDecoration(
                    color: AppColors.green,

                    borderRadius:
                        BorderRadius.circular(5),
                  ),

                  child: Text(
                    product.tag,

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight:
                          FontWeight.w700,
                    ),
                  ),
                ),
              ),


              // FAVORITE

              Positioned(
                right: 6,
                top: 6,

                child: Container(
                  width: 25,
                  height: 25,

                  decoration:
                      const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),

                  child: const Icon(
                    Icons.favorite_border_rounded,
                    size: 15,
                    color: AppColors.muted,
                  ),
                ),
              ),
            ],
          ),


          // ==========================
          // PRODUCT INFO
          // ==========================

          Padding(
            padding:
                const EdgeInsets.fromLTRB(
              8,
              6,
              8,
              6,
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  product.name,

                  maxLines: 1,

                  overflow:
                      TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),


                const SizedBox(height: 3),


                // PRICE

                Row(
                  children: [

                    Text(
                      product.price,

                      style: const TextStyle(
                        color:
                            AppColors.green,
                        fontSize: 11,
                        fontWeight:
                            FontWeight.w900,
                      ),
                    ),

                    const SizedBox(width: 3),

                    Text(
                      product.unit,

                      style: const TextStyle(
                        color:
                            AppColors.muted,
                        fontSize: 7,
                      ),
                    ),
                  ],
                ),


                const SizedBox(height: 3),


                // SUPPLIER

                Text(
                  product.supplier,

                  maxLines: 1,

                  overflow:
                      TextOverflow.ellipsis,

                  style: const TextStyle(
                    color:
                        AppColors.muted,
                    fontSize: 7,
                  ),
                ),


                const SizedBox(height: 3),


                // RATING + VIEW

                Row(
                  children: [

                    const Icon(
                      Icons.star_rounded,
                      size: 11,
                      color: Color(0xFFFFB300),
                    ),

                    const SizedBox(width: 2),

                    Text(
                      '${product.rating}',

                      style:
                          const TextStyle(
                        fontSize: 8,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),

                    const Spacer(),


                    Container(
                      padding:
                          const EdgeInsets
                              .symmetric(
                        horizontal: 7,
                        vertical: 4,
                      ),

                      decoration:
                          BoxDecoration(
                        color:
                            AppColors.lightGreen,

                        borderRadius:
                            BorderRadius.circular(6),
                      ),

                      child: const Text(
                        'View',

                        style: TextStyle(
                          color:
                              AppColors.green,
                          fontSize: 7,
                          fontWeight:
                              FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}