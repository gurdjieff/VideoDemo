//
//  VideoModel.h
//  TubiDemo
//
//  Created by daiyu zhang on 8/11/18.
//  Copyright © 2018 daiyu zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject

@property (nonatomic, strong, readonly) NSString *videoUrl;
@property (nonatomic, strong, readonly) NSString *preImageUrl;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSNumber *duration;
@property (nonatomic, assign, readonly) double height;
@property (nonatomic, assign, readonly) double width;


- (id)initWithVideoUrl:(NSString *) videoUrl
           preImageUrl:(NSString *) preImageUrl
                 title:(NSString *) title
              duration:(NSNumber *) duration
                height:(double) height
                 width:(double) width;

@end
