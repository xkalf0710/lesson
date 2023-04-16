class HttpHandler{
  int? statusCode;
  String? message;
  String? code;

  HttpHandler({this.statusCode, this.message, this.code});


  parseMessage(dynamic data){
    String? message;
  if(data.runtimeType == <String, dynamic>{}.runtimeType){
    Map<String, dynamic> json = data as Map<String, dynamic>;

    message = json['message'] as String?;
  }else{
    message = data as String;
  }

  return message;
  }

  handle(response){
    dynamic data = <String, dynamic>{};

    if (response?.data?.runtimeType.toString() != "".runtimeType.toString()) {
      data = response.data;
    }

    switch (statusCode){
      case 200:
      case 304:
        return data;

      default:
        {
          HttpHandler error = HttpHandler(
            statusCode: statusCode,
            code: data['code'] as String?,
            message: data['message'] != null
              ? data['message'] as String?
                : "систем завгүй байна"
          );
          return error;
        }
    }
  }
}