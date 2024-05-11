import 'package:flutter/material.dart';
import 'package:lc_airline/core/extensions/context_extensions.dart';
import 'package:lc_airline/core/presentation/constants/app_assets.dart';
import 'package:lc_airline/core/presentation/constants/spacer.dart';

class FlightCard extends StatelessWidget {
  const FlightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: context.mediaQuery.size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 160,
                  width: context.mediaQuery.size.width,
                  child: Image.asset(
                    AppAssets.flight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              AppSpacer.h15,
              Text(
                "Lagos to London",
                style: context.theme.textTheme.headlineSmall,
              ),
              AppSpacer.h5,
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
