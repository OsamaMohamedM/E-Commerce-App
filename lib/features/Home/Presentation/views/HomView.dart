import 'package:e_commerce/Core/Data/Model/Product.dart';
import 'package:e_commerce/features/Home/Presentation/widgets/HomeViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Data/Repo/ProductRepo.dart';
import '../../../../Core/Services/get_it.dart';
import '../../views_model/productCubit/bloc/ProductCubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width - 32;
    return BlocProvider(
      create: (context) => ProductCubit(getIt.get<ProductRepo>())..getProducts(),
      child: HomeViewBody(itemWidth: itemWidth),
    );
  }
}
