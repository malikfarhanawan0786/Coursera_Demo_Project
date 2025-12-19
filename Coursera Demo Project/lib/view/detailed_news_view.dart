
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:globe_pulse/utils/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api_services/get_api.dart';
class DetailedNewsView extends StatelessWidget {
  const DetailedNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    GetApiResponse getApiResponse = GetApiResponse();
                         // author exception handling
    final author = (args['author'] != null &&
        args['author'].toString().trim().isNotEmpty
        && args['author'].toString().toLowerCase() != 'null') ? args['author'] : "Unknown author";
                       // title exception Handling
    final title = (args['title'] != null &&
        args['title'].toString().trim().isNotEmpty &&
        args['title'].toString().toLowerCase() != 'null'
    ) ? args['title'] : "";
                      // description exception handiling
    final description = (args['description']!= null
        && args['description'].toString().trim().isNotEmpty &&
        args['description'].toString().toLowerCase() != 'null'
    ) ? args['description'] : "";
                     // time exception handling
    final publishedAt = (args['publishedAt']!= null
        && args['publishedAt'].toString().trim().isNotEmpty &&
        args['publishedAt'].toString().toLowerCase() != 'null'
    ) ? args['publishedAt'] : "";
                   // source exception handling
    final source = (args['source']!= null
        && args['source'].toString().trim().isNotEmpty &&
        args['source'].toString().toLowerCase() != 'null'
    ) ? args['source'] : "";
                  // content exception handling
    final content = (args['content']!= null
        && args['content'].toString().trim().isNotEmpty &&
        args['content'].toString().toLowerCase() != 'null'
    ) ? args['content'] : "";
                // Image exception handling
    final imageUrl = args['image']?.toString().trim();
    Widget imageWidget;
    if (imageUrl != null && imageUrl.isNotEmpty && imageUrl != "null") {
      imageWidget = Padding(
        padding: const EdgeInsets.all(20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.broken_image, size: 100, color: Colors.white),
            ),
          ),
        ),
      );
    } else {
      imageWidget = Center(
        child: Container(
          width: double.infinity,
          height: 200,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.broken_image, size: 100, color: Colors.white),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light ?
        AppColors.backgroundColorLT : AppColors.backgroundColorDT,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                          // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(title, style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Theme.of(context).brightness == Brightness.light ?
                  AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT,
                ),),
              ),
              SizedBox(height: 10,),
                         // description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(description, style: TextStyle(
                  fontSize: 16,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Theme.of(context).brightness == Brightness.light ?
                  AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT,
                ),),
              ),
              SizedBox(height: 10,),
                         // author
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("News By: ${author}", style: TextStyle(
                  fontSize: 14,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Theme.of(context).brightness == Brightness.light ?
                  AppColors.textSecondaryColorLT : AppColors.textSecondaryColorDT,
                ),),
              ),
              SizedBox(height: 10,),
                         // Image
              imageWidget,
                        // Published At
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child:  Text("Published At: ${publishedAt}", style: TextStyle(
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Theme.of(context).brightness == Brightness.light ?
                  AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT,
                ),),
                ),
                       // source
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 20),
                child:  Text("Source: ${source}", style: TextStyle(
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Theme.of(context).brightness == Brightness.light ?
                  AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT,
                ),),
              ),
                     // content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child:  SelectableText(
                  content,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                  fontSize: 16,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Theme.of(context).brightness == Brightness.light ?
                  AppColors.textPrimaryColorLT : AppColors.textPrimaryColorDT,
                ),),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
