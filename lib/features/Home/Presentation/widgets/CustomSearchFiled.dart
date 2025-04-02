import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Core/utils/constants/assetsImages.dart';
import '../../../../Core/utils/styles/textStyles.dart';
import '../../../Search/cubits/cubit/search_cubit.dart';

class CustomSearchFiled extends StatelessWidget {
  final bool enable;
  const CustomSearchFiled({
    this.enable = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        enabled: enable,
        onChanged: (value) => context.read<SearchCubit>().search(value),
        decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            suffixIcon: IconButton(
              icon: SvgPicture.asset(Assets.assetsImagesSetting4),
              onPressed: () {},
            ),
            hintText: '...ابحث عن',
            hintStyle: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
            fillColor: Colors.white,
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder()));
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Color(0xff949D9E), width: 1),
    );
  }
}
