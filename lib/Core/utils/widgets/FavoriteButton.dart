import 'package:e_commerce/Core/Services/SharedPrefrences.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';

class FavoriteButton extends StatefulWidget {
  final String productId;

  const FavoriteButton({super.key, required this.productId});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
  
    final favList = SharedPreferencesHelper.getStringList(FavProduct) ?? [];
    setState(() {
      isFavorite = favList.contains(widget.productId);
    });
  }

  Future<void> _toggleFavorite() async {
    final favList = SharedPreferencesHelper.getStringList(FavProduct) ?? [];
    if (isFavorite) {
      favList.remove(widget.productId);
    } else {
      favList.add(widget.productId);
    }
     SharedPreferencesHelper.setStringList(FavProduct, favList);
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _toggleFavorite,
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
    );
  }
}
