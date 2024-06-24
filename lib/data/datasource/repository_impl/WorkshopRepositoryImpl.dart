import 'package:car_doctor/data/model/Workshop.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../di/AppModule.dart';
import '../../../domain/repository/workshops_repository/WorkshopRepository.dart';
import '../../model/UserData.dart';

@injectable
class WorkshopRepositoryImpl implements WorkshopRepository {
  final FirebaseAuth _auth = getIt<FirebaseAuth>();

  @override
  Future<List<Workshop>> getWorkshop() async {
    List<Workshop> workshops = [];
    QuerySnapshot snapshot = await getIt<FirebaseFirestore>()
        .collection('users')
        .doc('agents')
        .collection('agentData')
        .get();


    snapshot.docs.forEach((doc) =>
        workshops.add(UserData.userDataWorkshopMapper(
            UserData.fromJson(doc.data() as Map<String, dynamic>))));


    print('Workshops: $workshops');
    return workshops;
  }
}
