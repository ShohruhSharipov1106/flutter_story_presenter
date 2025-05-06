import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';

class VideoUtils {
  VideoUtils._();

  // Cache manager to handle caching of video files.
  final _cacheManager = DefaultCacheManager();

  // Singleton instance of VideoUtils.
  static final VideoUtils instance = VideoUtils._();

  // Method to create a VideoPlayerController from a URL.
  // If cacheFile is true, it attempts to cache the video file.
  Future<VideoPlayerController> videoControllerFromUrl({
    required String url,
    bool? cacheFile = false,
    VideoPlayerOptions? videoPlayerOptions,
  }) async {
    try {
      File? cachedVideo;
      // If caching is enabled, try to get the cached file.
      if (cacheFile ?? false) {
        final videoFileFromCache = await _cacheManager.getFileFromCache(url);
        if (videoFileFromCache != null) {
          cachedVideo = videoFileFromCache.file;
        } else {
          _cacheManager.getSingleFile(url).then((value) => cachedVideo = value);
        }
      }
      // If a cached video file is found, create a VideoPlayerController from it.
      if (cachedVideo != null) {
        return VideoPlayerController.file(
          cachedVideo!,
          videoPlayerOptions: videoPlayerOptions,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    // If no cached file is found, create a VideoPlayerController from the network URL.
    return VideoPlayerController.networkUrl(
      Uri.parse(url),
      httpHeaders: {'Content-Disposition': 'attachment'},
      videoPlayerOptions: videoPlayerOptions,
    );
  }

  // Method to create a VideoPlayerController from a local file.
  VideoPlayerController videoControllerFromFile({
    required File file,
    VideoPlayerOptions? videoPlayerOptions,
  }) {
    return VideoPlayerController.file(
      file,
      videoPlayerOptions: videoPlayerOptions,
    );
  }

  // Method to create a VideoPlayerController from an asset file.
  VideoPlayerController videoControllerFromAsset({
    required String assetPath,
    VideoPlayerOptions? videoPlayerOptions,
  }) {
    return VideoPlayerController.asset(
      assetPath,
      videoPlayerOptions: videoPlayerOptions,
    );
  }
}

enum VideoStatus {
  loading,
  error,
  live;

  bool get hasError => this == error;

  bool get isLive => this == live;
}
