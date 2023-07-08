import 'package:flutter/material.dart';
import 'package:untitled2/features/home-feature/screens/home-screen.dart';

class ListviewDescripation extends StatelessWidget {
  final List<String> items = [
    
    'assets/photo1.jpg',
   'assets/photo2.jpg',
 'assets/untitled-design-61.jpg',

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomeScreen();
              }));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(
                      child:Image.asset(
                        items[index],
                        fit: BoxFit.cover,
                       width: double.infinity,
                       height: double.infinity,
                      ),
                    ),
                  ),
                  Text('Wheat Disease ${index + 1}'),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}
