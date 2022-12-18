import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';
import 'package:tugaspraktikum7/password_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PasswordProvider()),
      ],
      child: const InitialApp(),
    ),
  );
}

class InitialApp extends StatelessWidget {
  const InitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Wrap(
                    children: [
                      ClipPath(
                        clipper: WaveClipperTwo(),
                        child: Container(
                          color: Colors.pink.shade300,
                          height: MediaQuery.of(context).size.height / 2.5,
                          child: const Center(
                            child: Text(
                              'Wave Clipper Two',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: kTabLabelPadding.left),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome.', style: Theme.of(context).textTheme.headline4),
                          const SizedBox(height: 10),
                          Text(
                            'Login to your account below or signup for an amazing experience',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(height: kTabLabelPadding.left),
                          TextFormField(
                            cursorColor: Colors.pink.shade300,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.pink.shade300,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.pink.shade300,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autofocus: true,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {}, // TODO: add node later
                            validator: (value) {
                              if (value!.length < 3) {
                                return 'Email must be at least 3 characters';
                              }

                              if (value.length > 30) {
                                return 'Username must be at most 30 characters';
                              }

                              return null;
                            },
                          ),
                          TextFormField(
                            cursorColor: Colors.pink.shade300,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  context.read<PasswordProvider>().togglePasswordVisibility();
                                },
                                icon: Icon(context.watch<PasswordProvider>().isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              hintText: 'Passsword',
                              fillColor: Colors.pink.shade300,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.pink.shade300,
                                ),
                              ),
                            ),
                            obscureText: context.watch<PasswordProvider>().isPasswordVisible,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (value) {}, // TODO: add node later
                            validator: (value) {
                              if (value!.length < 3) {
                                return 'password must be at least 3 characters';
                              }

                              if (value.length > 20) {
                                return 'Username must be at most 20 characters';
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: kTabLabelPadding.left),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink.shade300,
                                    ),
                                    child: const Text('Login'),
                                  ),
                                ),
                                // register
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text('Register'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Text('App Name v1.0.0'),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
