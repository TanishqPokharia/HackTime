import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:hack_time/extensions.dart';
import 'package:hack_time/helpers/helpers.dart';
import 'package:provider/provider.dart';
import '../result.dart';
import './user_input_questions.dart';
import '../../helpers/colors.dart';

class UserInputs extends StatefulWidget {
  static const routeName = '/user-inputs';

  const UserInputs({super.key});
  @override
  UserInputsState createState() => UserInputsState();
}

class UserInputsState extends State<UserInputs> {
  List answers = [];

  var index = 0;

  final _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as String;
    final size = MediaQuery.of(context).size;

    List foodQ = Provider.of<Questions>(context).foodQuestions;
    List travelQ = Provider.of<Questions>(context).travelQuestions;
    List waterQ = Provider.of<Questions>(context).waterQuestions;

    List questions = [];

    // print(args);

    if (args == 'food') {
      questions = foodQ;
    } else if (args == 'travel') {
      questions = travelQ;
    } else {
      questions = waterQ;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: args == 'food'
              ? Stack(
                  children: [
                    Container(
                      color: ColorsPalette.background,
                    ),
                    Positioned(
                      child: FlareActor(
                        'assets/flare/base_two_flow.flr',
                        animation: 'flow',
                        fit: BoxFit.cover,
                        color: ColorsPalette.background,
                      ),
                    ),
                    if (index == 0 || index == 1)
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: FlareActor(
                          'assets/flare/food_1.flr',
                          animation: 'flow',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    if (index == 2 || index == 3)
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Image.asset(
                          'assets/images/eat_1.png',
                        ),
                      ),
                    Positioned(
                      top: 150,
                      child: SizedBox(
                        height: size.height,
                        width: size.width,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0,
                                ),
                                child: Text(
                                  questions[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: ColorsPalette.color3,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50.rs,
                            ),
                            Align(
                              child: SizedBox(
                                width: size.width * 0.4,
                                child: TextFormField(
                                  controller: _answerController,
                                  decoration: InputDecoration(
                                    hintText: '(In Grams)',
                                    hintStyle:
                                        const TextStyle(color: ColorsPalette.color4),
                                    suffixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.trending_flat,
                                        color: ColorsPalette.color3,
                                      ),
                                      onPressed: () {
                                        if (_answerController.text == '' ||
                                            _answerController is String) {
                                          return;
                                        }
                                        answers.add(double.parse(
                                            _answerController.text));
                                        if (index == questions.length - 1) {
                                          // print(answers);

                                          double footprint = CarbonFootPrint
                                              .getDailyFoodCarbonFootPrint(
                                                  answers[0],
                                                  answers[1],
                                                  answers[2],
                                                  answers[3]);

                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ResultScreen(
                                                        userEmission: footprint,
                                                        averageEmission:
                                                            CarbonFootPrint
                                                                .avgEmissionDueToFoodPerDay,
                                                        activityName: "Food",
                                                      )));
                                        } else {
                                          index++;
                                        }
                                        _answerController.text = '';
                                        setState(() {});
                                      },
                                    ),
                                    alignLabelWithHint: true,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.rs,
                                      vertical: 2.rs,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    color: ColorsPalette.color3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : args == 'travel'
                  ? Stack(
                      children: [
                        Container(
                          color: ColorsPalette.background,
                        ),
                        const Positioned(
                          child: FlareActor(
                            'assets/flare/base_one.flr',
                            animation: 'Flow',
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (index == 0 || index == 2)
                          const FlareActor(
                            'assets/flare/bicycle_flow.flr',
                            animation: 'flow',
                            alignment: Alignment.bottomCenter,
                          ),
                        if (index == 1)
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              height: size.height * 0.3,
                              child: Image.asset(
                                'assets/images/car.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        Positioned(
                          child: SizedBox(
                            height: size.height,
                            width: size.width,
                            //decoration: BoxDecoration(color: ColorPallete.background),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40.0),
                                    child: Text(
                                      questions[index],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: ColorsPalette.color3,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.rs,
                                ),
                                Align(
                                  child: SizedBox(
                                    width: size.width * 0.4,
                                    child: TextFormField(
                                      controller: _answerController,
                                      decoration: InputDecoration(
                                        hintText: '(In miles)',
                                        hintStyle: const TextStyle(
                                            color: ColorsPalette.color4),
                                        //enabledBorder: InputBorder.none,
                                        //filled: true,
                                        //fillColor: ColorPallete.background.withBlue(-200),
                                        suffixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.trending_flat,
                                            color: ColorsPalette.color3,
                                          ),
                                          onPressed: () {
                                            if (_answerController.text == '' ||
                                                _answerController is String) {
                                              return;
                                            }
                                            answers.add(double.parse(
                                                _answerController.text));

                                            if (index == questions.length - 1) {
                                              // print(answers);

                                              double footprint = CarbonFootPrint
                                                  .getDailyTravelFootPrint(
                                                      answers[0],
                                                      answers[1],
                                                      answers[2]);

                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ResultScreen(
                                                            userEmission:
                                                                footprint,
                                                            averageEmission:
                                                                CarbonFootPrint
                                                                    .avgEmissionDueToTravelPerDay,
                                                            activityName:
                                                                "Travel",
                                                          )));
                                            } else {
                                              index++;
                                            }
                                            _answerController.text = '';
                                            setState(() {});
                                          },
                                        ),
                                        alignLabelWithHint: true,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.rs,
                                          vertical: 2.rs,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        color: ColorsPalette.color3,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        Container(
                          color: ColorsPalette.background,
                        ),
                        const Positioned(
                          child: FlareActor(
                            'assets/flare/base_water.flr',
                            animation: 'island01',
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (index == 0 || index == 1 || index == 2)
                          const FlareActor(
                            'assets/flare/watch_tv.flr',
                            animation: 'flow',
                            alignment: Alignment.bottomCenter,
                          ),
                        if (index == 3)
                          const FlareActor(
                            'assets/flare/water_flow.flr',
                            animation: 'flow',
                            alignment: Alignment.bottomRight,
                            fit: BoxFit.fitWidth,
                          ),
                        Positioned(
                          child: SizedBox(
                            height: size.height,
                            width: size.width,
                            //decoration: BoxDecoration(color: ColorPallete.background),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40.0),
                                    child: Text(
                                      questions[index],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: ColorsPalette.color3,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50.rs,
                                ),
                                Align(
                                  child: SizedBox(
                                    width: size.width * 0.4,
                                    child: TextFormField(
                                      controller: _answerController,
                                      decoration: InputDecoration(
                                        hintText: index == 3 ? '' : '(In Hrs)',
                                        hintStyle: const TextStyle(
                                            color: ColorsPalette.color4),
                                        //enabledBorder: InputBorder.none,
                                        //filled: true,
                                        //fillColor: ColorPallete.background.withBlue(-200),
                                        suffixIcon: IconButton(
                                          icon: const Icon(
                                            Icons.trending_flat,
                                            color: ColorsPalette.color3,
                                          ),
                                          onPressed: () {
                                            if (_answerController.text == '' ||
                                                _answerController is String) {
                                              return;
                                            }
                                            answers.add(double.parse(
                                                _answerController.text));

                                            if (index == questions.length - 1) {
                                              // print(answers);

                                              double footprint = CarbonFootPrint
                                                  .getDailyHouseHoldCarbonFootPrint(
                                                      answers[0],
                                                      answers[1],
                                                      answers[2],
                                                      answers[3]);

                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ResultScreen(
                                                    userEmission: footprint,
                                                    averageEmission: CarbonFootPrint
                                                        .avgEmissionDueToHouseHoldPerDay,
                                                    activityName: "HouseHold",
                                                  ),
                                                ),
                                              );
                                            } else {
                                              index++;
                                            }
                                            _answerController.text = '';
                                            setState(() {});
                                          },
                                        ),
                                        alignLabelWithHint: true,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.rs,
                                          vertical: 2.rs,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        color: ColorsPalette.color3,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
