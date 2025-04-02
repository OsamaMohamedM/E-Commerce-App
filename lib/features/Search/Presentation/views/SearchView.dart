import 'package:flutter/material.dart';
import '../../../../Core/Data/Model/ProductEntity.dart';
import '../widgets/SearchViewBody.dart';

class SearchView extends StatelessWidget {
   final List<ProductEntity> productEntityList;
  const SearchView({super.key, required this.productEntityList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SearchViewBody(productEntityList: productEntityList,));
  }
}
