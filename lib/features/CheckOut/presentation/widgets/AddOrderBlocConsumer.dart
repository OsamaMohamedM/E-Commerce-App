import 'package:e_commerce/features/CheckOut/presentation/widgets/CheckOutViewBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../cubits/cubit/add_order_cubit.dart';
import '../../cubits/cubit/add_order_state.dart';

class AddOrderBlocConsumer extends StatelessWidget {
  const AddOrderBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("تم اضافة الطلب بنجاح")));
        } else if (state is AddOrderFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is AddOrderLoading, child: CheckOutViewBody());
      },
    );
  }
}
