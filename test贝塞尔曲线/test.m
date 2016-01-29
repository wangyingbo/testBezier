//
//  test.m
//  test贝塞尔曲线
//
//  Created by 王迎博 on 16/1/14.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "test.h"

@implementation test

/**
 *  原文链接：http://www.henishuo.com/uibezierpath-draw/
 */
- (void)drawRect:(CGRect)rect
{
    //画三角形
    //[self drawTrianglePath];
    //画矩形
    //[self drawRectPath];
    //画圆
    //[self drawCiclePath];
    //画椭圆
    //[self drawOvalPath];
    //画带圆角的正方形
    //[self drawRoundedRectPath];
    //画弧形
    //[self drawARCPath];
    //画二次贝塞尔曲线
    //[self drawSecondBezierPath];
    //画三次贝塞尔曲线
    [self drawThirdBezierPath];
}



/**画三角形
 *  如果我们需要设置填充颜色，比如这里设置为绿色，那么我们需要在设置画笔颜色之前先设置填充颜色，否则画笔颜色就被填充颜色替代了。也就是说，如果要让填充颜色与画笔颜色不一样，那么我们的顺序必须是先设置填充颜色再设置画笔颜色。如下，这两者顺序不能改变。因为我们设置填充颜色也是跟设置画笔颜色一样调用UIColor的-set方法。
 */
- (void)drawTrianglePath {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(20, 20)];
    [path addLineToPoint:CGPointMake(self.frame.size.width - 40, 20)];
    [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height - 20)];
    
    // 最后的闭合线是可以通过调用closePath方法来自动生成的，也可以调用-addLineToPoint:方法来添加
    //  [path addLineToPoint:CGPointMake(20, 20)];
    
    [path closePath];
    
    // 设置线宽
    path.lineWidth = 1.5;
    
    // 设置填充颜色,就近原则
    UIColor *fillColor1 = [UIColor lightGrayColor];
    [fillColor1 set];
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    //填充颜色
    [path fill];
    
    //设置画笔颜色
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    //画笔颜色
    [path stroke];
}




/**画矩形
 *  
 lineCapStyle属性是用来设置线条拐角帽的样式的，其中有三个选择：
typedef CF_ENUM(int32_t, CGLineCap) {
    kCGLineCapButt,
    kCGLineCapRound,
    kCGLineCapSquare
};
其中，第一个是默认的，第二个是轻微圆角，第三个正方形。
 
 
lineJoinStyle属性是用来设置两条线连结点的样式，其中也有三个选择：
typedef CF_ENUM(int32_t, CGLineJoin) {
    kCGLineJoinMiter,
    kCGLineJoinRound,
    kCGLineJoinBevel
};
其中，第一个是默认的表示斜接，第二个是圆滑衔接，第三个是斜角连接。
 */
- (void)drawRectPath {
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40)];
    
    path.lineWidth = 1.5;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinBevel;
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
}



/**
 *  画圆
 */
- (void)drawCiclePath {
    // 传的是正方形，因此就可以绘制出圆了
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.width - 40)];
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
}



/**
 *  画椭圆
 */
- (void)drawOvalPath {
    // 传的是不是正方形，因此就可以绘制出椭圆圆了
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, self.frame.size.width - 80, self.frame.size.height - 40)];
    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
}



/**
 *  第一个工厂方法是画矩形，但是这个矩形是可以画圆角的。第一个参数是矩形，第二个参数是圆角大小。 第二个工厂方法功能是一样的，但是可以指定某一个角画成圆角。像这种我们就可以很容易地给UIView扩展添加圆角的方法了。
 */
- (void)drawRoundedRectPath {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40) cornerRadius:10];
    
    //如果要画只有一个角是圆角，那么我们就修改创建方法：
    //UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40) byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(20, 20)];
    

    
    // 设置填充颜色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画笔颜色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    
    // 根据我们设置的各个点连线
    [path stroke];
}



/**
 *  画弧形
 */
#define   kDegreesToRadians(degrees)  ((pi * degrees)/ 180)
- (void)drawARCPath {
    
    //我们要明确一点，画弧参数startAngle和endAngle使用的是弧度，而不是角度，因此我们需要将常用的角度转换成弧度。对于效果图中，我们设置弧的中心为控件的中心，起点弧度为0，也就是正东方向，而终点是135度角的位置。如果设置的clockwise:YES是逆时针方向绘制，如果设置为NO，效果如下：弧形是反过来的
    const CGFloat pi = 3.14159265359;
    
    CGPoint center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center
                                                        radius:100
                                                    startAngle:0
                                                      endAngle:kDegreesToRadians(135)
                                                     clockwise:YES];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    
    [path stroke];
}



/**画二次贝塞尔曲线
 *
 画二次贝塞尔曲线的步骤：
 先设置一个起始点，也就是通过-moveToPoint:设置
 调用-addQuadCurveToPoint:controlPoint:方法设置终端点和控制点，以画二次曲线
 在效果图中，拱桥左边的起始点就是我们设置的起始点，最右边的终点，就是我们设置的终端点，而我们设置的控制点为（width / 2, 0）对应于红色矩形中水平方向在正中央，而垂直方向在最顶部。
 这个样式看起来很像sin或者cos函数吧？这两个只是特例而已，其实可以画任意图形，只是想不到，没有做不到的。
 */
- (void)drawSecondBezierPath {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 首先设置一个起始点
    [path moveToPoint:CGPointMake(20, self.frame.size.height - 100)];
    
    // 添加二次曲线
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width - 20, self.frame.size.height - 100)
                 controlPoint:CGPointMake(self.frame.size.width / 2, 0)];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    
    [path stroke];
}



/**画三次贝塞尔曲线
 *  <#Description#>
 */
- (void)drawThirdBezierPath {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 设置起始端点
    [path moveToPoint:CGPointMake(20, 150)];
    
    [path addCurveToPoint:CGPointMake(300, 150)
            controlPoint1:CGPointMake(160, 0)
            controlPoint2:CGPointMake(160, 250)];
    
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineWidth = 5.0;
    
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    
    [path stroke];
}
@end
