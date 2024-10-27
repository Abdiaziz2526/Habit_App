import 'package:flutter/material.dart';
import 'package:habbit_app/Widgets/app_Colors.dart';
import 'package:iconly/iconly.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text("Settings"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Settings Options
          
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildSettingItem(IconlyLight.notification, "Notifications"),
            _buildSettingItem(IconlyLight.lock, "Privacy & Security"),
            _buildSettingItem(IconlyLight.bookmark, "Language"),
            _buildSettingItem(IconlyLight.info_square, "Help & Support"),
            _buildSettingItem(IconlyLight.info_circle, "About App"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 0.5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Handle setting item tap
        },
      ),
    );
  }
}
