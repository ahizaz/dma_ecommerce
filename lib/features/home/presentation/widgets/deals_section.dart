import 'package:dma_e_commerce/features/home/data/home_models.dart';
import 'package:flutter/material.dart';



import '../../../../core/theme/app_colors.dart';

class DealsSection extends StatelessWidget {

  final List<DealModel> deals;


  const DealsSection({

    super.key,

    required this.deals,

  });


  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: 175,

      child: ListView.separated(

        scrollDirection:
            Axis.horizontal,

        itemCount:
            deals.length,

        separatorBuilder:
            (_, __) =>
                const SizedBox(width: 8),

        itemBuilder:
            (_, index) {

          return _DealCard(
            deal: deals[index],
          );
        },
      ),
    );
  }
}


class _DealCard
    extends StatelessWidget {

  final DealModel deal;


  const _DealCard({
    required this.deal,
  });


  @override
  Widget build(BuildContext context) {

    return Container(

      width: 142,

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(9),

        border:
            Border.all(
          color:
              AppColors.border,
        ),
      ),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Stack(

            children: [

              ClipRRect(

                borderRadius:
                    const BorderRadius.vertical(
                  top: Radius.circular(9),
                ),

                child: Image.network(

                  deal.imageUrl,

                  width:
                      double.infinity,

                  height: 80,

                  fit:
                      BoxFit.cover,

                  errorBuilder:
                      (_, __, ___) {

                    return Container(

                      height: 80,

                      color:
                          Colors.grey.shade200,

                      child: const Icon(
                        Icons.image_outlined,
                      ),
                    );
                  },
                ),
              ),


              Positioned(

                top: 5,
                left: 5,

                child: Container(

                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 3,
                  ),

                  decoration:
                      BoxDecoration(
                    color:
                        AppColors.orange,
                    borderRadius:
                        BorderRadius.circular(4),
                  ),

                  child: Text(

                    deal.discount,

                    style:
                        const TextStyle(
                      color:
                          Colors.white,
                      fontSize: 7,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),


          Padding(

            padding:
                const EdgeInsets.fromLTRB(
              7,
              5,
              7,
              6,
            ),

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(

                  deal.name,

                  maxLines: 1,

                  overflow:
                      TextOverflow.ellipsis,

                  style:
                      const TextStyle(
                    fontSize: 9,
                    fontWeight:
                        FontWeight.w600,
                  ),
                ),


                const SizedBox(height: 2),


                const Text(

                  '1kg (20-30 pcs/kg)',

                  style:
                      TextStyle(
                    fontSize: 7,
                    color:
                        AppColors.muted,
                  ),
                ),


                const SizedBox(height: 4),


                Row(

                  children: [

                    Text(

                      deal.price,

                      style:
                          const TextStyle(
                        color:
                            AppColors.green,
                        fontSize: 10,
                        fontWeight:
                            FontWeight.w800,
                      ),
                    ),

                    const SizedBox(width: 4),

                    Flexible(

                      child: Text(

                        deal.oldPrice,

                        overflow:
                            TextOverflow.ellipsis,

                        style:
                            const TextStyle(
                          color:
                              AppColors.muted,
                          fontSize: 7,
                          decoration:
                              TextDecoration
                                  .lineThrough,
                        ),
                      ),
                    ),
                  ],
                ),


                const SizedBox(height: 3),


                Row(

                  children: [

                    const Icon(

                      Icons.star_rounded,

                      color:
                          Color(0xFFFFB300),

                      size: 11,
                    ),

                    Text(

                      ' ${deal.rating} (${deal.reviews})',

                      style:
                          const TextStyle(
                        fontSize: 7,
                      ),
                    ),

                    const Spacer(),


                    Container(

                      width: 22,

                      height: 22,

                      decoration:
                          const BoxDecoration(
                        color:
                            Color(0xFFDDF6E9),
                        shape:
                            BoxShape.circle,
                      ),

                      child: const Icon(

                        Icons.add_rounded,

                        color:
                            AppColors.green,

                        size: 17,
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