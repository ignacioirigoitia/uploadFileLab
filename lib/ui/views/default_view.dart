

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/default_provider.dart';
import 'progress_indicator.dart';

class DefaultView extends StatefulWidget {
  const DefaultView({ Key? key }) : super(key: key);

  @override
  State<DefaultView> createState() => _DefaultViewState();
}

class _DefaultViewState extends State<DefaultView> {

  String? urlAfterUpload;
  PlatformFile? file;

  @override
  Widget build(BuildContext context) {

    final defaultProvider = Provider.of<DefaultProvider>(context);

    return Row(
      children: [
        Expanded(
          child: ProgressIndicatorTest()
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 20))
                  ),
                  onPressed: () async {
                    final file = await pickFileDiferentt();

                    if(file != null){
                      this.file = file;
                      final url = await defaultProvider.generateUrl(
                        file.name.split('.').first, 
                        file.name.split('.').last,
                        'environment_test'
                      );

                      if(url != null){
                        urlAfterUpload = await defaultProvider.generateTempUrl(url.fileUrl);
                        if(urlAfterUpload != null){
                          setState(() {});
                        }
                      }
                    }
                  },
                  child: Text('Pick File', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                ),
                if( urlAfterUpload != null )
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text('Go to this URL to see file after upload:'),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: SelectableText(urlAfterUpload!),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 20))
                        ),
                        onPressed: (){
                          // FUNCTION TO UPLOAD FILE
                          
                        }, 
                        child: Text('Upload File', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                      )
                    ],
                  )
              ],
            ),
          )
        )
      ],
    );
  }
}


// Funcion para elegir video
Future<PlatformFile?> pickFileDiferentt() async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.any
  );
  final PlatformFile? file = result?.files.first;
  if (file == null) {
    return null;
  }
  return file;
}