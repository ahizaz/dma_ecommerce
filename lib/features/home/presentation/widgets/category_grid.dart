import 'package:dma_e_commerce/features/home/data/home_models.dart';
import 'package:flutter/material.dart';



class CategoryGrid extends StatelessWidget {

  final List<CategoryModel> categories;


  const CategoryGrid({

    super.key,

    required this.categories,

  });


  @override
  Widget build(BuildContext context) {

    final visible =
        categories.take(7).toList();


    return GridView.builder(

      shrinkWrap: true,

      physics:
          const NeverScrollableScrollPhysics(),

      itemCount:
          visible.length + 1,

      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(

        crossAxisCount: 4,

        crossAxisSpacing: 7,

        mainAxisSpacing: 8,

        childAspectRatio: .84,
      ),

      itemBuilder:
          (context, index) {

        if (index == visible.length) {

          return const _AllCategoryCard();
        }


        final item =
            visible[index];


        return _CategoryCard(
          item: item,
        );
      },
    );
  }
}


class _CategoryCard
    extends StatelessWidget {

  final CategoryModel item;


  const _CategoryCard({
    required this.item,
  });


  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(10),

        border:
            Border.all(
          color:
              const Color(0xFFEAEDEE),
        ),
      ),

      child: Column(

        children: [

          Expanded(

            child: ClipRRect(

              borderRadius:
                  const BorderRadius.vertical(
                top: Radius.circular(10),
              ),

              child: Image.network(

                item.imageUrl,

                width:
                    double.infinity,

                fit:
                    BoxFit.cover,

                errorBuilder:
                    (_, __, ___) {

                  return const Icon(
                    Icons.image_outlined,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ),


          Padding(

            padding:
                const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 2,
            ),

            child: Text(

              item.name,

              maxLines: 1,

              overflow:
                  TextOverflow.ellipsis,

              textAlign:
                  TextAlign.center,

              style:
                  const TextStyle(
                fontSize: 9,
                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _AllCategoryCard
    extends StatelessWidget {

  const _AllCategoryCard();


  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: BoxDecoration(

        color:
            const Color(0xFFEAF7F1),

        borderRadius:
            BorderRadius.circular(10),
      ),

      child: const Column(

        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          Icon(

            Icons.grid_view_rounded,

            color:
                Color(0xFF009B62),

            size: 28,
          ),

          SizedBox(height: 5),

          Text(

            'View All',

            style:
                TextStyle(
              fontSize: 9,
              fontWeight:
                  FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}