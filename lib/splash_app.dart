import 'package:flutter/material.dart';

class SplashApp extends StatefulWidget {
  const SplashApp({
    required this.onInitializationComplete,
    Key? key,
  }) : super(key: key);

  final VoidCallback onInitializationComplete;

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  @override
  void initState() {
    super.initState();
    _initializeAsyncDependencies();
  }

  Future<void> _initializeAsyncDependencies() async {
    Future.delayed(Duration(seconds: 3))
        .then((value) => widget.onInitializationComplete());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _buildBody(),
    );
  }

  Widget _buildBody() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
