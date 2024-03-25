import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../screens/homepagefour_screen/homepagefour_screen.dart';

class HomeController extends GetxController {
  bool isLoading = false;

  var baseUrl = 'https://fashionbiz.org';

  bool visible = true;

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
  }) async {
    isLoading = true;
    update();

    var baseUrl = 'https://fashionbiz.org/';
    var headers = {'Accept': 'application/json'};
    var body = {
      "server_key":
          "1eca16c1127fcaf8266a3ae56dffb540f5eaac9f-889fe0e508bf0365111cc95114e29263-88061744",
      'username': userNameController.text.trim(),
      'password': passwordController.text.trim(),
      'device_type': 'phone', // Adding device type as per your API requirement
    };

    try {
      var response = await http.post(Uri.parse('$baseUrl/api/auth/'),
          headers: headers, body: body);
      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (responseBody["api_status"] == "400") {
          // 400 status code indicates incorrect password or user not found
          isLoading = false;
          update();
          var errorMessage = '';
          if (responseBody["errors"] != null) {
            // Check if there are errors in the response
            if (responseBody["errors"]["error_id"] == 5) {
              errorMessage = 'Incorrect password. Please try again.';
            } else if (responseBody["errors"]["error_id"] == 4) {
              errorMessage = 'Username not found.';
            } else {
              errorMessage = 'Login failed';
            }
          } else {
            errorMessage = 'Login failed';
          }
          showMessage(errorMessage);
        } else {
          showMessage('Login successful');
          Get.offAll(() => const HomepagefourScreen());
        }
      }
    } catch (error) {
      showMessage('An error occurred during login.');
    }
  }
}
