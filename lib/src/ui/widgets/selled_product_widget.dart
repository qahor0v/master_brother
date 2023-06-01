
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';

class SelledProductCard extends StatelessWidget {
  const SelledProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 8),
      child: SizedBox(
        height: 92,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                height: 92,
                width: 92,
                fit: BoxFit.cover,
                imageUrl:
                    "https://10wallpaper.com/wallpaper/1200x900/1106/Colorful_Paints_in_Buckets_1200x900.jpg",
                placeholder: (context, url) => const Center(
                  child: SizedBox(
                    height: 16.0,
                    width: 16.0,
                    child: CircularProgressIndicator(
                      color: mainColor,
                      strokeWidth: 2.0,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.image,
                  color: mainColor,
                  size: 32,
                ),
              ),
            ),
            WBox(8.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The Product Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                  ),
                  HBox(4.0),
                  const Text(
                    "The Product Name",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Text(
                        "Jami",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      WBox(4.0),
                      const Text(
                        "6767",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      WBox(4.0),
                      const Text(
                        "kg sotildi",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
