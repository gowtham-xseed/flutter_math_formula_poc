import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:t20_lesson_plan_app_widgets/helpers/data_to_widget.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          child: Wrap(
            runSpacing: 5.0,
            spacing: 5.0,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              getRichText('##Question:## @@Solve@@ for *x* in the **following equations**.', context, null,
                  keywords: [
                    {
                      'text': "Solve",
                      'keyword': "Solve",
                      'description': "Solve Description"
                    }
                  ],
                  keywordReadAnalyticsHandler: () {}),
              TeXView(
                showLoadingWidget: true,
                children: [
                  TeXViewColumn(children: [
                    TeXViewInkWell(
                        id: "id_0",
                        child: TeXViewContainer(
                          child: TeXViewDocument(
                            r"""\(\frac{a}{b}=a^{2}+b^{2}\)""",
                          ),
                        )),
                  ])
                ],
                onTap: (String string) {
                  print('onTab -----------> Keyword ' + string);
                },
              ),
              getRichText('##Solution:##', context, null,
                  keywords: [
                    {
                      'text': "Solution",
                      'keyword': "Solution",
                      'description': "Solution Description"
                    }
                  ],
                  keywordReadAnalyticsHandler: () {}),
              TeXView(
                showLoadingWidget: true,
                children: [
                  TeXViewColumn(children: [
                    TeXViewInkWell(
                      id: "id_1",
                      child: TeXViewDocument(
                        r"""$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$""",
                      ),
                    ),
                  ])
                ],
              ),
              Text('suffix'),
            ],
          ),
        ),
      ),
    );
  }
}
