import 'package:flutter/material.dart';
import 'components/achievements_widget.dart';
import 'components/points_widget.dart';
import 'components/profile_appbar.dart';
import 'components/profile_header_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const ProfileHeader(),
                const PointsWidget(),
                const AchievementsWidget(),
                Container(
                  margin: const EdgeInsets.only(bottom: 8, top: 4),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ]),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Мои хабы',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              hubItem(),
                              const SizedBox(
                                height: 12,
                              ),
                              hubItem(),
                              const SizedBox(
                                height: 12,
                              ),
                              hubItem(),
                            ],
                          ),
                          Column(
                            children: [
                              hubItem(),
                              const SizedBox(
                                height: 12,
                              ),
                              hubItem(),
                              const SizedBox(
                                height: 12,
                              ),
                              hubItem(),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [TextButton(onPressed: () {}, child: const Text('Больше'))],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8, top: 4),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18), boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ]),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text(
                            'История хабов',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              hubItem(),
                              const SizedBox(
                                height: 12,
                              ),
                              hubItem(),
                              const SizedBox(
                                height: 12,
                              ),
                              hubItem(),
                            ],
                          ),
                          Column(
                            children: const [
                              Text('24 апреля 2022', style: TextStyle(color: Colors.grey)),
                              SizedBox(
                                height: 12,
                              ),
                              Text('29 августа 2021', style: TextStyle(color: Colors.grey)),
                              SizedBox(
                                height: 12,
                              ),
                              Text('1 июля 2022', style: TextStyle(color: Colors.grey))
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [TextButton(onPressed: () {}, child: const Text('Больше'))],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row hubItem() {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(25)),
        ),
        const SizedBox(
          width: 8,
        ),
        const Text(
          'Приэльбрусье',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
