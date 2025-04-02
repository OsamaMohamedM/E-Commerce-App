import 'package:e_commerce/Core/Data/Model/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/utils/widgets/CustomAppBar.dart';
import '../../../Home/Presentation/widgets/CustomSearchFiled.dart';
import '../../cubits/cubit/search_cubit.dart';
import 'SearchResultsView.dart';

class SearchViewBody extends StatelessWidget {
 final List<ProductEntity> productEntityList;
  const SearchViewBody({super.key, required this.productEntityList});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(productEntityList),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomAppBar(
                tittle: 'البحث', visibleLeading: true, visibleTrailing: false),
            const SizedBox(height: 16),
            CustomSearchFiled(enable: true,),
            const SizedBox(height: 16),
            Expanded(child: SearchResults()),
          ],
        ),
      ),
    );
  }
}
