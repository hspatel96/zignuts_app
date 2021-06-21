

// this class handle api urls and other api related basic stuff

class WsConst{


  static final String baseUrl = "https://e3-qkmountain.qkinnovations.com/element3-backend/api/" ;  // base url
  static final String loginUrl = baseUrl + "user/appLogin";
  static final String registerUrl = baseUrl + "user/appRegistration";


  // return the defaults headers to api
 static  getDefaultHeaders() {
    Map<String, String> headers = {"Content-type": "application/json"};
    return headers;
  }

}