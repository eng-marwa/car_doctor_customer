import 'package:car_doctor/data/datasource/remote/Failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../di/AppModule.dart';
import '../../../domain/repository/car_repository/CarRepository.dart';
import '../../model/car/Car.dart';
import '../../model/car/CarData.dart';
import '../remote/remote_repository/CarTypesRemoteDataSource.dart';

@Injectable(as: CarRepository)
class CarRepositoryImpl implements CarRepository {
  final FirebaseAuth _auth = getIt<FirebaseAuth>();

  @override
  Future<Either<Failure, List<CarData>>> getCars() async {
    return getIt<CarTypesRemoteDataSource>().fetchCarsTypes();
  }

  Future<String> addCars(Car car) async {
    print('_auth.currentUser?.uid: ${_auth.currentUser?.uid}');
    DocumentReference documentReference = await getIt<FirebaseFirestore>()
        .collection('users')
        .doc('customers')
        .collection('customerData')
        .doc(_auth.currentUser?.uid)
        .collection('cars')
        .doc();
    car.carId = documentReference.id;
    print('car id: ${car.carId}');
    documentReference.set(car.toJson());
    return 'car added';
  }

  @override
  Future<String> deleteCars(Car car) async {
    getIt<FirebaseFirestore>()
        .collection('users')
        .doc('customers')
        .collection('customerData')
        .doc(_auth.currentUser?.uid)
        .collection('cars')
        .doc(car.carId)
        .delete()
        .catchError((e) => e.toString())
        .whenComplete(() => 'car deleted');
    return 'car deleted';
  }

  @override
  Future<String> editCars(Car car) async {
    getIt<FirebaseFirestore>()
        .collection('users')
        .doc('customers')
        .collection('customerData')
        .doc(_auth.currentUser?.uid)
        .collection('cars')
        .doc(car.carId)
        .update(car.toJson())
        .catchError((e) => e.toString())
        .whenComplete(() => 'car edited');
    return 'car edited';
  }

  @override
  Future<List<Car>> getUserCars() async {
    //firebase
    print('_auth.currentUser?.uid: ${_auth.currentUser?.uid}');
    QuerySnapshot snapshot = await getIt<FirebaseFirestore>()
        .collection('users')
        .doc('customers')
        .collection('customerData')
        .doc(_auth.currentUser?.uid)
        .collection('cars')
        .get();
    print('snapshot: $snapshot  ${snapshot.docs}');
    snapshot.docs.forEach((element) => print('element: ${element.data()}'));
    List<Car> userCars = snapshot.docs
        .map((e) => Car.fromJson(e.data() as Map<String, dynamic>))
        .toList();

    print('user cars: $userCars');
    return userCars;
  }
}
