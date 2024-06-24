import 'package:car_doctor/presentation/view/representative/RequestScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../gen/colors.gen.dart';
import '../resources/ColorManager.dart';
import '../resources/RouteManager.dart';
import '../view/order/BillOrderScreen.dart';
import '../widgets/CustomButton.dart';
import '../widgets/CustomContainer.dart';
import '../widgets/CustomTextField.dart';
import '../widgets/CustomTextLink.dart';


class CarWashScreen extends StatefulWidget {
  const CarWashScreen({super.key});

  @override
  State<CarWashScreen> createState() => _CarWashState();
}

class _CarWashState extends State<CarWashScreen> {
  @override
  void initState() {
    super.initState();
    _handleLocationPermission();
  }

  final TextEditingController _phoneController = TextEditingController();
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    print('android.permission.');
    bool serviceEnabled;
    LocationPermission permission;
    // List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
      print(_currentAddress);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  // submit() {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => const SplashScreen()));
  // }

  @override
  Widget build(BuildContext context) {
    String selectedWorkS = "0";
    var _value = "-1";
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: ColorsManager.bg_gradient)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomContainer(
                  height: MediaQuery.of(context).size.height,
                  bgColor: ColorName.whiteColor,
                  allBorder: true,
                  circularRadius: Radius.circular(60),
                  padding: EdgeInsets.all(16),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Expanded(
                              child: Text(
                                  'غسيل السيارة ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                          // color:ColorManager.errorColor,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'الخطوة الثالثة',
                              style: TextStyle(
                                  fontSize: 16, color: ColorName.greyColor),
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.grey,
                              size: 24.0,
                            ),
                            Divider(
                              color: Colors.red,
                              // color:ColorManager.errorColor,
                            ),
                            Text(
                              'الخطوة الثانية',
                              style: TextStyle(
                                  fontSize: 16, color: ColorName.greyColor),
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.grey,
                              size: 24.0,
                            ),
                            Divider(
                              color: Colors.red,
                            ),
                            Text(
                              'الخطوة الاولى',
                              style: TextStyle(
                                  fontSize: 16, color: ColorName.greyColor),
                            ),
                            Icon(
                              Icons.circle,
                              color: Color(0xff181879),
                              size: 24.0,
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 300),
                          child: Text(
                            "اختار سيارتك",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: DropdownButtonFormField(
                                dropdownColor: Colors.grey.shade300,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                )),
                                value: _value,
                                items: const [
                                  DropdownMenuItem(
                                    child: Text('سيارة كامري'),
                                    value: "-1",
                                  ),
                                  DropdownMenuItem(
                                    child: Text('....سيارة'),
                                    value: "2",
                                  )
                                ],
                                onChanged: (v) {}),
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        CustomTextField(
                          controller: _phoneController,
                          checkValidation: (value) =>
                              value!.isEmpty ? 'يرجى كتابة وصف' : null,
                          label: 'اوصف مشكلتك',
                          type: TextInputType.multiline,
                          alignment: Alignment.topRight,
                          fontSize: 15,
                          textAlign: TextAlign.right,
                          fieldLabel: '......',
                        ),
                        SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.only(left: 300),
                          child: Text(
                            "ادخل موقعك",
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorName.blackColor,
                            ),
                          ),
                        ),
                        Text(
                          'LAT: ${_currentPosition?.latitude ?? ""}',
                          style: const TextStyle(
                              fontSize: 16, color: ColorName.blueColor),
                        ),
                        Text(
                          'LNG: ${_currentPosition?.longitude ?? ""}',
                          style: const TextStyle(
                              fontSize: 16, color: ColorName.blueColor),
                        ),
                        Text(
                          'ADDRESS: ${_currentAddress ?? ""}',
                          style: const TextStyle(
                              fontSize: 16, color: ColorName.blueColor),
                        ),
                        ElevatedButton(
                          onPressed: () => _getCurrentPosition(),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all<Size>(
                                Size(50, 50)), //////// HERE
                            backgroundColor: getColor(
                                ColorName.blueColor, ColorName.greyColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(200),
                              ),
                            ),
                          ),
                          child: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 300),
                          child: Text(
                            "اختار الورشة",
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('workShops')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                List<DropdownMenuItem> workShopsWidgest = [];
                                if (!snapshot.hasData) {
                                  const CircularProgressIndicator();
                                } else {
                                  final workS =
                                      snapshot.data?.docs.reversed.toList();
                                  workShopsWidgest.add(
                                    DropdownMenuItem(
                                      value: "0",
                                      child: Text("select the work shop "),
                                    ),
                                  );
                                  for (var agent in workS!) {
                                    workShopsWidgest.add(DropdownMenuItem(
                                      value: agent.id,
                                      child: Text(
                                        agent['Name'],
                                      ),
                                    ));
                                  }
                                }
                                return DropdownButton(
                                  items: workShopsWidgest,
                                  onChanged: (agentValue) {
                                    print('onchanged');
                                    setState(() {
                                      selectedWorkS = agentValue;
                                      print(agentValue);
                                    });
                                  },
                                  value: selectedWorkS,
                                );
                              },
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(height: 25),
                        CustomTextLink(
                          text: 'لعرض الفاتورة اضغط هنا',
                          fontSize: 25,
                          textColor: ColorName.primaryAssentColor,
                          onClick: () {
                            Navigator.pushNamed(context, RouteManager.bill);
                          },
                        ),
                        SizedBox(height: 25),
                        CustomButton(
                          onClick: () {},
                          textColor: ColorName.whiteColor,
                          title: 'تأكيد الطلب',
                          bgColor: ColorName.blueColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  MaterialStateProperty<Color> getColor(Color greyColor, Color whiteLinkColor) {
    getColor(Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return whiteLinkColor;
      } else {
        return greyColor;
      }
    }

    return MaterialStateProperty.resolveWith(getColor);
  }
}
