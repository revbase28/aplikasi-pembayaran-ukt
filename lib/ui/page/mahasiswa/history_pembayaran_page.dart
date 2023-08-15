import 'package:aplikasi_pembayaran_ukt/model/history_transaksi/history_transaksi.dart';
import 'package:aplikasi_pembayaran_ukt/model/history_transaksi/history_transaksi.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/hisotry_bayar_item.dart';
import 'package:aplikasi_pembayaran_ukt/ui/widget/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme.dart';
import '../../../core/tools/util.dart';
import '../../../cubit/history_transaksi_cubit.dart';
import '../../widget/back_icon_button.dart';

class HistoryPembayaranPage extends StatefulWidget {
  const HistoryPembayaranPage({Key? key}) : super(key: key);

  @override
  State<HistoryPembayaranPage> createState() => _HistoryPembayaranPageState();
}

class _HistoryPembayaranPageState extends State<HistoryPembayaranPage> {
  @override
  void initState() {
    context.read<HistoryTransaksiCubit>().getHistoryTransaksi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: BackIconButton(color: kBlackColor),
              )),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                bottom: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("History Pembayaran",
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 24)),
                const SizedBox(height: 20),
                BlocBuilder<HistoryTransaksiCubit, HistoryTransaksiState>(
                  builder: (context, state) {
                    if (state is HistoryTransaksiSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: state.listHistory
                            .map((HistoryTransaksi item) => HistoryBayarItem(
                                date: Util.formatDate(item.dateTime!.split('T')[0]),
                                value: Util.formatToIdr(item.totalTransaksi!),
                                semester: item.semester!))
                            .toList(),
                      );
                    } else if (state is HistoryTransaksiLoading) {
                      return const Column(
                        children: [
                          HistoryTransaksiPlaceholder(),
                          HistoryTransaksiPlaceholder(),
                          HistoryTransaksiPlaceholder(),
                          HistoryTransaksiPlaceholder(),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
