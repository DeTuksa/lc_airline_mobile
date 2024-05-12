import 'package:flutter/material.dart';
import 'package:lc_airline/core/extensions/context_extensions.dart';
import 'package:lc_airline/core/presentation/constants/app_assets.dart';
import 'package:lc_airline/core/presentation/constants/spacer.dart';
import 'package:lc_airline/core/presentation/helpers/custom_functions.dart';
import 'package:lc_airline/core/presentation/themes/app_themes.dart';
import 'package:lc_airline/core/presentation/widgets/buttons/app_button.dart';

class FlightDetailsScreen extends StatefulWidget {
  const FlightDetailsScreen({super.key});

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {

  final passengerCount = ValueNotifier<int>(1);
  final scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
      ),
      backgroundColor: AppTheme.primaryGrey.shade100,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: context.mediaQuery.size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)
                  ),
                color: Colors.white
              ),
              child: Column(
                children: [
                  Container(
                    width: context.mediaQuery.size.width,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryGrey.shade50
                        )
                      ]
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)
                      ),
                      child: Image.asset(
                          AppAssets.plane,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppSpacer.h16,
                        Text(
                          "Boeing 737 from London to Madrid",
                          style: context.theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 20
                          ),
                        ),
                        AppSpacer.h20,
                        Text(
                          "An exciting flight in a Cessna 172 sightseeing airplane over the neighborhood"
                              " of the airfield. The flight includes performance of simple aerobatics "
                              "figures and short-term weightlessness mode.",
                          style: context.theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppSpacer.h20,
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16)
              ),
              width: context.mediaQuery.size.width,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flight Options",
                    style: context.theme.textTheme.headlineSmall?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AppSpacer.h16,
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryGrey.shade200,
                          blurRadius: 10
                        ),
                      ],
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.white
                    ),
                    padding: const EdgeInsets.all(16.0),
                    width: context.mediaQuery.size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 20,
                            ),
                            AppSpacer.w16,
                            Text(
                              stringDate(date: DateTime.now()),
                              style: context.theme.textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        AppSpacer.h10,
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.face_rounded,
                                ),
                                AppSpacer.w16,
                                Text(
                                  "Passengers",
                                  style: context.theme.textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            ValueListenableBuilder(
                              valueListenable: passengerCount,
                              builder: (context, val, _) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: passengerCount.value > 1 ? () {
                                        passengerCount.value = passengerCount.value - 1;
                                      } : null,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: AppTheme.primaryGrey.shade100
                                        ),
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Icon(
                                          Icons.remove,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                    AppSpacer.w5,
                                    Text(
                                      passengerCount.value.toString(),
                                      style: context.theme.textTheme.bodyLarge,
                                    ),
                                    AppSpacer.w5,
                                    GestureDetector(
                                      onTap: passengerCount.value < 6 ? () {
                                        passengerCount.value = passengerCount.value + 1;
                                      } : () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: const Text(
                                              "Can't book for more than 6 passengers at once"
                                            ),
                                            backgroundColor: AppTheme.primaryGrey.shade600,
                                          )
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: AppTheme.primaryGrey.shade100
                                        ),
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Icon(
                                          Icons.add,
                                          size: 16,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppSpacer.h10,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AppButton(
                text: "Purchase Ticket(s)",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
