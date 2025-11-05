import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/custom_cache_manager.dart';

/// Background Image Preloader Service
/// Preloads business images in the background during authentication
/// This provides instant image display when user reaches the home page
class BackgroundImagePreloader {
  static final BackgroundImagePreloader _instance = BackgroundImagePreloader._internal();
  factory BackgroundImagePreloader() => _instance;
  BackgroundImagePreloader._internal();

  bool _isPreloading = false;
  int _preloadedCount = 0;

  /// Check if preloading is currently in progress
  bool get isPreloading => _isPreloading;

  /// Get count of successfully preloaded images
  int get preloadedCount => _preloadedCount;

  /// Start preloading business images in the background
  /// This should be called on login/welcome screens
  Future<void> startPreloading(BuildContext context) async {
    if (_isPreloading || !context.mounted) return;

    _isPreloading = true;
    _preloadedCount = 0;

    try {
      // Fetch business data from Supabase (limited to first 30 for performance)
      final businesses = await BusinessTable().queryRows(
        queryFn: (q) => q
            .order('created_at', ascending: false)
            .limit(30),
      );

      if (!context.mounted) {
        _isPreloading = false;
        return;
      }

      // Extract image URLs
      final imageUrls = businesses
          .where((b) => b.coverPhoto != null && b.coverPhoto!.isNotEmpty)
          .map((b) => b.coverPhoto!)
          .toList();

      // Preload images in batches to avoid overwhelming the device
      await _preloadImagesInBatches(context, imageUrls, batchSize: 5);

    } catch (e) {
      // Silently fail - preloading is optional optimization
      debugPrint('Background image preloading error: $e');
    } finally {
      _isPreloading = false;
    }
  }

  /// Preload images in small batches to avoid memory issues
  Future<void> _preloadImagesInBatches(
    BuildContext context,
    List<String> imageUrls, {
    int batchSize = 5,
  }) async {
    for (int i = 0; i < imageUrls.length; i += batchSize) {
      if (!context.mounted) break;

      final batch = imageUrls.skip(i).take(batchSize).toList();

      // Load batch concurrently
      await Future.wait(
        batch.map((url) => _preloadSingleImage(context, url)),
        eagerError: false,
      ).catchError((_) {
        // Continue even if batch fails
        return <void>[];
      });

      // Small delay between batches to be gentle on device resources
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  /// Preload a single image into cache
  Future<void> _preloadSingleImage(BuildContext context, String imageUrl) async {
    if (!context.mounted) return;

    try {
      final provider = CachedNetworkImageProvider(
        imageUrl,
        cacheManager: CustomCacheManager.instance,
        maxHeight: 200,
        maxWidth: 600,
      );

      await precacheImage(provider, context);
      _preloadedCount++;
    } catch (e) {
      // Silently fail for individual images
    }
  }

  /// Cancel ongoing preloading (e.g., if user navigates away quickly)
  void cancel() {
    _isPreloading = false;
  }

  /// Reset preloader state
  void reset() {
    _isPreloading = false;
    _preloadedCount = 0;
  }
}
