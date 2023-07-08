import 'package:flutter/material.dart';
import 'package:untitled2/features/home-feature/screens/descripation-screen.dart';





class ListviewComponnet extends StatelessWidget {
  final List<String> items = [
    'learn more',
     'learn more',

    
  ];


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return DescripatinScreen();
        }));

      },
      child: Container(
        height: 300,
        width: double.infinity,

        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Container(

                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  borderRadius: BorderRadius.circular(20)
                ),
                width: MediaQuery.of(context).size.width/2,

                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        image:DecorationImage(
                            fit: BoxFit.cover,
                            image:AssetImage(
                              'assets/photo3.jpg',

                        ),
                    ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 10,
                            left: 10,
                            right: 10

                          ),
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.5),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Center(child: Text(items[index],
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 10,);
        },
        ),
      ),
    );
  }
}
