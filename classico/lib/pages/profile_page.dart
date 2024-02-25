import 'package:flutter/material.dart';
import 'package:wish/utils/functions.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final String name = "Vanessa";
    final String description = "General User";
    final String userType = "Researcher";
    final bool isVerified = true;
    final int age = 34;
    final String gender = "Female";
    final String institution = "VIT";
    final String qualification = "P.H.D";
    final String researcherVerification = "Verified";
    final String researchStatus = "Currently under research";
    final String researchSpecialization = "Menstrual Health";
    final String researchObjective = "Health";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF585F),
        title: Text("Profile View"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blueAccent.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User Info",
                      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Name: $name",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Description: $description",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "User Type: $userType",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Verification: ${isVerified ? 'Verified' : 'Not Verified'}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Age: $age",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Gender: $gender",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blueAccent.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Researcher Info",
                      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Institution: $institution",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Qualification: $qualification",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Verification: $researcherVerification",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Status: $researchStatus",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Research Specialization: $researchSpecialization",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Objective: $researchObjective",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:classico/utils/routes.dart';
// import '../Widgets/drawer.dart';
//
// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final int days=30;
//     final String name = "Shlok";
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         title: Text("Profile View"),
//       ),
//       body: Center(
//         child: Container(
//           child: Text("Welcome to $days days of flutter by $name"),
//         ),
//       ),
//     );
//   }
// }
