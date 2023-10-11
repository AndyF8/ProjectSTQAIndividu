import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'UserState.dart';
import 'provider/cartItem.dart';
import 'SplashScreen.dart';

///Mempersiapkan lingkungan Flutter untuk aplikasi
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   ///Inisialisasi Firebase secara asinkron
  await Firebase.initializeApp();
  ///Menjalankan aplikasi Flutter utama (root)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ///This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ///Menyediakan ChangeNotifierProvider untuk manajemen CartItem
        ChangeNotifierProvider<CartItem>(
          create: (context) => CartItem(),
        ),
      ],
      child: MaterialApp(
        ///Menyembunyikan banner "Debug" dalam mode pengembangan
        debugShowCheckedModeBanner: false,
        ///Mengatur halaman awal aplikasi
        home: SplashScreen(),
      ),
    );
  }
}
