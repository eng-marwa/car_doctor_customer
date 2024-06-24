import 'package:car_doctor/domain/usecases/car/EditCar.dart';
import 'package:car_doctor/presentation/car/AddCarScreen.dart';
import 'package:car_doctor/presentation/my_account/MyAccount.dart';
import 'package:car_doctor/presentation/my_account/OurTeamsScreen.dart';
import 'package:car_doctor/presentation/my_account/PolicyScreen.dart';
import 'package:car_doctor/presentation/my_account/UserInformationScreen.dart';
import 'package:car_doctor/presentation/my_account/ContactUsScreen.dart';
import 'package:car_doctor/presentation/offers/OffersScreen.dart';
import 'package:car_doctor/presentation/view/auth/register/RegisterScreen.dart';
import 'package:car_doctor/presentation/view/auth/verify/OTPVerificationScreen.dart';
import 'package:car_doctor/presentation/view/order/BillOrderScreen.dart';
import 'package:car_doctor/presentation/my_orders/MyOrdersScreen.dart';
import 'package:car_doctor/presentation/view/order/OrderTrackingScreen.dart';
import 'package:car_doctor/presentation/view/representative/RequestScreen.dart';
import 'package:flutter/material.dart';

import '../../data/model/UserData.dart';
import '../car/CarInformationScreen.dart';
import '../car/EditCarScreen.dart';
import '../car/MyCarScreen.dart';
import '../home/HomeScreen.dart';
import '../my_account/ChangePasswordScreen.dart';
import '../my_account/CommonQuestionScreen.dart';
import '../my_account/CustomerMapScreen.dart';
import '../my_orders/OrderDetailsScreen.dart';
import '../services/CarCareScreen.dart';
import '../services/CarServicesScreen.dart';
import '../services/ChangeOilScreen.dart';
import '../services/EmergencyScreen.dart';
import '../view/auth/login/LoginScreen.dart';
import '../view/order/PayScreen.dart';
import '../view/representative/AssessementScreen.dart';
import '../view/splash/SplashScreen.dart';

class RouteManager {
  static const splash = '/';
  static const main = '/main';
  static const login = '/login';
  static const register = '/register';
  static const pay = '/pay';
  static const account = '/account';
  static const otp = '/otp';
  static const userInformation = '/userInformation';
  static const String order = '/order';
  static const String bill = '/bill';
  static const String offers = '/offers';
  static const String request = '/request';
  static const String representative = '/representative';
  static const String home = '/home';
  static const String emergency = '/emergency';
  static const String policy = '/policy';
  static const String carCare = '/carCare';
  static const String carService = '/carService';
  static const String myCar = '/myCar';
  static const String myOrders = '/myOrders';
  static const String contactUs = '/contactUs';
  static const String commonQuestion = '/commonQuestion';
  static const String ourTeams = '/ourTeams';
  static const String addCar = '/addCar';
  static const String editCar = '/editCar';
  static const String changeOil = '/changeOil';
  static const String changePassword = '/changePassword';
  static const String tracking = '/tracking';
  static const String orderDetails = '/orderDetails';
  static const String carInfo = '/carInfo';
  static const String viewMap = '/viewMap';
  static const String review = '/review';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case otp:
        UserData? userData= null;
        List<dynamic> args = settings.arguments as List<dynamic>;
        if(args.length == 3){
           userData = args[2];
        }
        return MaterialPageRoute(builder: (_) => OTPVerification(args[0],args[1]), settings: RouteSettings(arguments: userData));
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case account:
        return MaterialPageRoute(builder: (_) => const MyAccountScreen());
      case userInformation:
        return MaterialPageRoute(builder: (_) => const UserInformationScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case emergency:
        return MaterialPageRoute(builder: (_) => const EmergencyScreen());
      case carCare:
        return MaterialPageRoute(builder: (_) => const CarCareScreen());
      case carService:
        return MaterialPageRoute(builder: (_) => const CarServicesScreen());
      case myCar:
        return MaterialPageRoute(builder: (_) => const MyCarScreen());
      case addCar:
        return MaterialPageRoute(builder: (_) => const AddCarScreen());
      case editCar:
        return MaterialPageRoute(
            builder: (_) => EditCarScreen(), settings: settings);
      case request:
        return MaterialPageRoute(
            builder: (_) => RequestScreen(), settings: settings);
      case offers:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case myOrders:
        return MaterialPageRoute(builder: (_) => const MyOrdersScreen());
      case contactUs:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());
      case commonQuestion:
        return MaterialPageRoute(builder: (_) => const CommonQuestionScreen());
      case policy:
        return MaterialPageRoute(builder: (_) => const PolicyScreen());
      case ourTeams:
        return MaterialPageRoute(builder: (_) => const OurTeamsScreen());
      case changeOil:
        return MaterialPageRoute(builder: (_) => const ChangeOilScreen());
      case bill:
        return MaterialPageRoute(
            builder: (_) => BillOrderScreen(), settings: settings);
      case changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case tracking:
        return MaterialPageRoute(
            builder: (_) => const OrderTrackingScreen(), settings: settings);
      case orderDetails:
        return MaterialPageRoute(
            builder: (_) => const OrderDetailsScreen(), settings: settings);
      case carInfo:
        return MaterialPageRoute(
            builder: (_) => const CarInformationScreen(), settings: settings);
      case pay:
        return MaterialPageRoute(
            builder: (_) => PayScreen(), settings: settings);
      case viewMap:
        return MaterialPageRoute(
            builder: (_) => CustomerMapScreen(), settings: settings);
 case review:
        return MaterialPageRoute(
            builder: (_) => CustomerAssess(),settings: settings );
    }
    return unDefinedRoute();
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text("No Route Found"),
            ),
            body: const Center(child: Text("No Route Found"))));
  }
}
