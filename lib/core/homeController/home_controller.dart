import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../screens/homepagefour_screen/homepagefour_screen.dart';

class HomeController extends GetxController {
  bool isLoading = false;

  bool visible = true;

  isVisible() {
    visible = !visible;
    update();
  }

  List homeItems = [
    {
      "images": "assets/images/img.png",
      "textHeader": "Need a Property?",
      "textSub": "Own a Property & Pay with Ease",
    },
    {
      "images": "assets/images/img_1.png",
      "textHeader": "Agents & Developers",
      "textSub": "Post & Sell Your Properties",
    },
    {
      "images": "assets/images/img_2.png",
      "textHeader": "Mortgage Financing",
      "textSub": "Access funds to power that ongoing project",
    },
    {
      "images": "assets/images/img_3.png",
      "textHeader": "My Account Area",
      "textSub": "Take me to my Dashboard",
    },
  ];
  loginUsers({
    required Function(String) showMessage,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) async {
    isLoading = true;
    update();

    var urlLogin = Uri.parse('http://localhost/wowonder/api/auth');
    var headers = {'Accept': 'application/json'};
    var body = {
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
      'device_type':
          'windows', // Adding device type as per your API requirement
    };

    try {
      var response = await http.post(urlLogin, headers: headers, body: body);
      print(response.body);

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        var userId = responseBody["data"]["id"].toString();
        var token = responseBody["token"];

        // Call the showMessage callback with a success message
        showMessage('Login successful');

        // Navigate to the homepage
        Get.offAll(() => const HomepagefourScreen());
      } else if (response.statusCode == 422) {
        // 401 status code indicates incorrect password
        isLoading = false;
        update();
        // Call the showMessage callback with an error message
        showMessage('Incorrect password. Please try again.');
      } else {
        isLoading = false;
        update();
        var json = jsonDecode(response.body);

        // Call the showMessage callback with an error message
        showMessage('Login failed ${json["message"]}');
      }
    } catch (error) {
      print("Error during login: $error");
      // Handle the error appropriately
      showMessage('An error occurred during login.');
    }
  }
}