import 'package:share_plus/share_plus.dart';

/**
 * 分享
 * @author yinlei
 */
Future appShareText({
  String text = "http://yinleilei.com/",
}) async {
  return await Share.share("向您分享了一个内容，请查看: $text");
}

Future appShareEmail({
  required String email,
  String subject = "邮件主题",
}) async {
  return await Share.share(email, subject: subject);
}

// Share.shareFiles(['${directory.path}/image.jpg'], text: 'Great picture');
// Share.shareFiles(['${directory.path}/image1.jpg', '${directory.path}/image2.jpg']);
Future appShareFile({
  required List<String> filePaths,
  String title = "分享文件",
}) async {
  return await Share.shareFiles(
    filePaths,
    text: title,
  );
}
