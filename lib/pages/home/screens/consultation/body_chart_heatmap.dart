import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../controllers/heatmap_controller.dart';
import '../../../../widgets/bodypart_heatmap.dart';

class BodyChartHeatmap extends StatelessWidget {
   BodyChartHeatmap({super.key});
  final hController = Get.put(HeatmapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFEEEEEE),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(top: 25, left: 25),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          ),
        ),

        title: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Text(
            "New consultation",
            style: GoogleFonts.poppins(
              color: const Color(0xFF030D43),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            
            // 💥 1. The BodyHeatmap Widget (wrapped in Obx for reactivity)
            Obx(() => BodyHeatmap(
                  selectedParts: hController.bodyPartIntensities.value,
                  baseColor: Colors.red,

                  unselectedColor: Colors.grey[300]!,
                  width: 350,
                  legendAlignment: MainAxisAlignment.center,
                  legendTextStyle: GoogleFonts.poppins(color: Colors.green),
                  intensityLevels: 5, // 5 levels of heatmap intensity
                  showLegend: true,
                  // 💥 The key to interactivity: The onPartTap callback
                  onPartTap: (partId) => _showPartDetailsDialog(context, partId),
                ),
            ),
        
            // const Divider(),
        
            // 💥 2. Display Reported Issues (Reacts to partDescriptions map)
            const Text(
              'Reported Issues:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Obx(() {
              if (hController.partDescriptions.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Tap a body part to report an issue!'),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: hController.partDescriptions.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '${entry.key.toUpperCase()}: ${entry.value}',
                        style: const TextStyle(color: Colors.black54),
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  void _showPartDetailsDialog(BuildContext context, String partId) {
    // Get current state to pre-fill inputs
    int currentIntensity = hController.bodyPartIntensities.value[partId] ?? 0;
    String currentDescription = hController.partDescriptions.value[partId] ?? '';
    
    final TextEditingController descController = TextEditingController(text: currentDescription);
    final RxInt selectedIntensity = currentIntensity.obs;

    // Use Get.dialog for simpler management within GetX
    Get.dialog(
      AlertDialog(
        title: Text('Issue on ${partId.toUpperCase()}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Intensity Slider (Heatmap Input)
            const Text('Pain Intensity (0-10):'),
            Obx(() => Slider(
                  value: selectedIntensity.value.toDouble(),
                  min: 0,
                  max: 10,
                  divisions: 10,
                  label: selectedIntensity.value.toString(),
                  onChanged: (double newValue) {
                    selectedIntensity.value = newValue.round();
                  },
                ),
            ),
            
            // Description Text Area
            const SizedBox(height: 10),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: 'Description (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              // Update state via the GetX controller
              hController.saveIntensity(partId, selectedIntensity.value);
              hController.saveDescription(partId, descController.text);
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
