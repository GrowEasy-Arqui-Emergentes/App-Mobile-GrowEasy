import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/course.dart';

class ConfirmationPage extends StatefulWidget {
  final Course course;

  ConfirmationPage({required this.course});

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Purchase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course: ${widget.course.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Description: ${widget.course.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Price: \$${widget.course.price}',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('La compra fue exitosa'),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.87,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 15, 71, 17),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Center(child: Text("COMPRAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
                  ),
                ),
              ),
              /*child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('La compra fue exitosa'),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text('Confirm'),
              ),*/
            ),
          ],
        ),
      ),
    );
  }
}