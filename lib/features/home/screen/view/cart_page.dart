// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magenta/core/di/di_container.dart';
import 'package:magenta/features/home/controller/cart_cubit/cubit/cart_cubit.dart';

// 🌎 Project imports:
import 'package:magenta/features/home/screen/widget/cart_widget.dart';
import 'package:magenta/features/home/screen/widget/payment_success_dialog.dart';
import 'package:magenta/gen/assets.gen.dart';

// 🌎 Project imports:

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final listKey = GlobalKey<AnimatedListState>();
  final bloc = getIt<CartCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Container(
                width: context.width,
                height: 66,
                color: context.colorScheme.shadow,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LayoutTextBuy(
                        price: state.items.isNotEmpty
                            ? state.items
                                .map((item) =>
                                    int.parse((item.price).split('.')[0]))
                                .reduce((a, b) => a + b)
                            : 0,
                        title: 'TOTAL PRICE: ',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              state.items.isNotEmpty
                                  ? bloc.completePayCart(
                                      items: state.items,
                                      onSuccess: () {
                                        AnimatedDialog.show(context,
                                            child:
                                                const PaymentSuccessDialog());
                                      })
                                  : null;
                            },
                            child: Row(
                              children: [
                                AppText(
                                  'next',
                                  color: context.colorScheme.primary,
                                ),
                                2.horizontalSpace,
                                AppImage.asset(
                                  Assets.icons.arrowRight,
                                  color: context.colorScheme.primary,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              appBar: AppBarWidget(
                title: AppText(
                  'Imagination Cart',
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: state.items.isNotEmpty
                  ? ListView(
                      children: List.generate(
                        state.items.length,
                        (index) => CartWidget(
                            image: state.items[index].image,
                            category: state.items[index].category,
                            name: state.items[index].name,
                            quantity: state.items[index].quantity,
                            price: int.parse(
                                (state.items[index].price).split('.')[0]),
                            onTapTrash: () {}),
                      ),
                    )
                  : Center(
                      child: Column(
                        children: [
                          AppImage.asset(Assets.icons.brokenHeart),
                          10.verticalSpace,
                          AppText.headingMedium(
                            'There Is No Item',
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    ));
        },
      ),
    );
  }
}

class LayoutTextBuy extends StatelessWidget {
  const LayoutTextBuy(
      {super.key,
      required this.price,
      required this.title,
      this.color,
      this.textStyle});
  final int price;
  final String title;
  final Color? color;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          title,
          style: textStyle,
          color: color ?? context.colorScheme.onPrimary,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              String dots = '.' * (constraints.maxWidth ~/ 3.5);
              return AppText(
                dots,
                style: textStyle,
                color: color ?? context.colorScheme.onPrimary,
                overflow: TextOverflow.clip,
                maxLines: 1,
              );
            },
          ),
        ),
        AppText(
          '\$ $price',
          style: textStyle,
          color: color ?? context.colorScheme.onPrimary,
        ),
      ],
    );
  }
}
