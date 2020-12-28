import 'dart:convert';
import 'dart:io';

final String scheme = "https";
final String host = "cnodejs.org";
final String prefixPath = "/api/v1";

HttpClient httpClient = new HttpClient();

class RequestCollection {
  RequestCollection();
  getTopics({
    page = 1,
    tab = "",
    limit = "10",
  }) async {
    Uri uri = Uri(
        scheme: scheme,
        host: host,
        path: prefixPath + "/topics",
        queryParameters: {"page": page.toString(), "tab": tab, "limit": limit});
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();
    var text = await response.transform(utf8.decoder).join();
    return text;
  }

  getArticleById({id}) async {
    Uri uri =
        Uri(scheme: scheme, host: host, path: prefixPath + "/topic/" + id);
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();
    var text = await response.transform(utf8.decoder).join();
    return text;
  }
}
