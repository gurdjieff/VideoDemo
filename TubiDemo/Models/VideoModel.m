//
//  VideoModel.m
//  TubiDemo
//
//  Created by daiyu zhang on 8/11/18.
//  Copyright © 2018 daiyu zhang. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

- (id)initWithVideoUrl:(NSString *) videoUrl
           preImageUrl:(NSString *) preImageUrl
                 title:(NSString *) title
              duration:(NSNumber *) duration
                height:(double) height
                 width:(double) width {

    if (self = [super init]) {
        _videoUrl = videoUrl;
        _preImageUrl = preImageUrl;
        _title = title;
        _duration = duration;
        _height = height;
        _width = width;
    }
    
    return self;
}

@end
