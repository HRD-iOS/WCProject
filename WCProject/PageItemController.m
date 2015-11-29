//
//  PageItemController.m
//  WCProject
//
//  Created by Yin Kokpheng on 11/27/15.
//  Copyright © 2015 Yin Kokpheng. All rights reserved.
//

#import "PageItemController.h"

@interface PageItemController ()

@end

@implementation PageItemController

#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    _contentImageView.image = [UIImage imageNamed: _imageName];
    _titleLabel.text = _titleName;
    _descriptionLabel.text = _descriptionName;
}

#pragma mark -
#pragma mark Content

- (void) setImageName: (NSString *) name
{
    _imageName = name;
    _contentImageView.image = [UIImage imageNamed: _imageName];

}

- (void) setRollingImageName: (int) page
{
    switch (page) {
        case 0:
            _rollingImageView1.image = [UIImage imageNamed:@"rolling_select.png"];
            _rollingImageView2.image = [UIImage imageNamed:@"rolling_default.png"];
            _rollingImageView3.image = [UIImage imageNamed:@"rolling_default.png"];
            break;
        case 1:
            _rollingImageView1.image = [UIImage imageNamed:@"rolling_default.png"];
            _rollingImageView2.image = [UIImage imageNamed:@"rolling_select.png"];
            _rollingImageView3.image = [UIImage imageNamed:@"rolling_default.png"];
            break;
        case 2:            
            _rollingImageView1.image = [UIImage imageNamed:@"rolling_default.png"];
            _rollingImageView2.image = [UIImage imageNamed:@"rolling_default.png"];
            _rollingImageView3.image = [UIImage imageNamed:@"rolling_select.png"];
            break;
        default:
            break;
    }
    
}

- (void) setTitleLabel
{
    _titleLabel.text = _titleName;
    
}

-(void) setDescriptionLabel{
    _descriptionLabel.text = _descriptionName;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
