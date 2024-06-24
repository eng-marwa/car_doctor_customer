import 'package:car_doctor/data/model/orders/CustomerOrder.dart';
import 'package:car_doctor/presentation/resources/RouteManager.dart';
import 'package:flutter/material.dart';

import '../../widgets/CustomStepWidget.dart';
//import 'SigningCharacter.dart';

//enum SingingCharacter { apple, cash ,credit }
class PayScreen extends StatefulWidget {
  //static PayPage? apple;

  @override
  State<PayScreen> createState() => _PayPageState();
}

class _PayPageState extends State<PayScreen> {
  // SigningCharacter? _selectedEnum = SigningCharacter.APPLE;
  int? selectedOption = 1;

  late CustomerOrder customerOrder;

  @override
  Widget build(BuildContext context) {
    //var apple;
    customerOrder = ModalRoute.of(context)?.settings.arguments as CustomerOrder;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                width: 1200,
                height: 900,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: Form(
                    child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.all(50)),
                          Text(
                            'تفاصيل الفاتورة',
                            style: TextStyle(
                                color: Color(0xff181879), fontSize: 30),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          IconButton(
                            iconSize: 35,
                            icon: Icon(Icons.arrow_forward_ios,
                                color: Colors.black),
                            onPressed: () {},
                          ),
                        ],
                      ),

                      const Divider(),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('الخطوة\nالثالثة'),
                          CustomStep(
                            isActive: true,
                            number: 3,
                          ),
                          Text('الخطوة\nالثانية'),
                          CustomStep(
                            isActive: true,
                            number: 2,
                          ),
                          Text('الخطوة\nالأولى'),
                          CustomStep(
                            isActive: true,
                            number: 1,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('الفاتورة: ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl),

                      const SizedBox(height: 10),
                      Container(
                        width: 350,
                        height: 190,
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child:  Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    '${customerOrder.orderId}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 80,
                                  ),
                                  const Text(
                                    'رقم الطلب: ',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                               Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    '${customerOrder.carService?.servicePrice}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  const Text(
                                    'اصلاح السيارة:  ',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                               Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    '${customerOrder.representative!=null?20:0}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    ' رسوم خدمة نقل السيارة : ',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                               Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    '${customerOrder.orderCost*0.15}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    'قيمة الضريبة المضافة 15%:',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const Divider(),
                               Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    '${customerOrder.orderCost+customerOrder.orderCost*0.15}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 80,
                                  ),
                                  const Text(
                                    'الإجمالي: ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      //code discount
                      SingleChildScrollView(
                        child: Container(
                          width: 280,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: const BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff181879),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.all(2),
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {},
                                    child: Text('تفعيل'),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: ':ادخل كود الخصم',
                                        contentPadding: EdgeInsets.all(10)),
                                  ),
                                ),
                              ]),
                        ),
                      ),
//code disco          //code discount fished
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        ':اختر وسيلة الدفع ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 5),
                      // بداية الدفع
                      Container(
                        width: 350,
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        //padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),

                        child: Column(
                          children: [
                            Row(
                              children: [
                                Radio<int>(
                                  value: 1,
                                  groupValue: selectedOption,
                                  onChanged: (int? value) {
                                    setState(() {
                                      selectedOption = value!;
                                      print("Selected Option: $selectedOption");
                                    });
                                  },
                                ),
                                const Text(
                                  'Apple Pay',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.apple,
                                  size: 40,
                                )
                              ],
                            ),
                            const Divider(
                              color: Color.fromARGB(255, 211, 207, 207),
                              thickness: 3,
                              indent: 10,
                              endIndent: 8,
                            ),
                            Row(
                              children: [
                                Radio<int>(
                                  value: 2,
                                  groupValue: selectedOption,
                                  onChanged: (int? value) {
                                    setState(() {
                                      selectedOption = value!;
                                      print("Selected Option: $selectedOption");
                                    });
                                  },
                                ),
                                const Divider(
                                  color: Color.fromARGB(255, 211, 207, 207),
                                  thickness: 3,
                                  indent: 10,
                                  endIndent: 8,
                                ),
                                const Text(
                                  'Cash',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.attach_money,
                                  size: 40,
                                )
                              ],
                            ),
                            const Divider(
                              color: Color.fromARGB(255, 211, 207, 207),
                              thickness: 3,
                              indent: 10,
                              endIndent: 8,
                            ),
                            Row(
                              children: [
                                Radio<int>(
                                  value: 3,
                                  groupValue: selectedOption,
                                  onChanged: (int? value) {
                                    setState(() {
                                      selectedOption = value!;
                                      print("Selected Option: $selectedOption");
                                    });
                                  },
                                ),
                                const Text(
                                  'credit card',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Icon(
                                  Icons.credit_card,
                                  size: 40,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      //نهاية الدفع
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 220,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xff181879),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(8.0),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () =>Navigator.pushNamed(
                              context, RouteManager.review,
                              arguments: customerOrder),
                          child: const Text('ادفع '),
                        ),
                      ),
                    ])),
              ),
            ),
          )),
    ));
  }
}
