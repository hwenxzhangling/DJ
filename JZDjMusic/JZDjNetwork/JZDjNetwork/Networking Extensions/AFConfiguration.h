//
//  AFConfiguration.h
//  AFLib
//
//  Created by hewenxue on 2017/7/3.
//  Copyright © 2017年 ccc. All rights reserved.
//

#ifndef AFConfiguration_h
#define AFConfiguration_h

//#Mark: 引用类
#import <AFNetworking/AFNetworking.h>            //网络请求类
#import "AFCXMXEncrypteTool.h"      //加密类
#import "AFNetworkMessageModel.h"   //请求的消息类
#import "NSError+Extension.h"       //扩展错误类

//#Mark: NSLog
#define   KNSLogParametersAndURL   0  //是否打印请求的参数和URL
//————————————————————测试环境————————————————————//

//#Mark: 加密值
#ifdef DEBUG

#define    KAPIs            @[@"http://api.adsasdfun.com/",\
                                @"http://api.asdgasdgasd.com/V2/",\
                                @"http://api.asdgasdgasdgasdgasdg.com"] //
#else

#define    KAPIs            @[@"http://api.adsasdfun.com/",\
                              @"http://api.asdgasdgasd.com/V2/",\
                              @"http:/api.asdgasdgasdgasdgasdg.com"] //

#endif

#define    K_s_SaltStr     @"weizhiasdasdfasdsign44444"    //s签名的内置Key @"weizhisign44444"
#define    K_s_SecretStr   @"asdvasd"    //s签名标识 anzhuo, 672tg
#define    K_Pid           @"4asdvadsvasd"    //签名分配平台人员
#define    K_d_SaltStr     @"@#-*￥djcc^&+#@*aasdvasdvasdasdvasdasdvas"    //data+T签名的内置Key


//******************公共请求接口参数*************************//
//#Mark: 接口版本
#define    K_Api_version    @""    //接口版本
#define    K_Api_versionKey @"version"    //接口版本Key

//#Mark: 终端类别
#define    K_Model_Type    @"2"         //终端类别 1安卓 2 iOS
#define    K_Model_Key     @"os"      //终端类别 Key


//#Mark: app版本
#define    K_App_version   ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])        //app版本号
#define    K_App_versionKey @"version"              //app版本号Key
//******************公共请求接口参数*************************//



// #Mark: 请求成功返回消息Key
#define KRequestSuccessRetKey   @"ret" //code
#define KRequestSuccessMsgKey   @"msg" //消息

// #Mark: 参数是否需要签名 或者 参数是否加密，或者什么都不做，后台自定
#define K_is_signature  1 //请求参数是否需要签名   0不需要签名 1需要签名 (必须是数值型参数)
#define K_is_encryption 1 //请求参数是否需要加密   0不需要加密 1需要加密 (必须是数值型参数)
#define K_is_decryption 1 //请求返回结果是否需要解密   0不需要解密 1需要解密 默认1需要解密 (必须是数值型参数)


#endif /* AFConfiguration_h */
