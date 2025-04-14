import 'package:e_commerce/features/Home/views_model/productCubit/bloc/ProductCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Data/Repo/ProductRepo.dart';
import '../../../../Core/Services/get_it.dart';
import '../widgets/FavoriteItemsViewBody.dart';

class FavoriteItemsView extends StatelessWidget {
  final void Function(int index) onTabChange;
  const FavoriteItemsView({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(getIt.get<ProductRepo>())..getProducts(),
      child: Scaffold(
        body: FavoriteItemsViewBody(
          onTabChange: onTabChange,
        ),
      ),
    );
  }
}
