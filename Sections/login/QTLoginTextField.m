//
//  QTLoginTextField.m
//  QingTian
//
//  Created by Stephanie on 2019/6/16.
//  Copyright © 2019 Stephanie. All rights reserved.
//

#import "QTLoginTextField.h"

@implementation QTLoginTextField
- (CGRect)placeholderRectForBounds:(CGRect)bounds{
    return CGRectMake(40, bounds.origin.y, bounds.size.width, bounds.size.height);
}

- (CGRect)textRectForBounds:(CGRect)bounds{
    return CGRectMake(40, bounds.origin.y, bounds.size.width, bounds.size.height);
}

//- (CGRect)borderRectForBounds:(CGRect)bounds{
//     return CGRectMake(10, bounds.origin.y, bounds.size.width, bounds.size.height);
//}
- (CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectMake(40, bounds.origin.y, bounds.size.width, bounds.size.height);
}

- (void)awakeFromNib{
    [super awakeFromNib];
    //    CGFloat fontSize = self.font.pointSize;
    //    self.font = [UIFont systemFontOfSize:fontSize*SizeScale];
    //    [self setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    //    [self setValue:[UIFont systemFontOfSize:fontSize*SizeScale]forKeyPath:@"_placeholderLabel.font"]
}
@end
