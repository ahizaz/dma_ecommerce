import 'package:dma_e_commerce/core/theme/app_colors.dart';
import 'package:dma_e_commerce/features/home/data/home_models.dart';
import 'package:flutter/material.dart';

class TradeOpportunities extends StatelessWidget {

  final List<TradeOpportunityModel>
      opportunities;

  const TradeOpportunities({
    super.key,
    required this.opportunities,
  });


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 156,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        itemCount:
            opportunities.length,

        separatorBuilder:
            (_, __) =>
                const SizedBox(width: 8),

        itemBuilder: (_, index) {

          return _TradeOpportunityCard(
            opportunity:
                opportunities[index],
          );
        },
      ),
    );
  }
}


class _TradeOpportunityCard
    extends StatelessWidget {

  final TradeOpportunityModel opportunity;

  const _TradeOpportunityCard({
    required this.opportunity,
  });


  @override
  Widget build(BuildContext context) {

    return Container(
      width: 235,

      padding:
          const EdgeInsets.all(10),

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
          // TOP
          // ==========================

          Row(
            children: [

              Container(
                width: 32,
                height: 32,

                decoration: BoxDecoration(
                  color:
                      AppColors.lightGreen,

                  borderRadius:
                      BorderRadius.circular(8),
                ),

                alignment:
                    Alignment.center,

                child: Text(
                  opportunity.flag,

                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),


              const SizedBox(width: 8),


              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      opportunity.productName,

                      maxLines: 1,

                      overflow:
                          TextOverflow.ellipsis,

                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight:
                            FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      '${opportunity.buyerCountry} Buyer',

                      style: const TextStyle(
                        color:
                            AppColors.muted,
                        fontSize: 7,
                      ),
                    ),
                  ],
                ),
              ),


              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 3,
                ),

                decoration: BoxDecoration(
                  color:
                      AppColors.lightOrange,

                  borderRadius:
                      BorderRadius.circular(5),
                ),

                child: Text(
                  opportunity.deadline,

                  style: const TextStyle(
                    color:
                        AppColors.orange,
                    fontSize: 6.5,
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),


          const SizedBox(height: 9),


          // ==========================
          // REQUIREMENT INFO
          // ==========================

          Row(
            children: [

              Expanded(
                child: _InfoItem(
                  title: 'Quantity',
                  value:
                      opportunity.quantity,
                ),
              ),

              Expanded(
                child: _InfoItem(
                  title: 'Budget',
                  value:
                      opportunity.budget,
                ),
              ),
            ],
          ),


          const Spacer(),


          // ==========================
          // BOTTOM
          // ==========================

          Row(
            children: [

              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 3,
                ),

                decoration: BoxDecoration(
                  color:
                      AppColors.lightBlue,

                  borderRadius:
                      BorderRadius.circular(5),
                ),

                child: Text(
                  opportunity.category,

                  style: const TextStyle(
                    color:
                        AppColors.blue,
                    fontSize: 6.5,
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),
              ),


              const Spacer(),


              Container(
                height: 25,

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 10,
                ),

                decoration: BoxDecoration(
                  color:
                      AppColors.green,

                  borderRadius:
                      BorderRadius.circular(7),
                ),

                alignment:
                    Alignment.center,

                child: const Text(
                  'Make Offer',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight:
                        FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// ==========================
// INFO ITEM
// ==========================

class _InfoItem extends StatelessWidget {

  final String title;
  final String value;

  const _InfoItem({
    required this.title,
    required this.value,
  });


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Text(
          title,

          style: const TextStyle(
            color:
                AppColors.muted,
            fontSize: 7,
          ),
        ),

        const SizedBox(height: 2),

        Text(
          value,

          maxLines: 1,

          overflow:
              TextOverflow.ellipsis,

          style: const TextStyle(
            fontSize: 8,
            fontWeight:
                FontWeight.w700,
          ),
        ),
      ],
    );
  }
}