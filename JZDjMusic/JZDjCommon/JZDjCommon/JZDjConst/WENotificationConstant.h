//
//  WENotificationConstant.h
//  Weather
//
//  Created by yanglin on 2017/7/27.
//  Copyright © 2017年 瓦普时代. All rights reserved.
//

#define GKWYMUSIC_PLAYSTATECHANGENOTIFICATION   @"playStateChangeNotification" // 播放状态改变
#define GKWYMUSIC_PLAYMUSICCHANGENOTIFICATION   @"playMusicCHangeNotification" // 播放数据改变
#define GKWYMUSIC_USERDEFAULTSKEY_PLAYSTYLE     @"playStyle"        // 播放类型
#define GKWYMUSIC_USERDEFAULTSKEY_LASTPLAYID    @"lastPlayId"       // 上一次播放id
#define GKWYMUSIC_USERDEFAULTSKEY_PLAYINFO      @"playInfo"         // 播放信息
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kUserDefaults       [NSUserDefaults standardUserDefaults]


static NSString * const KTLDefaultConfigRefreshKEY = @"KTLDefaultConfigRefresh"; //审核配置
static NSString * const kAttractionSelectBtnNotification = @"kAttractionSelectBtnNotification"; //景区选择城市
static NSString * const kAttractionDetailNotification = @"kAttractionDetailNotification"; //景区详情
static NSString * const KAttractionNavigationNotification = @"KAttractionNavigationNotification";//导航

// 通知名
static NSString * const kClickHomeTabBarButtonNotification = @"kClickHomeTabBarButtonNotification"; // 点击tabItem
static NSString * const kWeatherControllerFetchDataFinishedNotification = @"kWeatherControllerFetchDataFinishedNotification"; // 请求天气数据完成
static NSString * const kClickWeatherCellTitleNotification = @"kClickHomeWeatherTitleNotification"; // 点击标题温度
static NSString * const kClickWeatherCellAirNotification = @"kClickWeatherCellAirNotification"; // 点击空气质量
static NSString * const kClickSatelliteCloudBtnNotification = @"kClickSatelliteCloudBtnNotification"; // 点击卫星云图
static NSString * const kClickAlertBtnNotification = @"kClickAlertBtnNotification"; // 点击预警

static NSString * const kClickTyphoonDetailBtnNotification = @"kClickTyphoonDetailBtnNotification"; // 点击台风查询
static NSString * const kClickSkiiingDetailBtnNotification = @"kClickSkiiingDetailBtnNotification"; // 点击滑雪查询

static NSString * const kClickNoteRemindNotification = @"kClickNoteRemindNotification"; // 通知提醒返回
static NSString * const kClickNoteCategoryNotification = @"kClickNoteCategoryNotification"; // 记事簿分类返回

static NSString * const kClickNoteEventrefershNotification = @"kClickNoteEventrefershNotification"; //操作事件刷新


static NSString * const kClickTyphoonDetailBtnNotificationToday = @"kClickTyphoonDetailBtnNotificationToday"; // 点击台风查询Today 页面
static NSString * const kClickWeatherCellLunarNotification = @"kClickWeatherCellLunarNotification"; // 点击万年历
static NSString * const kClickWeatherCellDollNotification = @"kClickWeatherCellDollNotification"; // 点击公仔
static NSString * const kClickWeatherCellAdNotification = @"kClickWeatherCellAdNotification"; // 点击漂浮广告
static NSString * const kClickWeatherCellIntegralNotification = @"kClickWeatherCellIntegralNotification"; // 点击home积分
static NSString * const kClickLunchAppPushNotification = @"kClickLunchAppPushNotification"; // 启动接收通知
static NSString * const kClickAdCloseNotification = @"kClickAdCloseNotification"; // 广告关闭
static NSString * const kClickWeatherCellBannerAdNotification = @"kClickWeatherCellBannerAdNotification"; // 点击通栏广告
static NSString * const kClickWeatherCalendarWidgetNotification = @"kClickWeatherCalendarWidgetNotification"; // 回到万年历

static NSString * const kClickDeleteWeatherCellBannerAdNotification = @"kClickDeleteWeatherCellBannerAdNotification"; // 点击删除通栏广告（首页）
static NSString * const kClickWeatherCellLifeSuggestionNotification = @"kClickWeatherCellLifeSuggestionNotification"; // 点击生活建议
static NSString * const kClickWeatherCellLifeIndexNotification = @"kClickWeatherCellLifeIndexNotification"; // 点击生活指数
static NSString * const kClickVideoShareSuccessNotification = @"kClickVideoShareSuccessNotification"; // 分享成功
static NSString * const kClickBackWeatherNotification = @"kClickBackWeatherNotification"; // 回到天气
static NSString * const kClicknextInformationWeatherNotification = @"kClicknextInformationWeatherNotification"; //

static NSString * const kClickSectionHeaderEditBtnNotification = @"kClickSectionHeaderEditBtnNotification"; // 首页分组编辑按钮
static NSString * const kClick30DWeatherCellNotification = @"kClick30DWeatherCellNotification"; // 点击30D
static NSString * const kClick15DWeatherCellNotification = @"kClick15DWeatherCellNotification"; // 点击13D
static NSString * const kClickAttractions15DWeatherCellNotification = @"kClickAttractions15DWeatherCellNotification"; // 点击13D

static NSString * const kClickLunarCellNotification = @"kClickLunarCellNotification"; // 点击农历
static NSString * const kSelectHomeNotification = @"kSelectHomeNotification"; // 选择城市
static NSString * const kUpdateUserInfoNotification = @"kUpdateUserInfoNotification"; // 更新信息成功
static NSString * const kLoginSuccessNotification = @"kLoginSuccessNotification"; // 登陆成功
static NSString * const kUpdateSeaportDataNotification = @"kUpdateSeaportDataNotification"; // XXX
static NSString * const kUpdateSeaportCityNotification = @"kUpdateSeaportCityNotification"; // XXX
static NSString * const kSwipeNotification = @"kSwipeNotification"; // 左右滑动切换城市
static NSString * const kClickWeatherSearchNtf = @"kClickWeatherSearchNtf"; // 点击首页搜索栏
static NSString * const kVoiceFinishingNotification = @"kVoiceFinishingNotification"; //语音完成
static NSString * const kNetworkChangedNotification = @"kNetworkChangedNotification"; // 网络状态改变
static NSString * const kSelectAttractionsHomeNotification = @"kSelectAttractionsHomeNotification"; // XXX
static NSString * const kSelectSkiingNotification = @"kSelectSkiingNotification"; // XXX
static NSString * const kHomeVCDestructionNotification = @"kHomeVCDestructionNotification"; // homeVC销毁
static NSString * const kMePushSwitchNotification = @"kMePushSwitchNotification"; //通知开关
static NSString * const kMePushNoticeNotification = @"kMePushNoticeNotification"; //通知内容
static NSString * const kBecomeActiveNotification = @"kBecomeActiveNotification"; //程序进入活跃状态
static NSString * const kPushResultNotification = @"kPushResultNotification"; // 处理推送结果
static NSString * const KInformationAdViewUpdateReaderNotification = @"KInformationAdViewUpdateReaderNotification"; //广告渲染
static NSString * const KWeathWeather30ChangedNotification = @"KWeathWeather30ChangedNotification"; //30D天日历切换
static NSString * const KWeathWeather30CalendarClickNotification = @"KWeathWeather30CalendarClickNotification"; //30D天日历点击
static NSString * const kweatherViewScrollViewDidscrollNotification = @"kweatherViewScrollViewDidscrollNotification"; //资讯page Content页面滚动
static NSString * const kweatherViewScrollViewDidEndDeceleratingNotification = @"kweatherViewScrollViewDidEndDeceleratingNotification"; //资讯page Content页面滚动减速
static NSString * const kweatherInfoViewleaveTopNotification = @"kweatherInfoViewleaveTopNotification"; //资讯离开

static NSString * const kAttractionleaveTopNotification = @"kAttractionleaveTopNotification"; //景区推荐离开
static NSString * const kAttractionDetailleaveTopNotification = @"kAttractionDetailleaveTopNotification"; //景区详情推荐离开

static NSString * const kweatherInfoCategoryManagerNotification = @"kweatherInfoCategoryManagerNotification";//资讯管理
static NSString * const kweatherInfoDetailNotification = @"kweatherInfoDetailNotification";//资讯详情
static NSString * const kweatherInfoCategoryUpdateNotification = @"kweatherInfoCategoryUpdateNotification";//资讯类别更新

static NSString * const KUserInfoItemActionNotification = @"KUserInfoItemActionNotification";//用户中心点击事件
static NSString * const KUserInfoActionNotification = @"KUserInfoActionNotification";//用户中心点击事件1

static NSString * const KClickZodiacNotification = @"KClickZodiacNotification";//点击星座

static NSString * const kZodiacScrollTopNotification = @"kZodiacScrollTopNotification"; //星座离开
static NSString * const kZodiacViewScrollViewDidscrollNotification = @"kZodiacViewScrollViewDidscrollNotification"; //星座Content页面滚动
static NSString * const kZodiacViewScrollViewDidEndDeceleratingNotification = @"kZodiacViewScrollViewDidEndDeceleratingNotification"; //星座Content页面滚动减速


static NSString * const kMeTaskClickTopNotification = @"kMeTaskClickTopNotification"; //
static NSString * const kZodiacDetailNotification = @"kZodiacDetailNotification"; //星座详情

static NSString * const KStartonlineTaskNotification = @"KStartonlineTaskNotification"; //开始在线任务
static NSString * const KOnlineTaskUpdateNotification = @"KOnlineTaskUpdateNotification"; //任务时长
static NSString * const KBrowsePageTaskNotification = @"KBrowsePageTaskNotification"; //浏览页面
static NSString * const kBackClickTaskNotification = @"kBackClickTaskNotification"; // 任务返回
