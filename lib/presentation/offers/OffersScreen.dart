import 'package:car_doctor/di/AppModule.dart';
import 'package:car_doctor/presentation/offers/OfferCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../resources/ColorManager.dart';
import '../widgets/CustomContainer.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final _formKey = GlobalKey<FormState>();
  late OfferCubit offerCubit;

  @override
  void initState() {
    super.initState();
    offerCubit = getIt<OfferCubit>();
  }

  @override
  void dispose() {
    super.dispose();
    offerCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => offerCubit..getOffer(),
        child: Scaffold(
            body: Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: ColorsManager.bg_gradient,
                  ),
                ),
                child: CustomContainer(
                  bgColor: ColorName.whiteColor,
                  allBorder: false,
                  circularRadius: const Radius.circular(60),
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'العروض الحالية ',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Divider(color: ColorName.greyColor),
                          BlocBuilder<OfferCubit, OfferState>(
                              builder: (context, state) {
                            if (state is OfferLoading) {
                              return const CircularProgressIndicator();
                            } else if (state is OfferLoaded) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.data.length,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    CustomContainer(
                                      bgColor: ColorName.bgTextField,
                                      margin: const EdgeInsets.only(top: 20),
                                      padding: const EdgeInsets.all(1),
                                      allBorder: true,
                                      height: 240,
                                      width: 380,
                                      circularRadius: const Radius.circular(30),
                                      child: Column(
                                        children: [
                                          Assets.images.offers.image(
                                            fit: BoxFit.fitWidth,
                                            height: 120,
                                            width: 330,
                                          ),
                                          const SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 100),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${state.data[index].discount} %',
                                                  style: const TextStyle(
                                                    fontSize: 25,
                                                    color: ColorName.greyColor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  state.data[index].title,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color:
                                                          ColorName.greyColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 80),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      Clipboard.setData(
                                                          const ClipboardData(
                                                              text: 'clean'));
                                                    },
                                                    icon:
                                                        const Icon(Icons.copy)),
                                                const SelectableText(
                                                  'clean',
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text(
                                                  'استعمل كود الخصم ',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color:
                                                          ColorName.greyColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else if (state is OfferInitial) {
                              return Column(
                                children: [
                                  CustomContainer(
                                    bgColor: ColorName.whiteColor,
                                    allBorder: false,
                                    circularRadius: const Radius.circular(0),
                                    height: 250,
                                    width: 250,
                                    child: Assets.images.noOffer.image(),
                                    //margin: EdgeInsets.only(left:20,right:20),
                                    //padding: EdgeInsets.only(top:0),
                                  ),
                                  const Text(
                                    "نعتذر منك لا توجد عروض حاليا ",
                                    style: TextStyle(
                                        color: ColorName.blueColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              );
                            } else {
                              return const SizedBox();
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
