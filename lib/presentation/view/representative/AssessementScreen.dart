import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/di/AppModule.dart';
import 'package:car_doctor/presentation/resources/RouteManager.dart';
import 'package:car_doctor/presentation/view/representative/ReviewCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomerAssess extends StatefulWidget {
  const CustomerAssess({super.key});

  @override
  State<CustomerAssess> createState() => _CustomerAssessState();
}

class _CustomerAssessState extends State<CustomerAssess> {
  double rating = 0;
  final ReviewCubit reviewCubit = getIt<ReviewCubit>();
  final TextEditingController _reviewTextController = TextEditingController();

  late CustomerOrder customerOrder;

  @override
  void dispose() {
    super.dispose();
    _reviewTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    customerOrder = ModalRoute.of(context)?.settings.arguments as CustomerOrder;

    return BlocProvider(
        create: (_) => reviewCubit,
        child: BlocListener<ReviewCubit, String>(
            listener: (context, state) {
              if (state == "reviewAdded") {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('شكرا على استخدامكم تطبيق car doctor'),
                  backgroundColor: Colors.green,
                ));
                Navigator.pushNamed(context, RouteManager.home);
              }
            },
            child: Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.black,
                      Color(0xff181879),
                    ],
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(90)),
                    ),
                    //padding: EdgeInsets.all(100),
                    //margin: EdgeInsets.all(30),
                    child: Form(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 50),
                            const Text("شكرا لإستخدامك تطبيق Car Doctor",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Color(0xff181879),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(height: 50),
                            const Text(
                              " كيف تقًيم الخدمة والمندوب؟ ",
                              style: TextStyle(
                                color: Color(0xff181879),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 30),
                            BlocBuilder<ReviewCubit, String>(
                              builder: (context, state) {
                                double rating = reviewCubit.selectedRate;
                                if (state == "rateAdded") {}
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Rating: $rating',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    RatingBar.builder(
                                        minRating: 1,
                                        itemSize: 50,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        itemBuilder: (context, _) => const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                        updateOnDrag: true,
                                        onRatingUpdate: (rating) =>
                                            reviewCubit.setRate(rating)),
                                  ],
                                );
                              },
                            ),
                        
                            const SizedBox(
                              height: 30,
                            ),
                            //Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
                        
                            Container(
                              margin: const EdgeInsets.only(right: 20, left: 20),
                              child: TextField(
                                controller: _reviewTextController,
                                style: const TextStyle(height: 6),
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 50.0,
                                    horizontal: 50.0,
                                  ),
                                  labelText: 'اترك لنا التعليق هنا',
                                  labelStyle: TextStyle(
                                      color: Colors.black26, fontSize: 30),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  isDense: true,
                                  filled: true,
                                  fillColor: Colors.grey,
                                ),
                              ),
                            ),
                        
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 200,
                              height: 70,
                              decoration: const BoxDecoration(
                                color: Color(0xff181879),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.all(8.0),
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                onPressed: () => reviewCubit.addReview(
                                    _reviewTextController.value.text,
                                    reviewCubit.selectedRate,
                                    customerOrder.orderId ?? '',
                                    customerOrder.client?.uid ?? ''),
                                child: const Text(' ارسال '),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }
}
