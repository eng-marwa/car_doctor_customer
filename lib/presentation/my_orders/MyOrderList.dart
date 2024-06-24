import 'package:car_doctor/domain/repository/order_repository/OrderRepository.dart';
import 'package:car_doctor/presentation/my_orders/MyOrderCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../di/AppModule.dart';
import '../../utils/ToastType.dart';
import '../resources/dim_manager.dart';
import '../widgets/CustomMyOrderListItem.dart';
import '../widgets/ToastWidget.dart';


class MyOrderList extends StatelessWidget {
  final MyOrderCubit orderCubit = getIt<MyOrderCubit>();

  MyOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrderCubit, MyOrderState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return BlocBuilder<MyOrderCubit, MyOrderState>(
          builder: (context, state) {
            if (state is MyOrderLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MyOrderLoaded) {
              return state.orders.isNotEmpty
                  ? Container(
                    margin: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      bottom: 30.0 +
                         navBarDimen, // Add the height of the navigation bar to the bottom padding
                    ),
                    child: ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                      itemCount: state.orders.length,
                      itemBuilder: (context, index) {
                        final order = state.orders[index];
                        return CustomMyOrderListItem(order);
                      },
                    ),
                  )
                  : const Center(
                      child: Text('No Orders'),
                    );
            } else if(state is MyOrderError) {
              return Center(
                child: Text((state as MyOrderError).message),
              );
            }else{
              return SizedBox.shrink();
            }
          },
        );
      },
    );
  }
}
