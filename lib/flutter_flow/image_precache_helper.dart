import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/flutter_flow/custom_cache_manager.dart';

/// Helper class for precaching images to improve perceived performance
/// Precaches the first N images in the background before they're needed
class ImagePrecacheHelper {
  /// Precache a list of image URLs
  ///
  /// [context] - BuildContext for image precaching
  /// [imageUrls] - List of image URLs to precache
  /// [maxImages] - Maximum number of images to precache (default: 10)
  static Future<void> precacheImages(
    BuildContext context,
    List<String?> imageUrls, {
    int maxImages = 10,
  }) async {
    if (!context.mounted) return;

    // Filter out null/empty URLs and limit to maxImages
    final validUrls = imageUrls
        .where((url) => url != null && url.isNotEmpty)
        .take(maxImages)
        .toList();

    // Precache each image concurrently
    final precacheFutures = validUrls.map((url) {
      return _precacheSingleImage(context, url!);
    });

    // Wait for all precaching to complete, but don't throw errors
    await Future.wait(
      precacheFutures,
      eagerError: false,
    ).catchError((_) {
      // Silently ignore precaching errors - they're not critical
      return <void>[];
    });
  }

  /// Precache a single image
  static Future<void> _precacheSingleImage(
    BuildContext context,
    String imageUrl,
  ) async {
    if (!context.mounted) return;

    try {
      // Use CachedNetworkImageProvider with our custom cache manager
      final provider = CachedNetworkImageProvider(
        imageUrl,
        cacheManager: CustomCacheManager.instance,
      );

      // Precache the image
      await precacheImage(provider, context);
    } catch (e) {
      // Silently fail - precaching is optional performance optimization
    }
  }

  /// Precache images with a delay to avoid blocking initial UI
  /// This is useful for precaching after the initial UI has rendered
  static Future<void> precacheImagesDelayed(
    BuildContext context,
    List<String?> imageUrls, {
    int maxImages = 10,
    Duration delay = const Duration(milliseconds: 500),
  }) async {
    await Future.delayed(delay);
    if (context.mounted) {
      await precacheImages(context, imageUrls, maxImages: maxImages);
    }
  }
}
