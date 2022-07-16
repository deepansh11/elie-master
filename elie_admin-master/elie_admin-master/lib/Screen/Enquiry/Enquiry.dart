import 'package:elie_admin/Database/API.dart';
import 'package:elie_admin/Database/Enquiry.dart';
import 'package:elie_admin/Database/Locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:visibility_aware_state/visibility_aware_state.dart';

class EnquiryPage extends StatefulWidget {
  const EnquiryPage({Key? key}) : super(key: key);

  @override
  State<EnquiryPage> createState() => _EnquiryPageState();
}

class _EnquiryPageState extends State<EnquiryPage> {
  late ValueNotifier<List<Enquiry?>> enquiries = ValueNotifier([]);
  var loading = true;

  getEnquiry() async {
    List<Enquiry?>? enquiryList = await API().getEnquiry();

    if (enquiryList != null) {
      for (var element in enquiryList) {
        enquiries.value.add(element);
        print(element?.userName);
      }
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEnquiry();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
