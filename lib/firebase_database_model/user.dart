import 'dart:core';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class loginUser {
  String ID;
  String PW;
  String realName;
  String nickName;
  String createdTime;
  String mySchool;
  String email;
  String phoneNumber;
  List<String>? myPost;
  List<String>? myScrap;
  List<String>? myHeart;
  List<String>? myRepl;
  List<String>? anonyMessage;
  int boolAdmin;
  int boolCertificated;

  loginUser(
    this.ID,
    this.nickName,
    this.PW,
    this.realName,
    this.myScrap,
    this.myHeart,
    this.mySchool,
    this.email,
    this.phoneNumber,
    this.myPost,
    this.anonyMessage,
    this.boolAdmin,
    this.boolCertificated,
    this.createdTime,
    this.myRepl, //15
  );

  loginUser.fromSnapshot(DataSnapshot snapshot)
      : ID = (snapshot.value! as Map<String, dynamic>)['ID'],
        PW = (snapshot.value! as Map<String, dynamic>)['PW'],
        realName = (snapshot.value! as Map<String, dynamic>)['realName'],
        nickName = (snapshot.value! as Map<String, dynamic>)['nickName'],
        myScrap = (snapshot.value! as Map<List<String>, dynamic>?)?['myScrap'] ?? '',
        myHeart = (snapshot.value! as Map<List<String>, dynamic>?)?['myHeart'] ?? '',
        mySchool = (snapshot.value! as Map<String, dynamic>)['myschool'],
        email = (snapshot.value! as Map<String, dynamic>)['email'],
        phoneNumber = (snapshot.value! as Map<String, dynamic>)['phoneNumber'],
        myPost = (snapshot.value! as Map<List<String>, dynamic>?)?['myPost'] ?? '',
        anonyMessage = (snapshot.value! as Map<List<String>, dynamic>?)?['anonyMessage'] ?? '',
        boolAdmin = (snapshot.value! as Map<List<String>, dynamic>)['boolAdmin'],
        createdTime = (snapshot.value! as Map<List<String>, dynamic>)['createTime'],
        myRepl = (snapshot.value! as Map<List<String>, dynamic>?)?['myRepl'] ?? '',
        boolCertificated = (snapshot.value! as Map<List<String>, dynamic>)['boolCertificated']; //15


  toJson() {
    return {
      'ID': ID,
      'realName': realName,
      'PW': PW,
      'nickName': nickName,
      'myScrap': myScrap,
      'myHeart': myHeart,
      'mySchool': mySchool,
      'email': email,
      'phoneNumber': phoneNumber,
      'myPost': myPost,
      'anonyMessage': anonyMessage,
      'boolAdmin': boolAdmin,
      'createdTime': createdTime,
      'myRepl': myRepl,
      'boolCertificated': boolCertificated,

    };
  }
}
