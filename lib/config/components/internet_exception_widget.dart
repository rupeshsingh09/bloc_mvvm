import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;

  const InternetExceptionWidget({Key? key, required this.onPress}) : super(key:  key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * .15),
        const Icon(Icons.cloud_off, color: Colors.red, size: 50),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            'we are unable to show results.\n PLease check your internet\n connecton',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(fontSize: 20),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .10),

        // internet vala msg show hone k badd ek button  rhge jispe click krne pe internet check ho jayega
        ElevatedButton(
          onPressed: onPress,
          child: Text('RETRY', style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );
  }
}
