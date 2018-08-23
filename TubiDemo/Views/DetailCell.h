//
//  DetailCell.h
//  TubiDemo
//
//  Created by daiyu zhang on 8/23/18.
//  Copyright © 2018 daiyu zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"

@interface DetailCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoriateButton;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;


- (void)configureCellWithModel:(VideoModel *)model;
@end
