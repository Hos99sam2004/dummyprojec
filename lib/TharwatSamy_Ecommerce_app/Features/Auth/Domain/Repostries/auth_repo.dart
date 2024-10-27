import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future LoginWithGoogle();
  Future LoginWithFaceBook();
  Future CompleteInformTION({@ required String name, @required String phone, @required String address});
}