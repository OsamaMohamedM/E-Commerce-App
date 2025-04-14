import 'package:e_commerce/Core/AppRoutes.dart';
import 'package:e_commerce/Core/utils/widgets/CustomAppBar.dart';
import 'package:e_commerce/features/Cart/view_model/cubit/cart_cubit.dart';
import 'package:e_commerce/features/CheckOut/cubits/checkOutCubit/cubit/check_out_cubit.dart';
import 'package:e_commerce/features/CheckOut/presentation/widgets/CheckOutSteps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../Core/Services/Payment.dart';
import '../../../../Core/utils/widgets/CustomButton.dart';
import '../../cubits/AddOrderCubit/add_order_cubit.dart';
import 'CustomPageView.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> autovalidateModeNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    autovalidateModeNotifier.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
      child: Column(
        children: [
          CustomAppBar(tittle: getAppBarName()),
          const SizedBox(
            height: 16,
          ),
          CheckOutSteps(
            onTap: (index) {
              if (index == 0) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastLinearToSlowEaseIn);
              } else if (index == 1) {
                if (context
                        .read<CheckOutCubitCubit>()
                        .orderEntity
                        .payWithCash !=
                    null) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastLinearToSlowEaseIn);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('اختر طريقة الدفع'),
                    ),
                  );
                }
              } else {
                AddressFormValidate(context);
              }
            },
            pageController: pageController,
            currentIndex: currentIndex,
          ),
          SizedBox(height: 10),
          CheckOutStepsPageView(
            onPressed: (int val) {
              currentIndex = val;
            },
            autovalidateModeNotifier: autovalidateModeNotifier,
            formKey: formKey,
            pageController: pageController,
          ),
          CustomButton(
              buttonName: getNextButtonText(),
              onPressed: () {
                if (currentIndex == 0) {
                  ShippingSectionValidate(context);
                } else if (currentIndex == 1) {
                  AddressFormValidate(context);
                } else {
                  if (!context
                      .read<CheckOutCubitCubit>()
                      .orderEntity
                      .payWithCash!) {
                    final order =
                        context.read<CheckOutCubitCubit>().orderEntity;
                   bool isSuccess = Payment(orderEntity: order).handlePayment(context);
                    if (isSuccess) {
                      context.read<CartCubit>().clearCart();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('تم اضافة الطلب بنجاح'),
                        ),
                      );
                      GoRouter.of(context).push(AppRoutes.homeView);
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('حدث خطأ في الدفع'),
                        ),
                      );
                    }
                  } else {
                    final order =
                        context.read<CheckOutCubitCubit>().orderEntity;
                    context.read<AddOrderCubit>().addOrder(order);
                    context.read<CartCubit>().clearCart();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم اضافة الطلب بنجاح'),
                      ),
                    );
                    GoRouter.of(context).push(AppRoutes.homeView); 
                   
                  }
                }
              })
        ],
      ),
    );
  }

  void AddressFormValidate(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<CheckOutCubitCubit>().addAddressShipping();
      pageController.animateToPage(currentIndex + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('يرجي ادخال بيانات العنوان بشكل صحيح')));
    }
  }

  void ShippingSectionValidate(BuildContext context) {
    if (context.read<CheckOutCubitCubit>().orderEntity.payWithCash != null) {
      pageController.animateToPage(currentIndex + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجي اختيار طريقة الدفع'),
        ),
      );
      autovalidateModeNotifier.value = AutovalidateMode.always;
    }
  }

  String getNextButtonText() {
    switch (currentIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        if (context.read<CheckOutCubitCubit>().orderEntity.payWithCash!) {
          return 'الدفع عند الاستلام';
        } else {
          return 'الدفع عبر PayPal';
        }
      default:
        return 'التالي';
    }
  }

  String getAppBarName() {
    switch (currentIndex) {
      case 0:
        return 'الشحن';
      case 1:
        return 'العنوان';
      case 2:
        return 'الدفع';
      default:
        return 'التالي';
    }
  }
}
