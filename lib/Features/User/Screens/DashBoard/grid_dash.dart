import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fetin_2024_3/Features/User/Screens/AmbulanceOptions/AmbulanceOptions.dart';
import 'package:fetin_2024_3/Features/User/Screens/FirefighterOptions/firefighter_options.dart';
import 'package:fetin_2024_3/Features/User/Screens/HospitalOptions/hospital_options.dart';
import 'package:fetin_2024_3/Features/User/Screens/PoliceOptions/police_options.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = Items(
      title: "Policia",
      subtitle: "Emergencia necessidade de acionamento dos Policias ",
      event: "",
      img: "assets/logos/policeman.png");

  Items item2 = Items(
    title: "Bombeiros",
    subtitle: "Emergencia necessidade de acionamento dos Bombeiros ",
    event: "",
    img: "assets/logos/fire-truck.png",
  );

  Items item3 = Items(
    title: "SAMU",
    subtitle: "Emergencia necessidade de acionamento do SAMU",
    event: "",
    img: "assets/logos/ambulance.png",
  );
  Items item4 = Items(
    title: "Hospitais",
    subtitle: "Emergencia Hospitalares",
    event: "",
    img: "assets/logos/hospital.png",
  );

  GridDashboard({super.key});
  // Items item4 = new Items(
  //   title: "To do",
  //   subtitle: "Homework, Design",
  //   event: "4 Items",
  //   img: "assets/logos/emergencyAppLogo.png",
  // );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    var color = 0xff2471A3;
    return GridView.count(
        childAspectRatio: 1.0,
        padding: const EdgeInsets.only(left: 6, right: 6),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return GestureDetector(
            onTap: () {
              if (data.title == "Police") {
                Get.to(() => const PoliceOptions());
              } else if (data.title == "Fire Brigade") {
                Get.to(() => const FireFighterOptions());
              } else if (data.title == "Ambulance") {
                Get.to(() => const AmbulanceOptions());
              } else if (data.title == "Hospitals") {
                Get.to(() => const HospitalOptions());
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: Image.asset(
                      data.img,
                      width: 42,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          );
        }).toList());
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img});
}
