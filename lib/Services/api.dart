import 'package:coronavirus_tracking_app/Services/api_key.dart';
import 'package:flutter/foundation.dart';

enum Endpoints {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered,
}

class API {

  API({@required this.apiKeys});
  final String apiKeys;

  factory API.sandbox() => API(apiKeys: APIKeys.ncovSandboxKey);

  static final String host = "ncov2019-admin.firebaseapp.com";

  Uri tokenUri() => Uri(
    scheme: 'https', 
    host: host, 
    path: 'token'
    );

  Uri endPointUri(Endpoints endpoints) => Uri(
    scheme: 'https',
    host: host, 
    path: _paths[endpoints],
  );

  static Map<Endpoints,String> _paths =  {
    Endpoints.cases : "cases",
    Endpoints.casesSuspected : "casesSuspected",
    Endpoints.casesConfirmed: "casesConfirmed",
    Endpoints.deaths:"deaths",
    Endpoints.recovered :"recovered",
  };

}
