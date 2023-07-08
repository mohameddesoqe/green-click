import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/features/home-feature/component/Listview.dart';
import 'package:untitled2/features/home-feature/screens/block-screen.dart';
import 'package:untitled2/features/home-feature/screens/thrid-screen.dart';

import 'indoor.dart';
import 'outdoor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? selectedImage;

  getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    selectedImage = File(file!.path);

    print(selectedImage!.path.toString());
    setState(() {});
  }
  TextEditingController searchConroller = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Eat IT, Just with a click',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: searchConroller,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  label: Text('Click here'),
                  prefixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.search_outlined)),
                  suffixIcon:
                      IconButton(onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                         return ThridScreen();
                       }));
                      }, icon: Icon(Icons.qr_code_scanner)),
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Grow Your Plant',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return InDoor();
                        }));
                      },
                      child: Column(
                       
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        
                          Container(
                            
                            
                            height: MediaQuery.of(context).size.height/10,
                            width: MediaQuery.of(context).size.width/7,
                      
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Image.asset('assets/plant-with-leaves-1.jpg'),
                           
                          ),
                          Text('Outdoor',
                          style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                          ),)
                        ],
                      ),
                    ),
                   Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return OutDoor();
                        }));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height/10,
                            width: MediaQuery.of(context).size.width/7,
                      
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20)
                            ),
                           child: Image.asset('group.jpg'),
                          ),
                          Text('indoor',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                            ),)
                        ],
                      ),
                    ),
                  Spacer(),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ThridScreen();
                        }));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height/10,
                            width: MediaQuery.of(context).size.width/7,
                      
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Image.asset('group-3.jpg'),
                          ),
                          Text('other',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                            ),)
                        ],
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Popular diseases',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        
              ListviewComponnet(),
        
            //       Flexible(
            //         child: SingleChildScrollView(
            //             scrollDirection: Axis.horizontal,
            //             child: Row(
            //                 children: [
            //             for (var i = 0;i < 20;i++)
            //             Flexible(child: ListTile(title: Text('Item at $i')))
            //     ],
            //
            //   ),
            // ),
            //       ),
        
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(50),
                  ),
        child: BottomNavigationBar(
      fixedColor: Colors.black87,
      
      
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
      
            BottomNavigationBarItem(
              icon: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return HomeScreen();
                }));
              }, icon: Icon(Icons.home),),
              label: 'Home',
            ),
      
            BottomNavigationBarItem(
              icon: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return BarcodeScannerPage();
                }));
              }, icon: Icon(Icons.shopping_cart_rounded),),
              label: 'Shopping ',
            ),
      
          ],
        ),
      ),
    );
  }
}
