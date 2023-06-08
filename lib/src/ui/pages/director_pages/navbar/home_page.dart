import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:master_brother/src/repo/providers/order_providers.dart';
import 'package:master_brother/src/repo/providers/pament_providers.dart';
import 'package:master_brother/src/repo/providers/product_providers.dart';
import 'package:master_brother/src/ui/pages/global_pages/order_pages/open_orders_list.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/title.dart';
import 'package:master_brother/src/utils/constants/app_colors.dart';
import 'package:master_brother/src/utils/methods/navigators.dart';

class DirectorHomePage extends StatefulHookConsumerWidget {
  const DirectorHomePage({super.key});

  @override
  ConsumerState<DirectorHomePage> createState() => _DirectorHomePageState();
}

class _DirectorHomePageState extends ConsumerState<DirectorHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTitle("Bugungi buyurtmalar"),
                ref.watch(getSuccessOrdersProvider).when(
                      data: (data) {
                        return ListTile(
                          onTap: () {
                            goTo(
                              context,
                              OpenOrdersListPage(
                                orders: data,
                                title: "Bajarilgan buyurtmalar",
                              ),
                            );
                          },
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(
                            IconlyLight.shield_done,
                            color: mainColor,
                          ),
                          title: const Text(
                            "Bajarilgan buyurtmalar",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          trailing: Text(
                            "${data.length} ta",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      error: (e, m) {
                        return WBox(0.0);
                      },
                      loading: () => WBox(0.0),
                    ),
                ref.watch(getWaitingOrdersProvider).when(
                      data: (data) {
                        return ListTile(
                          onTap: () {
                            goTo(
                              context,
                              OpenOrdersListPage(
                                orders: data,
                                title: "Jarayondagi buyurtmalar",
                              ),
                            );
                          },
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(
                            IconlyLight.time_circle,
                            color: Colors.yellowAccent,
                          ),
                          title: const Text(
                            "Jarayondagi buyurtmalar",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          trailing: Text(
                            "${data.length} ta",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      error: (e, m) {
                        return WBox(0.0);
                      },
                      loading: () => WBox(0.0),
                    ),
                ref.watch(getCancelledOrdersProvider).when(
                      data: (data) {
                        return ListTile(
                          onTap: () {
                            goTo(
                              context,
                              OpenOrdersListPage(
                                orders: data,
                                title: "Bekor qilingan buyurtmalar",
                              ),
                            );
                          },
                          contentPadding: EdgeInsets.zero,
                          leading: const Icon(
                            IconlyLight.close_square,
                            color: Colors.redAccent,
                          ),
                          title: const Text(
                            "Bekor qilingan buyurtmalar",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          trailing: Text(
                            "${data.length} ta",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                      error: (e, m) {
                        return WBox(0.0);
                      },
                      loading: () => WBox(0.0),
                    ),
                HBox(16.0),
                AppTitle("Bugungi moliyaviy hisobot"),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.attach_money,
                    color: mainColor,
                  ),
                  title: const Text(
                    "Qilingan to'lovlar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: ref.watch(getSuccessPaymentProvider).when(
                        data: (data) {
                          return Text(
                            "$data so'm",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          );
                        },
                        error: (e, m) {
                          return const Text(
                            "0.0",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          );
                        },
                        loading: () => HBox(0.0),
                      ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.attach_money,
                    color: Colors.redAccent,
                  ),
                  title: const Text(
                    "Qarzdorliklar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: ref.watch(getQarzedPaymentProvider).when(
                    data: (data) {
                      return Text(
                        "$data so'm",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      );
                    },
                    error: (e, m) {
                      return const Text(
                        "0 so'm",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      );
                    },
                    loading: () {
                      return HBox(0.0);
                    },
                  ),
                ),
                HBox(16.0),
                ref.watch(getAllStorageProducts).when(
                      data: (data) {
                        return Column(
                          children: [
                            data.isNotEmpty
                                ? AppTitle("Omborxona holati")
                                : HBox(0.0),
                            ...List<Widget>.generate(data.length, (index) {
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: const Icon(
                                  Icons.attach_money,
                                  color: Colors.redAccent,
                                ),
                                title: Text(
                                  data[index].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: Text(
                                  "${data[index].count} ta mavjud",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            })
                          ],
                        );
                      },
                      error: (e, m) {
                        return HBox(0.0);
                      },
                      loading: () => HBox(0.0),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
