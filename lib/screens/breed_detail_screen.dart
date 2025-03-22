import 'package:flutter/material.dart';
import '../models/breed.dart';

class BreedDetailScreen extends StatelessWidget {
  final Breed breed;

  const BreedDetailScreen({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(breed.name)),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Imagen de la raza
          breed.imageUrl.isNotEmpty
              ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  breed.imageUrl,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              )
              : Icon(Icons.pets, size: 100, color: Colors.grey),

          SizedBox(height: 20),

          // Nombre de la raza
          Text(
            breed.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 10),

          // Información en tarjetas
          _buildInfoCard("Temperament", breed.temperament),
          _buildInfoCard("Weight", "${breed.weight} kg"),
          _buildInfoCard("Height", "${breed.height} cm"),
          _buildInfoCard("Origin", breed.origin),
        ],
      ),
    );
  }

  // Widget para mostrar la información en tarjetas
  Widget _buildInfoCard(String title, String value) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(value, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
