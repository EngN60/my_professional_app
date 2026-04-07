import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اكتشف عقارك المثالي', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. شريط البحث
            TextField(
              decoration: InputDecoration(
                hintText: 'ابحث عن شقة، فيلا، أرض...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 25),
            
            // 2. التصنيفات
            const Text("التصنيفات", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryItem(Icons.apartment, "شقق"),
                _buildCategoryItem(Icons.home, "فيلات"),
                _buildCategoryItem(Icons.landscape, "أراضي"),
                _buildCategoryItem(Icons.store, "محلات"),
              ],
            ),
            const SizedBox(height: 30),

            // 3. قائمة العقارات (العرض الأفقي)
            const Text("عقارات مميزة", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            SizedBox(
              height: 280,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPropertyCard("فيلا مودرن", "صنعاء - حدة", "150,000\$", "https://images.unsplash.com/photo-1580587771525-78b9daa3b6af?q=80&w=500"),
                  _buildPropertyCard("شقة فاخرة", "عدن - كريتر", "80,000\$", "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?q=80&w=500"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ودجت بناء التصنيف
  Widget _buildCategoryItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(15)),
          child: Icon(icon, color: const Color(0xFF1A237E)),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  // ودجت بناء كرت العقار
  Widget _buildPropertyCard(String title, String location, String price, String imageUrl) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(imageUrl, height: 140, width: 220, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(location, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                const SizedBox(height: 8),
                Text(price, style: const TextStyle(color: Color(0xFF1A237E), fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          )
        ],
      ),
    );
  }
}