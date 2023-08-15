import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/theme.dart';

class MultiLinePlaceHolder extends StatelessWidget {
  final int lineCount;
  final double lineWidth;
  final double lastLineWidth;
  final double lineHeight;

  const MultiLinePlaceHolder(
      {Key? key,
      required this.lineCount,
      this.lastLineWidth = 100,
      this.lineWidth = double.infinity,
      this.lineHeight = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> generateLine() {
      List<Widget> line = List<Widget>.filled(
          lineCount - 1,
          Shimmer.fromColors(
            baseColor: kShimmerBaseColor,
            highlightColor: kShimmerHighligtColor,
            child: Container(
              width: lineWidth,
              height: lineHeight,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 8),
            ),
          )).toList();

      line.add(Shimmer.fromColors(
        baseColor: kShimmerBaseColor,
        highlightColor: kShimmerHighligtColor,
        child: Container(
          width: lastLineWidth,
          height: lineHeight,
          color: Colors.white,
        ),
      ));

      return line;
    }

    return Expanded(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: generateLine()),
    );
  }
}

class SingleLinePlaceholder extends StatelessWidget {
  final double lineWidth;
  final double lineHeight;

  const SingleLinePlaceholder(
      {Key? key, this.lineWidth = double.infinity, this.lineHeight = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: kShimmerBaseColor,
        highlightColor: kShimmerHighligtColor,
        child: Container(
          width: lineWidth,
          height: lineHeight,
          color: Colors.white,
        ));
  }
}

class HistoryTransaksiPlaceholder extends StatelessWidget {
  const HistoryTransaksiPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: kBlackColor.withOpacity(0.3),
                  blurRadius: 5,
                  offset: const Offset(0, 5))
            ]),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleLinePlaceholder(lineWidth: 100),
            SizedBox(height: 12),
            SingleLinePlaceholder(lineWidth: 150, lineHeight: 20),
            SizedBox(height: 12),
            SingleLinePlaceholder(lineWidth: 200),
          ],
        ));
  }
}

class ProgressBayarCardPlaceholder extends StatelessWidget {

  const ProgressBayarCardPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
                color: kBlackColor.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(0, 5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SingleLinePlaceholder(lineWidth: 100),
          const SizedBox(height: 8),
          Row(
            children: [
              Shimmer.fromColors(
                  baseColor: kShimmerBaseColor,
                  highlightColor: kShimmerHighligtColor,
                  child: Container(
                    width: 105,
                    height: 105,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                  )),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleLinePlaceholder(lineWidth: 100),
                    SizedBox(height: 4),
                    SingleLinePlaceholder(lineHeight: 20),
                    SizedBox(height: 30),
                    SingleLinePlaceholder(lineWidth: 100),
                    SizedBox(height: 4),
                    SingleLinePlaceholder(lineHeight: 20),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PetugasDetailPerSemesterPlaceholder extends StatelessWidget {

  const PetugasDetailPerSemesterPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kWhiteColor,
          boxShadow: [
            BoxShadow(
                color: kBlackColor.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(0, 5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SingleLinePlaceholder(lineWidth: 100),
          const SizedBox(height: 8),
          Row(
            children: [
              Shimmer.fromColors(
                  baseColor: kShimmerBaseColor,
                  highlightColor: kShimmerHighligtColor,
                  child: Container(
                    width: 105,
                    height: 105,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                  )),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SingleLinePlaceholder(lineHeight: 20),
                    const SizedBox(height: 20),
                    Shimmer.fromColors(
                        baseColor: kShimmerBaseColor,
                        highlightColor: kShimmerHighligtColor,
                        child: Container(
                          width: double.infinity,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

