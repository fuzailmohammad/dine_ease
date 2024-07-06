import 'package:cached_network_image/cached_network_image.dart';
import 'package:dine_ease/app/data/values/strings.dart';
import 'package:dine_ease/app/modules/restaurant_detail/controllers/restaurant_detail_controller.dart';
import 'package:dine_ease/app/theme/app_colors.dart';
import 'package:dine_ease/app/theme/styles.dart';
import 'package:dine_ease/widgets/buttons/primary_filled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';


class RestaurantDetailView extends GetView<RestaurantDetailController> {

  const RestaurantDetailView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.restaurant.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: controller.restaurant.image,
              fit: BoxFit.contain,
              placeholder: (context, url) => const Center(
                child: CupertinoActivityIndicator(
                  radius: 20,
                  color: AppColors.lightGreen,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              controller.restaurant.name,
              style: Styles.tsPrimaryColorSemiBold20,
            ),
            const SizedBox(height: 8),
            Text(
              controller.restaurant.address,
              style: Styles.tsGreyRegular14,
            ),
            const SizedBox(height: 8),
            RatingBarIndicator(
              rating: controller.restaurant.rating,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: AppColors.goldYellow,
              ),
              itemCount: 5,
              itemSize: 25.0,
              direction: Axis.horizontal,
            ),
            const SizedBox(height: 16),
            Text(
              controller.restaurant.description,
              style: Styles.tsPrimaryColorRegular14,
            ),
            const SizedBox(height: 16),
            const Text(
              Strings.review,
              style: Styles.tsPrimaryColorSemiBold20,
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.restaurant.reviews.length,
              itemBuilder: (context, index) {
                final review = controller.restaurant.reviews[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(review.userId[0]),
                  ),
                  title: Text(review.reviewText),
                  subtitle: RatingBarIndicator(
                    rating: review.rating.toDouble(),
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: AppColors.goldYellow,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                );
              },
            ),
            PrimaryFilledButton(text: Strings.bookATable, onTap: controller.onTapBooking),
          ],
        ),
      ),
    );
  }
}
