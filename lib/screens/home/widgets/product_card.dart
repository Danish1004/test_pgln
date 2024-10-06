import 'package:flutter/material.dart';
import 'package:pingolearn_assignment/widgets/app_card.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final bool showDiscountedPrice;

  const ProductCard(
      {Key? key, required this.product, required this.showDiscountedPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double originalPrice = product['price'] ?? 0.0;
    double discountPercentage = product['discountPercentage'] ?? 0;
    double discountedPrice =
        originalPrice - (originalPrice * discountPercentage / 100);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              product['thumbnail'],
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            product['title'],
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            product['description'],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8.0),
          showDiscountedPrice
              ? Row(
                  children: [
                    Text(
                      '\$${originalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Text(
                      '\$${discountedPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 6.0),
                    Text(
                      '(${discountPercentage.toStringAsFixed(0)}% off)',
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  ],
                )
              : Text(
                  originalPrice.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
        ],
      ),
    );
  }
}
