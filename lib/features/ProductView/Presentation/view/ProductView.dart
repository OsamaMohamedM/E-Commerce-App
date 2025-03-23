import 'package:e_commerce/features/Home/views_model/productCubit/bloc/ProductCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Data/Repo/ProductRepo.dart';
import '../../../../Core/Services/get_it.dart';
import '../widgets/ProductViewBody.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductCubit(
          getIt.get<ProductRepo>(),
        )..getProducts(),
        child: ProductViewBody(),
      ),
    );
  }
}
