import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, 
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.construction, size: 100, color: Colors.grey,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text('LO SIENTO', style: TextStyle(color: Colors.grey, fontSize: 50, fontWeight: FontWeight.w800),),
              ),
              Text('Este servicio se encuentra en desarrollo', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)
            ],
          ),
        ),
      ),
    );
  }
}