//
//  GDYCircleView.m
//  CircleView
//
//  Created by danyu on 15/9/8.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "GDYCircleView.h"

@interface GDYCircleView()

@property (nonatomic, strong) UIColor *circleColor;

@end

@implementation GDYCircleView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (instancetype) initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
  
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
    
}

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    //the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2;
    center.y = bounds.origin.y + bounds.size.height/2;
    
    //the maximum radius fit the current rectangle
//    CGFloat radius = (MIN(bounds.size.height, bounds.size.width)/2);
    CGFloat maxRadius = hypot(bounds.size.width, bounds.size.height)/2;
    
    //draw the circle
    UIBezierPath *path = [[UIBezierPath alloc] init];
//    [path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
    
    for (CGFloat currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
    }
    
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [path stroke];
    
    UIImage *image = [UIImage imageNamed:@"longmao"];
    [image drawInRect:CGRectMake(bounds.origin.x, bounds.origin.y + image.size.height/2, image.size.width, image.size.height)];
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ was touched", self);
    
    //Get 3 numbers between 0 and 1
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    self.circleColor = randomColor;
}

- (void) setCircleColor:(UIColor *)circleColor {
    
    _circleColor = circleColor;
    //redraw the view
    [self setNeedsDisplay];
}

@end
