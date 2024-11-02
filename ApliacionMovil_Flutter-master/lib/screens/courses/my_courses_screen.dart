import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/course.dart';
import 'package:flutter_application_1/services/courses_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  List<Course>? _courses;
  bool _isLoading = true;
  

   @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    setState(() {
      _isLoading = true;
    });
    final coursesService = CourseService();
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('id');

    final courses = await coursesService.getBuyedCourses(id!);
    setState(() {
      _courses = courses;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading 
        ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: _loadCourses,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 8.0, left: 10, right: 10),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("¡Bienvenido!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black),),
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                      child: Text("Continua tus custos:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),),
                    ),
                    Center(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, 
                              crossAxisSpacing: 20, 
                              mainAxisSpacing: 20,
                              mainAxisExtent: 180),
                        itemCount: _courses?.length ?? 0,
                        itemBuilder: (context, index){
                          final course = _courses![index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFf2f2f2),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Color(0xFF81C76B), width: 2, style: BorderStyle.solid),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Image.network(course.image, fit: BoxFit.cover),
                                      )),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(course.name.toUpperCase(), style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                            Container(
                                              width: MediaQuery.of(context).size.width / 2,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                                child: Text(course.description, style: TextStyle(fontSize: 12),),
                                              )
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(255, 15, 71, 17),
                                                borderRadius: BorderRadius.circular(5)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                                child: Center(child: Text(course.category.toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          );
                        },
                                ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                      child: Center(child: Text("¿Te quedaste sin cursos?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),)),
                    ),
                    Center(child: Text("¡Compra más y aprende!", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),)),
                  ],
                ),
              ),
            ),
    ));
  }
}