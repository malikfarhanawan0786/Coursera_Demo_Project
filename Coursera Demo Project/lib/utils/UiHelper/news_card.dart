import 'package:flutter/material.dart';
import 'package:globe_pulse/utils/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard {
  static Widget newsCard(
      BuildContext context, {
        required String newsName,
        required String newsTitle,
        required String image,
      }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.cardColorLT
            : AppColors.cardColorDT,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // 🖼️ Image Section
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 110,
                height: 110,
                color: Colors.grey.shade300,
                child: const Icon(Icons.broken_image, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // 📰 Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // News source
                Text(
                  newsName,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.textSecondaryColorLT
                        : AppColors.textSecondaryColorDT,
                  ),
                ),
                const SizedBox(height: 6),

                // News title
                Text(
                  newsTitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                    color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.textPrimaryColorLT
                        : AppColors.textPrimaryColorDT,
                  ),
                ),

                const SizedBox(height: 10),

                // "Read More" button
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 20),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    "Read more →",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: AppColors.primaryColorLT,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
