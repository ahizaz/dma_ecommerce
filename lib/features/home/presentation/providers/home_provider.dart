import 'package:dma_e_commerce/features/home/data/home_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/home_repository.dart';



// Repository Provider
final homeRepositoryProvider =
    Provider<HomeRepository>((ref) {

  return HomeRepository();

});



// HOME STATE


class HomeState {

  final bool isLoading;

  final List<CategoryModel> categories;

  final List<DealModel> deals;

  final int selectedBottomIndex;


  const HomeState({

    this.isLoading = true,

    this.categories = const [],

    this.deals = const [],

    this.selectedBottomIndex = 0,

  });


  HomeState copyWith({

    bool? isLoading,

    List<CategoryModel>? categories,

    List<DealModel>? deals,

    int? selectedBottomIndex,

  }) {

    return HomeState(

      isLoading:
          isLoading ?? this.isLoading,

      categories:
          categories ?? this.categories,

      deals:
          deals ?? this.deals,

      selectedBottomIndex:
          selectedBottomIndex ??
              this.selectedBottomIndex,

    );
  }
}


// ==========================
// RIVERPOD PROVIDER
// ==========================

final homeProvider =
    NotifierProvider<HomeNotifier, HomeState>(
  HomeNotifier.new,
);


// ==========================
// NOTIFIER
// ==========================

class HomeNotifier
    extends Notifier<HomeState> {

  late HomeRepository repository;


  @override
  HomeState build() {

    repository =
        ref.read(homeRepositoryProvider);

    Future.microtask(
      loadHome,
    );

    return const HomeState();
  }


  // ==========================
  // LOAD HOME DATA
  // ==========================

  Future<void> loadHome() async {

    state = state.copyWith(
      isLoading: true,
    );


    final results = await Future.wait([

      repository.getCategories(),

      repository.getDeals(),

    ]);


    state = state.copyWith(

      isLoading: false,

      categories:
          results[0]
              as List<CategoryModel>,

      deals:
          results[1]
              as List<DealModel>,

    );
  }


  // ==========================
  // BOTTOM NAV
  // ==========================

  void changeBottomNav(
      int index) {

    state =
        state.copyWith(
      selectedBottomIndex: index,
    );
  }
}