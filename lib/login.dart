// import 'package:flutter/material.dart';
// import 'fourth_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class login extends StatefulWidget {
//   @override
//   _NextPageState createState() => _NextPageState();
// }

// class _NextPageState extends State<login> {
//   bool isLogin = true; // لتحديد إذا كانت الصفحة تسجيل دخول أو تسجيل حساب جديد
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           isLogin ? 'Login' : 'Sign Up',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Container(
//         width: double.infinity,
//         color: Colors.white, // الخلفية باللون الأبيض
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             Text(
//               isLogin
//                   ? 'Welcome Back to ECCAT'
//                   : 'Create Your Account at ECCAT',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blueAccent, // النص باللون السماوي
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Form(
//                         key: _formKey,
//                         child: Column(
//                           children: [
//                             if (!isLogin)
//                               TextFormField(
//                                 controller: _nameController,
//                                 decoration: InputDecoration(
//                                   labelText: 'Full Name',
//                                   labelStyle: TextStyle(
//                                     color: Colors.blueAccent,
//                                   ), // النص داخل الحقل باللون السماوي
//                                   border: OutlineInputBorder(),
//                                   prefixIcon: Icon(
//                                     Icons.person,
//                                     color: Colors.blueAccent,
//                                   ), // الأيقونة باللون السماوي
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Colors.blueAccent,
//                                     ),
//                                   ),
//                                 ),
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return 'Please enter your name';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                             if (!isLogin) const SizedBox(height: 16),
//                             TextFormField(
//                               controller: _emailController,
//                               decoration: InputDecoration(
//                                 labelText: 'Email',
//                                 labelStyle: TextStyle(
//                                   color: Colors.blueAccent,
//                                 ), // النص داخل الحقل باللون السماوي
//                                 border: OutlineInputBorder(),
//                                 prefixIcon: Icon(
//                                   Icons.email,
//                                   color: Colors.blueAccent,
//                                 ), // الأيقونة باللون السماوي
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.blueAccent,
//                                   ),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your email';
//                                 }
//                                 if (!value.contains('@')) {
//                                   return 'Please enter a valid email';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 16),
//                             TextFormField(
//                               controller: _passwordController,
//                               obscureText: true,
//                               decoration: InputDecoration(
//                                 labelText: 'Password',
//                                 labelStyle: TextStyle(
//                                   color: Colors.blueAccent,
//                                 ), // النص داخل الحقل باللون السماوي
//                                 border: OutlineInputBorder(),
//                                 prefixIcon: Icon(
//                                   Icons.lock,
//                                   color: Colors.blueAccent,
//                                 ), // الأيقونة باللون السماوي
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Colors.blueAccent,
//                                   ),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your password';
//                                 }
//                                 if (value.length < 6) {
//                                   return 'Password must be at least 6 characters';
//                                 }
//                                 return null;
//                               },
//                             ),
//                             const SizedBox(height: 24),
//                             ElevatedButton(
//                               onPressed: () async {
//                                 if (_formKey.currentState!.validate()) {
//                                   try {
//                                     if (isLogin) {
//                                       // Login logic
//                                       final userCredential = await FirebaseAuth
//                                           .instance
//                                           .signInWithEmailAndPassword(
//                                             email: _emailController.text.trim(),
//                                             password:
//                                                 _passwordController.text.trim(),
//                                           );
//                                       print(
//                                         'Logged in as: ${userCredential.user?.email}',
//                                       );
//                                     } else {
//                                       // Sign up logic
//                                       final userCredential = await FirebaseAuth
//                                           .instance
//                                           .createUserWithEmailAndPassword(
//                                             email: _emailController.text.trim(),
//                                             password:
//                                                 _passwordController.text.trim(),
//                                           );
//                                       print(
//                                         'Signed up as: ${userCredential.user?.email}',
//                                       );
//                                     }

//                                     // Navigate to the fourth page after successful login or sign-up
//                                     Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => FourthPage(),
//                                       ),
//                                     );
//                                   } on FirebaseAuthException catch (e) {
//                                     if (e.code == 'weak-password') {
//                                       print(
//                                         'The password provided is too weak.',
//                                       );
//                                     } else if (e.code ==
//                                         'email-already-in-use') {
//                                       print(
//                                         'The account already exists for that email.',
//                                       );
//                                     } else if (e.code == 'user-not-found') {
//                                       print('No user found for that email.');
//                                     } else if (e.code == 'wrong-password') {
//                                       print(
//                                         'Wrong password provided for that user.',
//                                       );
//                                     }
//                                   } catch (e) {
//                                     print('Error: $e');
//                                   }
//                                 }
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 100,
//                                   vertical: 15,
//                                 ),
//                                 child: Text(
//                                   isLogin ? 'Login' : 'Sign Up',
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     Colors.blueAccent, // الزر باللون السماوي
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 16),
//                             TextButton(
//                               onPressed: () {
//                                 setState(() {
//                                   isLogin = !isLogin;
//                                 });
//                               },
//                               child: Text(
//                                 isLogin
//                                     ? 'Don\'t have an account? Sign Up'
//                                     : 'Already have an account? Login',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.blueAccent,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
