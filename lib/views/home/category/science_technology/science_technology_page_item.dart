import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Util.dart';
import 'package:flutter_app/views/home/category/hotspot/hotspot_page_item_data.dart';
import 'package:flutter_app/views/web_page/web_view_page.dart';
import 'package:quiver/strings.dart';

/// 作者 mcy
/// 时间 2019/8/8 16:45
/// 新推荐列表的item
class ScienceTechnologyPageItem extends StatelessWidget {
  HotspotPageItemData data;

  ScienceTechnologyPageItem(this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(data.title);
        //构建路由，可以传自定义参数
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return new WebViewPage(
              'https://www.toutiao.com/a${data.item_id}', data.title);
        }));
      },
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: SizedBox(
            height: 88.0,
            child: Row(
              children: <Widget>[
                Image.network(
                  isNotEmpty(data.image_url)
                      ? 'https:${data.image_url}'
                      : "",
                  width: 108.0,
                  height: 88.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          data.title,
                          style: TextStyle(color: Colors.black, fontSize: 14.0),
                          maxLines: 2,
                        ),
                        Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    'https:${data.media_avatar_url}',
                                    width: 16.0,
                                    height: 16.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                                Text(
                                  '${data.source}·${data.comments_count}评论·${Util.getTimeDuration2(data.behot_time * 1000)}',
                                  style: TextStyle(fontSize: 10.0),
                                )
                              ],
                            )),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
