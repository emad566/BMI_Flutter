import 'package:bmi/shared/colors.dart';
import 'package:bmi/shared/fontsize.dart';
import 'package:flutter/material.dart';

class LabelValue extends StatelessWidget {
  const LabelValue({Key? key, required this.label, required this.value})
      : super(key: key);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Text(' : '),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CardItem extends StatelessWidget {
  final IconData icon;
  final String title;
  late Color color = MyColors.accent;

  CardItem({super.key, required this.icon, required this.title, Color? color}){
    this.color = color?? MyColors.accent;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 60,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: MyColors.secondary),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SliderCard extends StatefulWidget {
  String title;
  double val;
  double min;
  double max;
  Function? onChange;
  SliderCard({super.key, required this.title, required this.val, this.min=10, this.max=1000.0, this.onChange});

  @override
  State<SliderCard> createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MyColors.accent,
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: MyColors.secondary),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.val.toStringAsFixed(2),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: MyColors.primary),
              ),
              const SizedBox(width: 10.0),
              Text(
                'CM',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: FontSize.level2, color: MyColors.secondary),
              ),
            ],
          ),
          Slider(
            value: widget.val,
            max: 300,
            min: 10,
            onChanged: (double val) {
              if(widget.onChange != null){
                widget.onChange!(val);
              }
              setState(() {
                widget.val = val;
              });
            },
            thumbColor: MyColors.primary,
          ),
        ],
      ),
    );
  }
}


// ignore: must_be_immutable
class IncDec extends StatefulWidget {
  late double val;
  late String title;
  Function? onTab;
  IncDec({super.key, required this.title, required this.val, this.onTab});

  @override
  State<IncDec> createState() => _IncDecState();
}

class _IncDecState extends State<IncDec> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: MyColors.accent,
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: MyColors.secondary),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.val.toStringAsFixed(2),
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: MyColors.primary),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(widget.val<300)
              CircleAvatar(
                radius: 22,
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      widget.val +=1;
                      if(widget.onTab != null){
                        widget.onTab!(widget.val);
                      }
                    });
                  },
                  icon: const Icon(Icons.add, size: 20,),
                ),
              ),
              if(widget.val>1)
              CircleAvatar(
                radius: 22,
                child: IconButton(
                  onPressed: (){
                    setState(() {
                      widget.val -= 1;
                      if(widget.onTab != null){
                        widget.onTab!(widget.val);
                      }
                    });
                  },
                  icon: const Icon(Icons.remove, size: 20,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void navigateTo(BuildContext context, Widget screen){
  Navigator.of(context).push(
    MaterialPageRoute(builder: (_) {
      return screen;
    }),
  );
}

void navigateReplaceTo(BuildContext context, Widget screen){
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) {
      return screen;
    }),
  );
}
