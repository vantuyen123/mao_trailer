import 'package:mao_trailer/common/screenutil/screen_util.dart';

extension SizeExtention on num {
  ///[ScreenUtil.setWidth]
  double get w => ScreenUtil().setWidth(this);

  ///[ScreenUtil.setHeight]
  double get h => ScreenUtil().setHeight(this);

  ///[ScreenUtil.radius]
  double get r => ScreenUtil().radius(this);

  ///[ScreenUtil.setSp]
  double get sp => ScreenUtil().setSp(this);

  ///[ScreenUtil.setSp]
  @Deprecated('please use [sp]')
  double get ssp => ScreenUtil().setSp(this);

}
