import 'dart:convert';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;

class  AddProduct extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _githubController = TextEditingController();
  TextEditingController _twitterController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _latestController = TextEditingController();
  Future saveProduct() async {
    final response = 
      await http.post(Uri.parse("http://192.168.98.207:8000/api/authors"), body: {
        "name": _nameController.text.toString(),
        "email": _emailController.text.toString(),
        "github": _githubController.text.toString(),
        "twitter": _twitterController.text.toString(),
        "location": _locationController.text.toString(),
        "latest_article_published": _latestController.text.toString()});
      
  print(response.body);
  
    return json.decode(response.body);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter product name";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter product email";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _githubController,
                decoration: InputDecoration(labelText: "Github"),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter product github";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _twitterController,
                decoration: InputDecoration(labelText: "Twitter"),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter product twitter";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: "Location"),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter product location";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _latestController,
                decoration: InputDecoration(labelText: "Latest"),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Please enter product latest";
                  }
                  return null;
                },
              ),
              SizedBox(
                height:20,
              ),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    saveProduct().then((value) {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Produk berhasil di tambah"),
                          ));
                    });
                  }
                }, 
                child: Text("Save"))
            ],
          ),
        )
    );
  }
}