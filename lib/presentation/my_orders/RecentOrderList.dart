import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/AppModule.dart';
import 'RecentOrderCubit.dart';
import 'RecentOrderState.dart';
import 'RecentRepOrderListItem.dart';

class RecentOrderList extends StatelessWidget {
 final acceptedOrderCubit = getIt<RecentOrderCubit>();

 RecentOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RecentOrderCubit, RecentOrderState>(
          builder: (context, state) {
            if (state is RecentOrderLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RecentOrderLoaded) {
              return state.orders.isNotEmpty
                  ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  final order = state.orders[index];
                  return RecentRepOrderListItem(order);
                },
              )
                  : const Center(
                child: Text('No Orders'),
              );
            } else {
              return const Center(
                child: Text('Error'),
              );
            }
          },
        );

  }
}
