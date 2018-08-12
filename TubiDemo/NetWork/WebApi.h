//
//  WebApi.h
//  TubiDemo
//
//  Created by daiyu zhang on 8/11/18.
//  Copyright © 2018 daiyu zhang. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>
#import <Foundation/Foundation.h>
#import "VideoModel.h"

typedef NS_ENUM(NSInteger, WebApiState){
    FAILED = 0,
    SUCCEEDED,
};

typedef void(^WebApiCompletion)(NSArray<VideoModel *> * array, WebApiState state, NSError *error);

@interface WebApi : NSObject

+ (void) getVideosWithcompletion:(WebApiCompletion) completion;

@end
