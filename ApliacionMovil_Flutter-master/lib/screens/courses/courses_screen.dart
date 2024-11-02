import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/course.dart';
import 'package:flutter_application_1/screens/courses/confirmation_page.dart';
import 'package:flutter_application_1/services/courses_service.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
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
    final courses = await coursesService.searchCourses();
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
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, 
                      crossAxisSpacing: 20, 
                      mainAxisSpacing: 20,
                      mainAxisExtent: 200),
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text('Price: \$', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),),  // To create spacing between price and currency symbol.
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5.0),
                                          child: Text(course.price.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmationPage(course: course)));
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
                          )
                        ],
                      ),
                    )
                  );
                },
                        ),
            ),
    ));
  }
}