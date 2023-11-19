import 'package:flutter/material.dart';

class DrawerContent {
  final IconData icon;
  final String title;

  DrawerContent({required this.icon, required this.title});
}

List<DrawerContent> listsDrawerContent = [
  DrawerContent(
      icon: Icons.home,
      title: 'Home'
  ),
  DrawerContent(
      icon: Icons.person,
      title: 'Profile'
  ),
  DrawerContent(
      icon: Icons.settings,
      title: 'Settings'
  ),
  DrawerContent(
      icon: Icons.details,
      title: 'Details'
  ),
];