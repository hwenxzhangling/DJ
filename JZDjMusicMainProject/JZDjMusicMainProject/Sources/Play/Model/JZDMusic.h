//
//  JZDMusic.h
//  JZDjMusicMainProject
//
//  Created by kiwi on 2019/10/24.
//  Copyright © 2019 WX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JZDMusic : NSObject
@property (nonatomic,copy) NSString    *clicks;//
@property (nonatomic,copy) NSString    *comments;
@property (nonatomic,copy) NSString    *created;
@property (nonatomic,copy) NSString    *dance_id;
@property (nonatomic,copy) NSString    *dance_name;
@property (nonatomic,copy) NSString    *dance_info;
@property (nonatomic,copy) NSString    *mp3_id;
@property (nonatomic,copy) NSString    *mp3_match;
@property (nonatomic,copy) NSString    *mp4_kbps;
@property (nonatomic,copy) NSString    *mp4_url;
@property (nonatomic,copy) NSString    *user_avatar;
@property (nonatomic,copy) NSString    *user_id;
@property (nonatomic,copy) NSString    *user_name;
@property (nonatomic,copy) NSString    *id;
//@property (atomic,assign) NSInteger    id;
@end

NS_ASSUME_NONNULL_END
