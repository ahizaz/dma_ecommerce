import 'package:dma_e_commerce/features/home/presentation/providers/home_provider.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/bottom_nav.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/category_grid.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/deals_section.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/hero_banner.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/search_bar.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/section_header.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/seller_banner.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/top_header.dart';
import 'package:dma_e_commerce/features/home/presentation/widgets/trade_actions.dart';
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
        child: Column(
          children: [
            // =========================
            // HEADER
            // =========================
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Trade',
                        style: TextStyle(
                          color: Color(0xFF009B62),
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const Text(
                        'Bridge',
                        style: TextStyle(
                          color: Color(0xFF22282C),
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
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
                        children: [
                          HeroBanner(),
                          const SizedBox(height: 8),
                          TradeActions(),
                          const SizedBox(height: 11),

                          SectionHeader(
                            title: 'Browse Categories',

                            onViewAll: () {},
                          ),
                          const SizedBox(height: 7),
                          CategoryGrid(categories: state.categories),
                          SizedBox(height: 10),
                          SectionHeader(
                            title: "Today's Best Deals",

                            onViewAll: () {},
                          ),

                          const SizedBox(height: 7),
                          DealsSection(deals: state.deals),
                          const SizedBox(height: 9),
                          const SellerBanner(),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomNav(
        selectedIndex: state.selectedBottomIndex,
        onChanged: (index) {
          ref.read(homeProvider.notifier).changeBottomNav(index);
        },
      ),
    );
  }
}
