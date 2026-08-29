import 'package:dma_e_commerce/features/home/data/home_models.dart';

class HomeRepository {
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const [
      CategoryModel(
        name: 'Fisheries',
        imageUrl:
            'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=300',
      ),
      CategoryModel(
        name: 'Clothing',
        imageUrl:
            'https://images.unsplash.com/photo-1445205170230-053b83016050?w=300',
      ),
      CategoryModel(
        name: 'Agriculture',
        imageUrl:
            'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=300',
      ),

      CategoryModel(
        name: 'Electronics',
        imageUrl:
            'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=300',
      ),
      CategoryModel(
        name: 'Machinery',
        imageUrl:
            'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=300',
      ),
      CategoryModel(
        name: 'Food',
        imageUrl:
            'https://images.unsplash.com/photo-1542838132-92c53300491e?w=300',
      ),
      CategoryModel(
        name: 'Home & Living',
        imageUrl:
            'https://images.unsplash.com/photo-1616486338812-3dadae4b4ace?w=300',
      ),
    ];
  }

  Future<List<DealModel>> getDeals() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const[
    DealModel(name: 'Fresh Shrimp (Tiger)',
   imageUrl: 'https://images.unsplash.com/photo-1565680018434-b513d5e5fd47?w=700',
   price: 'BDT 950',
    oldPrice: 'BDT 1,120',
     discount: '15% OFF',
      rating: 4.6,
       reviews:128,
       ),
          DealModel(
        name: 'Premium Cotton Shirts',

        imageUrl:
            'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=700',

        price: 'BDT 1,450',

        oldPrice: 'BDT 1,810',

        discount: '20% OFF',

        rating: 4.7,

        reviews: 96,
      ),

    ];
  }
}
