import 'package:base_ui_flutter_example/utils/commom/app_color.dart';
import 'package:base_ui_flutter_example/utils/commom/app_text.dart';
import 'package:base_ui_flutter_example/utils/widget/app_back_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/model/payment_model.dart';

class PaymentCardsRoute extends StatelessWidget {
  const PaymentCardsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const PaymentCardsPage();
}

class PaymentCardsPage extends StatefulWidget {
  const PaymentCardsPage({Key? key}) : super(key: key);

  @override
  State<PaymentCardsPage> createState() => _PaymentCardsPageState();
}

class _PaymentCardsPageState extends State<PaymentCardsPage> {
  final List<Payment> categoryList = Payment().onCategoryList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBackWidget(
              title: 'Payment cards',
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: categoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _itemPayments(categoryList[index]);
                  }),
            ),
            InkWell(
              onTap: () {
                //TODO add payments
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.mainGreen,
                    borderRadius: BorderRadius.circular(2.sp)),
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.all(20.h),
                margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
                child: AppText.bodyMedium(
                  'Add new card',
                  color: AppColors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemPayments(Payment payment) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: AppColors.lightGray)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 70.w,
            child: payment.imageCard,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.primary(
                    payment.cardNumber ?? '',
                    color: AppColors.gray,
                    fontSize: 16.sp,
                    textAlign: TextAlign.start,
                  ),
                  AppText.bodyMedium(
                    payment.date ?? '',
                    color: AppColors.gray,
                    fontSize: 12.sp,
                    fontWeight: FontWeightType.regular,
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 32.w,
            height: 32.w,
            child: payment.iconPay,
          )
        ],
      ),
    );
  }
}