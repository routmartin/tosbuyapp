import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tostinh/assets/app_icons.dart';

import '../../../config.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    Key? key,
    required this.imageUrl,
    required this.fit,
    this.borderRadius,
    this.placeholder,
    this.clip,
  }) : super(key: key);
  final String? imageUrl;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;
  final PlaceholderWidgetBuilder? placeholder;
  final Clip? clip;

  String _validateImageUrl() {
    String url = "";
    if (imageUrl != null) {
      if (imageUrl!.contains("https") == false || imageUrl!.contains("http") == false) {
        url = ConfigEnvironments.getEnvironments()[BaseApi.baseMediaUrl]! +
            imageUrl!;
      } else {
        url = imageUrl.toString();
      }
    }
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      clipBehavior: clip ?? Clip.antiAlias,
      child: CachedNetworkImage(
        imageUrl: _validateImageUrl(),
        fadeOutDuration: Duration.zero,
        fadeInDuration: Duration.zero,
        placeholder: placeholder ?? _buildPlaceholder,
        errorWidget: (context, url, error) {
          return placeholder != null
              ? placeholder!.call(context, url)
              : Image.asset(AppIcons.tosTinhShimmer);
        },
        fit: fit,
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context, String val) {
    return Image.asset(AppIcons.tosTinhShimmer);
  }
}
