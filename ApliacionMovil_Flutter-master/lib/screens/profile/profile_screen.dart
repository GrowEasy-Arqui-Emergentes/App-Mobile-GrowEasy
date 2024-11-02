import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    /*
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
    */
    String? firstName = '';
    String? lastName = '';
    String? email = '';
    bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  Future<void> loadProfile() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      firstName = prefs.getString('firstName');
      lastName = prefs.getString('lastName');
      email = prefs.getString('email');  
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800, letterSpacing: 3.0)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 53, 146, 56),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFFf2f2f2),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Center(
              child: const CircleAvatar(
                radius: 80,
                //añadir avatar
                backgroundColor: Color.fromARGB(255, 184, 231, 170),
                backgroundImage: NetworkImage('https://cdn3d.iconscout.com/3d/premium/thumb/woman-avatar-3d-icon-download-in-png-blend-fbx-gltf-file-formats--profile-character-pack-avatars-icons-5187873.png')
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text('Nombre: $firstName', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 10),
                  Text('Apellido: $lastName', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                  Text('Email: $email', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 197, 197, 197),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Center(child: Text('¿CAMBIAR CONTRASEÑA?', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900, color: Colors.white),)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 197, 197, 197),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Center(child: Text('PAGOS REALIZADOS', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900, color: Colors.white),)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 49, 49),
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Center(child: Text('CERRAR SESIÓN', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900, color: Colors.white),)),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}