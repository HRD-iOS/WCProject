//
//  PageItemController.h
//  WCProject
//
//  Created by Yin Kokpheng on 11/27/15.
//  Copyright © 2015 Yin Kokpheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageItemController : UIViewController

// Item controller information
@property (nonatomic) NSUInteger itemIndex; // ***
@property (nonatomic, strong) NSString *imageName; // ***
@property (nonatomic, strong) NSString *titleName; // ***
@property (nonatomic, strong) NSString *descriptionName; // ***
@property int rollingImageName; // ***



// IBOutlets
@property (nonatomic, weak) IBOutlet UIImageView *contentImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rollingImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *rollingImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *rollingImageView3;

@end
