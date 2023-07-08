

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ThridScreen extends StatefulWidget {
   ThridScreen({Key? key}) : super(key: key);

  @override
  State<ThridScreen> createState() => _ThridScreenState();
}

class _ThridScreenState extends State<ThridScreen> {
  File? selectedImage;

  getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    selectedImage = File(file!.path);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:Container(
            height: 60,
            width: double.infinity,

            decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Center(child: Text('Healthy',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30
              ),)))));
    setState(() {});
  }
  getGallery() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(file!.path);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:Container(
            height: 60,
            width: double.infinity,

            decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Center(child: Text('Healthy',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30
              ),)))));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            fit: BoxFit.cover,
            image:NetworkImage('https://images.unsplash.com/photo-1501004318641-b39e6451bec6?ix'
                'lib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=773&q=80')
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Container(
                      height: 70,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           IconButton(onPressed:getImage, icon: Icon(Icons.camera_alt_outlined)),
                            IconButton(onPressed:getGallery, icon: Icon(Icons.image)),
                          ],
                        ),
                      ),
                    )));
              },
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 30,
                  left: 30,
                  right: 30
                ),
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(child: Text('CliCK Me',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
