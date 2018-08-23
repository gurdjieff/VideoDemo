//
//  DetailCollectionViewController.h
//  TubiDemo
//
//  Created by daiyu zhang on 8/23/18.
//  Copyright © 2018 daiyu zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"

@interface DetailCollectionViewController : UICollectionViewController
@property(strong, nonatomic) NSArray *videList;
@property(assign, nonatomic) NSInteger index;

@end
