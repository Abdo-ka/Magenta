// ignore_for_file: public_member_api_docs, sort_constructors_first

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

// 🌎 Project imports:
import 'package:magenta/config/common/enum/enums.dart';
import 'package:magenta/config/theme/color_scheme.dart';
import 'package:magenta/core/di/di_container.dart';
import 'package:magenta/core/utils/toaster.dart';
import 'package:magenta/features/home/controller/cart_cubit/cubit/cart_cubit.dart';
import 'package:magenta/features/home/controller/home_bloc/home_bloc.dart';
import 'package:magenta/features/home/data/model/cart_model.dart';
import 'package:magenta/features/home/screen/view/details_page_loading.dart';
import 'package:magenta/gen/assets.gen.dart';

@RoutePage()
class DetailsItemPage extends StatefulWidget {
  DetailsItemPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<DetailsItemPage> createState() => _DetailsItemPageState();
}

class _DetailsItemPageState extends State<DetailsItemPage> {
  final bloc = getIt<HomeBloc>();
  final cartcubit = getIt<CartCubit>();
  final ValueNotifier<int> price = ValueNotifier(0);
  @override
  void initState() {
    bloc.add(GetSignalProductEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return BlocProvider(
            create: (context) => cartcubit,
            child: Scaffold(
              floatingActionButton: ButtonWidget(
                width: 204.w,
                height: 50.h,
                radius: 30.r,
                prefixIcon: AppImage.asset(Assets.icons.add),
                spaceBetween: 20,
                backgroundColor: context.colorScheme.shadow,
                foregroundColor: context.colorScheme.onPrimary,
                onPressed: () {
                  price.value != 0
                      ? {
                          cartcubit.addToCart(
                            item: CartModel(
                              image: state.signalProduct.product?.image
                                      ?.originalUrl ??
                                  '',
                              quantity: price.value.toString(),
                              productId:
                                  state.signalProduct.product?.id.toString() ??
                                      '',
                              price: state.signalProduct.product?.price ?? '',
                              name: state.signalProduct.product?.name ?? '',
                              category: '',
                            ),
                          ),
                          Toaster.showDefault('item add contuniue shopping'),
                        }
                      : Toaster.showDefault('Should add At Least one Item');
                },
                text: 'ADD TO CART',
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              body: state.signalProductsStatus == Status.loading
                  ? const DetailsPageLoading()
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        20.verticalSpace,
                        Container(
                          width: 335.w,
                          height: 670.h,
                          decoration: BoxDecoration(
                            color: context.colorScheme.gray,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: context.colorScheme.primary),
                            boxShadow: [
                              BoxShadow(
                                color: context.colorScheme.gray.darken(.2),
                                blurRadius: 2,
                                offset: const Offset(0.0, 0.75),
                              ),
                              BoxShadow(
                                color: context.colorScheme.gray.darken(.2),
                                blurRadius: 2,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButtonWidget(
                                      onPressed: () =>
                                          context.router.maybePop(),
                                      child: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: context.colorScheme.primary,
                                        size: 21,
                                      ),
                                    ),
                                    AppImage.asset(Assets.icons.flowerVector),
                                    AppImage.asset(
                                      Assets.icons.favourite,
                                      color: context.colorScheme.shadow,
                                    ),
                                  ],
                                ),
                                15.verticalSpace,
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: AppImage.network(
                                      state.signalProduct.product?.image
                                              ?.originalUrl ??
                                          '',
                                      fit: BoxFit.cover,
                                      width: 250.w,
                                      height: 215.h,
                                    ),
                                  ),
                                ),
                                15.verticalSpace,
                                AppText.headlineMedium(
                                  state.signalProduct.product?.name ?? '',
                                  color: context.colorScheme.primary,
                                ),
                                15.verticalSpace,
                                AppText(
                                    'You can plot each fragrance family s popularity percentage over the years, showing trends in consumer preferences. This could be based on market research data, sales figures, or expert opinions on the dominant trends in the perfume industry.'),
                                15.verticalSpace,
                                Row(
                                  children: [
                                    AppText.bodyLarge(
                                      '" Imagine your world "',
                                      color: context.colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    5.horizontalSpace,
                                    AppText.bodySmall(
                                      'by: reda HR',
                                      fontWeight: FontWeight.bold,
                                      textScaleFactor: 0.6,
                                    )
                                  ],
                                ),
                                AppText(
                                  'Save Now: \$${state.signalProduct.product?.price}',
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(fontFamily: 'Praise'),
                                ),
                                15.verticalSpace,
                                ListenableBuilder(
                                  listenable: price,
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText.headlineSmall(
                                          '\$${int.parse((state.signalProduct.product?.price ?? '0').split('.')[0]) * price.value}',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        AppIncrement(
                                          initialValue: 0,
                                          onChanged: (index) {
                                            price.value = index;
                                          },
                                        )
                                      ],
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
