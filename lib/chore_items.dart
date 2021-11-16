import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoreItem{
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const ChoreItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

}

class ChoreItemState {
  final String title;
  bool value;

  ChoreItemState({
    required this.title,
    this.value = false,
  });

}

List<ChoreItem> chore = [
  ChoreItem(
    title: 'Water Plants', subtitle: '1:25 pm', icon: Icons.grass, color: Colors.lightGreen,
  ),
  ChoreItem(
    title: 'Take out trash', subtitle: '2:00 pm',icon: Icons.delete,color: Colors.indigo,
  ),
  ChoreItem(
    title: 'Clean bathrooms', subtitle: '4:00 pm',icon: Icons.shower,color: Colors.lightBlue,
  ),
  ChoreItem(
    title: 'Do laundry', subtitle: '5:00 pm',icon: Icons.local_laundry_service,color: Colors.pink,
  ),
  ChoreItem(
    title: 'Sweep and Mop Kitchen', subtitle: '5:30 pm',icon: Icons.cleaning_services,color: Colors.deepOrangeAccent,
  ),
  ChoreItem(title: "Make bed", subtitle: '10:00 am',icon: Icons.bed,color: Colors.deepPurpleAccent,)
];