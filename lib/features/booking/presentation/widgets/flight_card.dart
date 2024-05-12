import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lc_airline/core/extensions/context_extensions.dart';
import 'package:lc_airline/core/presentation/constants/app_assets.dart';
import 'package:lc_airline/core/presentation/constants/spacer.dart';
import 'package:lc_airline/core/presentation/helpers/custom_functions.dart';
import 'package:lc_airline/core/presentation/routes/app_routes.dart';
import 'package:lc_airline/core/presentation/themes/app_themes.dart';
import 'package:lc_airline/features/booking/infrastructure/index.dart' as pc;

class FlightCard extends StatelessWidget {

  final pc.Performance performance;
  const FlightCard({super.key, required this.performance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(AppRoutes.flightDetailsScreen, extra: performance);
        },
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
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
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
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.primaryGrey.shade100,
                                      blurRadius: 12.0
                                    )
                                  ]
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                                child: Text(
                                  performance.duration,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppTheme.primaryGrey.shade300,
                                          blurRadius: 12.0
                                      )
                                    ]
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                                child: Text(
                                  stringDate(date: performance.departure),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                AppSpacer.h15,
                Text(
                  "${performance.from} to ${performance.to}",
                  style: context.theme.textTheme.headlineSmall,
                ),
                AppSpacer.h5,
                const Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
