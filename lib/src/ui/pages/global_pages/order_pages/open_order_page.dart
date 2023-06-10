// ignore_for_file: unused_result

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_brother/src/data/remote/order_services.dart';
import 'package:master_brother/src/repo/models/order_model.dart';
import 'package:master_brother/src/repo/providers/order_providers.dart';
import 'package:master_brother/src/ui/widgets/helper_box/sized_box.dart';
import 'package:master_brother/src/ui/widgets/helper_widgets/app_button.dart';
import 'package:master_brother/src/ui/widgets/toast/main.dart';
import 'package:master_brother/src/utils/extensions/order_status.dart';
import 'package:master_brother/src/utils/methods/navigators.dart';

class OpenOrderPage extends ConsumerWidget {
  final bool isSuccess;
  final bool isCancelled;
  final OrderModel order;

  const OpenOrderPage({
    Key? key,
    required this.order,
    this.isCancelled = false,
    this.isSuccess = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buyurtma"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Yaratildi - ${order.createTime} da",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "Tovar nomi - ${order.productName} ",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "Donasi - ${order.productCount} ",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "Narxi - ${order.productPrice} ",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "Buyurtmani - ${order.sellerID} qo'shdi",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "To'langan summa: ${order.paidSumma} so'm",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "Qolgan summa (qarzdorlik): ${order.productCount * order.productPrice - order.paidSumma > 0 ? order.productCount * order.productPrice - order.paidSumma : "Mavjud emas"} so'm",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "Qolgan summa (qarzdorlik): ${order.productCount * order.productPrice - order.paidSumma > 0 ? order.productCount * order.productPrice - order.paidSumma : "Mavjud emas"} so'm",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(12.0),
              Text(
                "Buyurtma statusi: ${OrderStatus.status(order.orderStatus)}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              HBox(24.0),
              order.orderStatus != 1
                  ? HBox(0.0)
                  : AppButton(
                      title: "Bajarildi",
                      onTap: () async {
                        await Order.orderSetStatusSuccess(order).then((value) {
                          pop(context);
                          pop(context);
                          ScaffoldMessage.success(context,
                              message: "Status O'zgartirildi!");
                          ref.refresh(getSuccessOrdersProvider);
                          ref.refresh(getWaitingOrdersProvider);
                        });
                      },
                    ),
              HBox(24.0),
              order.orderStatus != 1
                  ? HBox(0.0)
                  : AppButton(
                      color: Colors.transparent,
                      title: "Bekor Qilish",
                      onTap: () async {
                        await Order.orderSetStatusCancelled(order)
                            .then((value) {
                          pop(context);
                          pop(context);
                          ScaffoldMessage.success(context,
                              message: "Bekor qilindi!");
                          ref.refresh(getCancelledOrdersProvider);
                          ref.refresh(getWaitingOrdersProvider);
                        });
                      },
                    ),
              HBox(24.0),
              AppButton(
                color: Colors.transparent,
                title: "Buyurtmani o'chirish",
                onTap: () async {
                  await Order.deleteOrder(order).then((value) {
                    pop(context);
                    pop(context);
                    ScaffoldMessage.success(context,
                        message: "Buyurtma o'chirildi!");
                    ref.refresh(getWaitingOrdersProvider);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
