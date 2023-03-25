import 'package:destiny_challage_flutter/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home:  StoryPage(),
    );
  }
}


var brain=StoryBrain();
class StoryPage extends StatefulWidget {
   StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image:AssetImage("images/background.png"),
          fit: BoxFit.cover
          )
        ),
        //TODO: Step 1 - Add background.png to this Container as a background image.
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                Expanded(
                flex: 12,
                child: Center(
                  child:Text(
                    brain.getStory(),
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.red,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                     // color: Colors.red,
                      onTap: () {
                        setState(() {
                          brain.nextStory(1);
                        });

                      },

                      child:  Center(
                        child:  Text(
                          brain.getChoice1(),
                          style: const TextStyle(
                            fontSize: 20.0,

                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                //TODO: Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: Visibility(
                  visible: brain.buttonShouldBeVisible(),
                  child: Container(
                    color: Colors.blue,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            brain.nextStory(2);
                          });

                        },
                       // color: Colors.blue,
                        child:Center(
                          child: Text(
                            brain.getChoice2(),
                            style:const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
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

//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
