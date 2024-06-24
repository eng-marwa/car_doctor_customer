import 'package:car_doctor/presentation/home/NavBarCubit.dart';
import 'package:car_doctor/presentation/my_account/MyAccount.dart';
import 'package:car_doctor/presentation/my_orders/MyOrdersScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/AppModule.dart';
import '../car/MyCarScreen.dart';
import '../offers/OffersScreen.dart';
import '../resources/ColorManager.dart';
import 'MyHomeScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationDestination> bottomNavItems = const <NavigationDestination>[
    NavigationDestination(
      icon: Icon(Icons.add_box_outlined),
      label: 'My Orders',
    ),
    NavigationDestination(
      icon: Icon(Icons.car_crash),
      label: 'My Car',
    ),
    NavigationDestination(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.percent),
      label: 'Offers',
    ),
    NavigationDestination(
      icon: Icon(Icons.person),
      label: 'My Account',
    ),
  ];

  List<Widget> bottomNavScreen = <Widget>[
    const MyOrdersScreen(),
    const MyCarScreen(),
    const MyHomeScreen(),
    const OffersScreen(),
    const MyAccountScreen()
  ];
  late NavBarCubit navBarCubit;

  @override
  void initState() {
    super.initState();
    navBarCubit = getIt<NavBarCubit>();
  }

  @override
  void dispose() {
    super.dispose();
    navBarCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavBarCubit>(
        create: (_) => navBarCubit,
        child: BlocBuilder<NavBarCubit, int>(builder: (context, state) {
          Widget bodyWidget;
          if (state >= 0 && state < bottomNavScreen.length) {
            bodyWidget = bottomNavScreen[state];
            print('state: $state');
          } else {
            bodyWidget = Text('Invalid state'); // Replace this with your default widget
          }
          return Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: ColorsManager.bg_gradient)),
                padding: const EdgeInsets.only(top: 30),
                child: bodyWidget,
              ),
              bottomNavigationBar: Stack(children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: ColorsManager.bg_bottomMenu,
                    ),
                  ),
                  height: 80,
                ),
                NavigationBar(
                  selectedIndex: state,
                  onDestinationSelected: (index) {
                    navBarCubit.changeIndex(index);
                  },
                  backgroundColor: Colors.transparent,
                  destinations: bottomNavItems,
                ),
              ]));
        }));
  }
}
