import 'package:e_commerce/features/Cart/Data/models/CartEntity.dart';
import 'package:e_commerce/features/Cart/Presentation/views/CartView.dart';
import 'package:e_commerce/features/Cart/view_model/cubit/cart_cubit.dart';
import 'package:e_commerce/features/Profile/presentation/views/EditProfileDataView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utils/widgets/CustomBottomNavigationBar.dart';
import '../../../ProductView/Presentation/view/ProductView.dart';
import '../../../Profile/presentation/views/FavouritItems.dart';
import '../../../Profile/presentation/views/OrderHistory.dart';
import '../../../Profile/presentation/views/Profile.dart';
import 'HomView.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  void onTabChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
  final List<Widget> pages = [
    HomeView(),
    ProductView(),
    CartView(),
    ProfileView(onTabChange :onTabChange),
    EditProfileDataView(onTabChange :onTabChange),
    OrderHistory(onTabChange :onTabChange),
    FavoriteItemsView(onTabChange: onTabChange,),
  ];
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTabChange: onTabChange,
      ),
      body: MainViewBloc(currentIndex: currentIndex, pages: pages),
    );
  }
}

class MainViewBloc extends StatelessWidget {
  const MainViewBloc({
    super.key,
    required this.currentIndex,
    required this.pages,
  });

  final int currentIndex;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("تم الاضافة للسلة")));
        }
      },
      child: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: pages,
        ),
      ),
    );
  }
}
