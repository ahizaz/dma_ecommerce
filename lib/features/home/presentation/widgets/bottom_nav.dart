import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class HomeBottomNav extends StatelessWidget {

  final int selectedIndex;

  final ValueChanged<int> onChanged;


  const HomeBottomNav({

    super.key,

    required this.selectedIndex,

    required this.onChanged,

  });


  @override
  Widget build(BuildContext context) {

    const items = [

      (
        Icons.home_rounded,
        'Home'
      ),

      (
        Icons.search_rounded,
        'Explore'
      ),

      (
        Icons.shopping_cart_outlined,
        'Cart'
      ),

      (
        Icons.chat_bubble_outline_rounded,
        'Chat'
      ),

      (
        Icons.person_outline_rounded,
        'Account'
      ),
    ];


    return Container(

      decoration:
          const BoxDecoration(

        color: Colors.white,

        border:
            Border(
          top:
              BorderSide(
            color:
                Color(0xFFE8EAEB),
          ),
        ),
      ),


      child: SafeArea(

        top: false,

        child: SizedBox(

          height: 57,

          child: Row(

            children:

                List.generate(

              items.length,

              (index) {

                final item =
                    items[index];

                final active =
                    selectedIndex ==
                        index;


                return Expanded(

                  child: InkWell(

                    onTap: () =>
                        onChanged(index),

                    child: Column(

                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: [

                        Icon(

                          item.$1,

                          size: 20,

                          color: active
                              ? AppColors.green
                              : const Color(
                                  0xFF7B8185,
                                ),
                        ),

                        const SizedBox(
                          height: 3,
                        ),

                        Text(

                          item.$2,

                          style: TextStyle(

                            fontSize: 8,

                            color: active
                                ? AppColors.green
                                : const Color(
                                    0xFF7B8185,
                                  ),

                            fontWeight: active
                                ? FontWeight.w700
                                : FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}