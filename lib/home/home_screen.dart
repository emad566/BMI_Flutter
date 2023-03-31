import 'package:bmi/result/result_screen.dart';
import 'package:bmi/shared/cache_helper.dart';
import 'package:bmi/shared/caches.dart';
import 'package:bmi/shared/colors.dart';
import 'package:bmi/shared/components.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  Function? onState;
  HomeScreen({super.key, this.onState});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFemale = false;
  late double age = 20;
  late double weight = 30;
  late double height = 50;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = CacheHelper.getData(Caches.isDarkMode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async{
              await CacheHelper.setData(Caches.isDarkMode, !isDarkMode);
              if(widget.onState != null) {
                widget.onState!();
              }
              // ignore: use_build_context_synchronously
              // navigateReplaceTo(context, HomeScreen());
            },
            icon: Icon(isDarkMode? Icons.dark_mode : Icons.light_mode),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFemale = false;
                            });
                          },
                          child: CardItem(
                            color: isFemale ? null : MyColors.accentDark,
                            title: 'Male',
                            icon: Icons.male,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFemale = true;
                            });
                          },
                          child: CardItem(
                            color: !isFemale ? null : MyColors.accentDark,
                            title: 'Female',
                            icon: Icons.female,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SliderCard(
                    title: 'Height',
                    val: height,
                    onChange: (val) {
                      height = val;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IncDec(
                          onTab: (val) {
                            age = val;
                          },
                          title: 'Age',
                          val: 10,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        flex: 1,
                        child: IncDec(
                          onTab: (val) {
                            weight = val;
                          },
                          title: 'Weight',
                          val: weight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        var result = weight / (height * height / 10000);
                        navigateTo(
                            context,
                            ResultScreen(
                                result: result, age: age, isFemale: isFemale));
                      },
                      child: Text(
                        'Calculate',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
