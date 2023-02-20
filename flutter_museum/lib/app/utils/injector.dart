import 'package:flutter_museum/app/data/auth.dart';
import 'package:flutter_museum/app/data/user.dart';
import 'package:get/get.dart';

// =========================
// Setup depedency injection 
// =========================

void setupInjector() {
  // Inject User Firestore
  Get.put(
    UserFirestore(),
    permanent: true,
  );

  // Inject Auth Firebase
  Get.put(
    AuthFirebase(),
    permanent: true,
  );
}
