import 'package:flutter/material.dart';

class VenueGalleryEvent extends StatelessWidget {
  final List<String> images;
  final double horizontalPadding;
  final double verticalPadding;
  final int crossAxisCount;
  final double aspectRatio;
  final VoidCallback? onGalleryTap;
  final bool isLoading;

  const VenueGalleryEvent({
    super.key,
    required this.images,
    this.horizontalPadding = 16.0,
    this.verticalPadding = 0,
    this.crossAxisCount = 2,
    this.aspectRatio = 1.5,
    this.onGalleryTap,
    this.isLoading = false, required List<Map<String, String>> items,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isPortrait = constraints.maxHeight > screenWidth;
        final dynamicCrossAxisCount = isPortrait ? crossAxisCount : (crossAxisCount + 1);

        final itemWidth = (screenWidth - (horizontalPadding * 2) -
                ((dynamicCrossAxisCount - 1) * 10)) /
            dynamicCrossAxisCount;
        final itemHeight = itemWidth / aspectRatio;

        if (isLoading) {
          return _buildLoadingGrid(dynamicCrossAxisCount, itemWidth, itemHeight);
        }

        if (images.isEmpty) {
          return _buildEmptyState();
        }

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: dynamicCrossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: aspectRatio,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return GalleryItem(
                venue: Venue(
                  imageUrl: images[index],
                  title: "Venue $index",
                  location: "Location $index",
                  price: "Price $index",
                  rating: "Rating $index",
                ),
                width: itemWidth,
                height: itemHeight,
                onTap: () => _handleImageTap(context, index),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildLoadingGrid(int crossAxisCount, double itemWidth, double itemHeight) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: aspectRatio,
      ),
      itemCount: crossAxisCount * 2,
      itemBuilder: (context, index) {
        return ShimmerLoadingItem(width: itemWidth, height: itemHeight);
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_library_outlined,
            size: 48,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No images available',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  void _handleImageTap(BuildContext context, int index) {
    if (onGalleryTap != null) {
      onGalleryTap!();
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryViewerPage(
          images: images,
          initialIndex: index,
        ),
      ),
    );
  }
}

class Venue {
  final String imageUrl;
  final String title;
  final String location;
  final String price;
  final String rating;

  Venue({
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
  });
}

class GalleryItem extends StatefulWidget {
  final Venue venue;
  final double width;
  final double height;
  final VoidCallback? onTap;

  const GalleryItem({
    super.key,
    required this.venue,
    required this.width,
    required this.height,
    this.onTap,
  });

  @override
  _GalleryItemState createState() => _GalleryItemState();
}

class _GalleryItemState extends State<GalleryItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.venue.imageUrl,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 9),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          
                          widget.venue.imageUrl,
                          fit: BoxFit.cover,
                          width: widget.width,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: Colors.grey[400],
                                    size: 24,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Error loading image',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.venue.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                widget.venue.location,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.currency_rupee,
                                        size: 12,
                                        color: Colors.grey[700],
                                      ),
                                      Text(
                                        widget.venue.price,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 12,
                                        color: Colors.amber,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        widget.venue.rating,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GalleryViewerPage extends StatelessWidget {
  final List<String> images;
  final int initialIndex;

  const GalleryViewerPage({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Image ${initialIndex + 1} of ${images.length}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: PageView.builder(
        controller: PageController(initialPage: initialIndex),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Hero(
            tag: images[index],
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              child: Center(
                child: Image.asset(
                  images[index],
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShimmerLoadingItem extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerLoadingItem({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
