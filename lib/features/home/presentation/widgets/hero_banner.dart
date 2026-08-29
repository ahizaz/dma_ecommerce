import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class HeroBanner extends StatelessWidget {

  const HeroBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 138,

      clipBehavior:
          Clip.antiAlias,

      decoration:
          BoxDecoration(
        color: AppColors.green,
        borderRadius:
            BorderRadius.circular(10),
      ),

      child: Stack(

        children: [

          Positioned(

            right: -5,
            top: 0,
            bottom: 0,
            width: 185,

            child: Image.network(

              'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800',

              fit: BoxFit.cover,

              errorBuilder:
                  (_, __, ___) {

                return Container(
                  color:
                      AppColors.darkGreen,
                );
              },
            ),
          ),


          Positioned(

            left: 14,
            top: 18,

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                const Text(

                  'Everything\n'
                  'for Your\n'
                  'Business',

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 20,

                    height: 1.02,

                    fontWeight:
                        FontWeight.w800,
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),


                FilledButton(

                  onPressed: () {},

                  style:
                      FilledButton.styleFrom(

                    backgroundColor:
                        AppColors.orange,

                    foregroundColor:
                        Colors.white,

                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 7,
                    ),

                    minimumSize:
                        Size.zero,
                  ),

                  child: const Text(

                    'Shop & Trade',

                    style:
                        TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}