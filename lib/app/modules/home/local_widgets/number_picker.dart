import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberPicker extends StatelessWidget with WidgetsBindingObserver {
  late final Function(int)? onValueChanged;
  int number;
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  NumberPicker({@required this.onValueChanged, this.number = 0});

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance!.window.viewInsets.bottom;
    if (bottomInset <= 0.0) {
      if (textEditingController.text == "") textEditingController.text = "0";
      focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addObserver(this);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {
              if (number > 0) {
                number--;
                textEditingController.text = number.toString();

                onValueChanged!.call(number);
              }
            },
            icon: Icon(
              Icons.remove,
            )),
        Container(
          width: 70,
          child: TextField(
            textAlign: TextAlign.center,
            focusNode: focusNode,
            autofocus: false,
            controller: textEditingController..text = number.toString(),
            textInputAction: TextInputAction.done,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(13)
            ],
            keyboardType: TextInputType.phone,
            onSubmitted: (val) {
              if (textEditingController.text == "") textEditingController.text = "0";

              focusNode.unfocus();
            },
            onChanged: (val) {
              if (textEditingController.text != "")
                number = int.parse(textEditingController.text);
              else
                number = 0;

              onValueChanged!.call(number);
            },
          ),
        ),
        IconButton(
            onPressed: () {
              if (number < double.maxFinite.floor()) {
                number++;
                textEditingController.text = number.toString();
                onValueChanged!.call(number);
              }
            },
            icon: Icon(Icons.add)),
      ],
    );
  }
}
