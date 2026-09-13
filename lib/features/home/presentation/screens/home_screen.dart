import 'package:dma_e_commerce/features/home/presentation/providers/home_provider.dart';
import 'package:dma_e_commerce/features/home/presentation/screens/account_screen.dart';
import 'package:dma_e_commerce/features/home/presentation/screens/cart_screen.dart';
import 'package:dma_e_commerce/features/home/presentation/screens/chat_screen.dart';
import 'package:dma_e_commerce/features/home/presentation/screens/explore_screen.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/bottom_nav.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/category_grid.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/deals_section.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/feature_products.dart';

import 'package:dma_e_commerce/features/home/presentation/widgets/hero_banner.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/search_bar.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/section_header.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/seller_banner.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/top_header.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/trade_actions.dart';

import 'package:dma_e_commerce/features/home/presentation/widgets/trade_opportunity.dart';
import 'package:dma_e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,

        child: state.selectedBottomIndex == 1
            ? ExploreScreen(
                categories: state.categories,
                products: state.featuredProducts,
                deals: state.deals,
              )
            : state.selectedBottomIndex == 2
            ? CartScreen(
                products: state.cartProducts,
                quantities: state.cartQuantities,
                onRemoveProduct: (product) {
                  ref.read(homeProvider.notifier).removeFromCart(product);
                },
                onIncreaseQuantity: (product) {
                  ref.read(homeProvider.notifier).increaseQuantity(product);
                },
                onDecreaseQuantity: (product) {
                  ref.read(homeProvider.notifier).decreaseQuantity(product);
                },
                onClearCart: () {
                  ref.read(homeProvider.notifier).clearCart();
                },
                onBrowseProducts: () {
                  ref.read(homeProvider.notifier).changeBottomNav(1);
                },
              )
            : state.selectedBottomIndex == 4
            ? const AccountScreen()
            : state.selectedBottomIndex == 3
            ? const ChatScreen()
            : Column(
                children: [
                  // =========================
                  // HEADER
                  // =========================
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),

                    child: Column(
                      children: [
                        // LOGO
                        Row(
                          children: [
                            const Text(
                              'Made in ',
                              style: TextStyle(
                                color: AppColors.green,
                                fontSize: 19,
                                fontWeight: FontWeight.w900,
                              ),
                            ),

                            const Text(
                              'Bangladesh',
                              style: TextStyle(
                                color: AppColors.red,
                                fontSize: 19,
                                fontWeight: FontWeight.w900,
                              ),
                            ),

                            const Spacer(),
                          ],
                        ),

                        const TopHeader(),

                        const SizedBox(height: 9),

                        const HomeSearchBar(),
                      ],
                    ),
                  ),

                  // =========================
                  // BODY
                  // =========================
                  Expanded(
                    child: state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : RefreshIndicator(
                            onRefresh: () {
                              return ref.read(homeProvider.notifier).loadHome();
                            },

                            child: ListView(
                              padding: const EdgeInsets.fromLTRB(
                                10,
                                10,
                                10,
                                12,
                              ),

                              children: [
                                // =========================
                                // HERO
                                // =========================
                                const HeroBanner(),

                                const SizedBox(height: 8),

                                // =========================
                                // TRADE ACTIONS
                                // =========================
                                const TradeActions(),

                                const SizedBox(height: 11),

                                // =========================
                                // FEATURED PRODUCTS
                                // =========================
                                SectionHeader(
                                  title: 'Featured Products',

                                  onViewAll: () => ref
                                      .read(homeProvider.notifier)
                                      .changeBottomNav(1),
                                ),

                                const SizedBox(height: 7),

                                FeaturedProducts(
                                  products: state.featuredProducts,
                                  favoriteProducts: state.favoriteProducts,
                                  onToggleFavorite: (productName) {
                                    ref
                                        .read(homeProvider.notifier)
                                        .toggleFavorite(productName);
                                  },
                                  onAddToCart: (product) {
                                    ref
                                        .read(homeProvider.notifier)
                                        .addToCart(product);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${product.name} added to cart',
                                        ),
                                        duration: const Duration(seconds: 2),
                                        action: SnackBarAction(
                                          label: 'VIEW CART',
                                          onPressed: () => ref
                                              .read(homeProvider.notifier)
                                              .changeBottomNav(2),
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                const SizedBox(height: 12),

                                // =========================
                                // TRADE OPPORTUNITIES
                                // =========================
                                SectionHeader(
                                  title: 'Trade Opportunities',

                                  onViewAll: () => ref
                                      .read(homeProvider.notifier)
                                      .changeBottomNav(1),
                                ),

                                const SizedBox(height: 7),

                                TradeOpportunities(
                                  opportunities: state.tradeOpportunities,
                                ),

                                const SizedBox(height: 12),

                                // =========================
                                // BROWSE CATEGORIES
                                // =========================
                                SectionHeader(
                                  title: 'Browse Categories',

                                  onViewAll: () => ref
                                      .read(homeProvider.notifier)
                                      .changeBottomNav(1),
                                ),

                                const SizedBox(height: 7),

                                CategoryGrid(categories: state.categories),

                                const SizedBox(height: 10),

                                // =========================
                                // TODAY'S BEST DEALS
                                // =========================
                                SectionHeader(
                                  title: "Today's Best Deals",

                                  onViewAll: () => ref
                                      .read(homeProvider.notifier)
                                      .changeBottomNav(1),
                                ),

                                const SizedBox(height: 7),

                                DealsSection(
                                  deals: state.deals,
                                  onAddToCart: (deal) {
                                    ref
                                        .read(homeProvider.notifier)
                                        .addDealToCart(deal);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${deal.name} added to cart',
                                        ),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                ),

                                const SizedBox(height: 9),

                                // =========================
                                // SELLER BANNER
                                // =========================
                                const SellerBanner(),
                              ],
                            ),
                          ),
                  ),
                ],
              ),
      ),

      // =========================
      // BOTTOM NAVIGATION
      // =========================
      bottomNavigationBar: HomeBottomNav(
        selectedIndex: state.selectedBottomIndex,

        onChanged: (index) {
          ref.read(homeProvider.notifier).changeBottomNav(index);
        },
        cartCount: state.cartProducts.length,
      ),
    );
  }
}
