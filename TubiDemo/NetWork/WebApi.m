//
//  WebApi.m
//  TubiDemo
//
//  Created by daiyu zhang on 8/11/18.
//  Copyright © 2018 daiyu zhang. All rights reserved.
//


#import "WebApi.h"
#import "General.h"

static NSString *path = @"v1/search";

@implementation WebApi

+ (void) getVideosWithcompletionWIthCatetory:(NSString *)category completion:(WebApiCompletion) completion {
    NSURL *URL = [NSURL URLWithString:[General baseUrl]];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:URL];
    NSDictionary *dic = @{@"key":[General endPointKey]};
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithDictionary:dic];
    param[@"q"] = category;
    [manager GET: path parameters:param progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSError *error = nil;
        if ([responseObject isKindOfClass:[NSDictionary class]]
            && responseObject[@"results"]) {
            NSArray *medias = responseObject[@"results"];
            NSMutableArray *result = [NSMutableArray array];
            if ([medias isKindOfClass:[NSArray class]]) {
                for (NSDictionary *dic in medias) {
                    
                    VideoModel *model = [[VideoModel alloc] initWithVideoUrl:dic[@"media"][0][@"mp4"][@"url"]
                                                                 preImageUrl:dic[@"media"][0][@"mp4"][@"preview"]
                                                                       title:dic[@"title"]
                                                                    duration:dic[@"media"][0][@"mp4"][@"duration"]
                                                                      height:[dic[@"media"][0][@"mp4"][@"dims"][1] doubleValue]
                                                                       width:[dic[@"media"][0][@"mp4"][@"dims"][0] doubleValue]];
                    [result addObject:model];
                }
                completion(result, SUCCEEDED, nil);
            } else {
                error = [NSError errorWithDomain:@"Error"
                                            code:01
                                        userInfo:@{@"error":@"Data is not correct"}];
            }
        }
        
        if (error) {
            completion(nil, FAILED, error);
        }
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        completion(nil, FAILED, error);
        NSLog(@"Error: %@", error);
    }];
}

@end
