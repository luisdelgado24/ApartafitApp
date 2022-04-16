#import "WorkoutExerciseCell.h"

static const CGFloat kImageViewSize = 60;

@interface WorkoutExerciseCell ()

@property(nonatomic) NSString *text;
@property(nonatomic) UIImageView *imageView;

@end

@implementation WorkoutExerciseCell

- (void)updateSetWithText:(NSString *)text imageView:(UIImageView *)imageView {
    UIView *container = [[UIView alloc] init];
    container.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILabel *exerciseLabel = [[self class] labelWithText:text size:16];
    exerciseLabel.textColor = UIColor.whiteColor;

    [container addSubview:exerciseLabel];
    [container addSubview:imageView];
    
    [self addSubview:container];
    
    [NSLayoutConstraint activateConstraints:@[
        [exerciseLabel.leadingAnchor constraintEqualToAnchor:container.leadingAnchor constant:8],
        [exerciseLabel.widthAnchor constraintEqualToAnchor:container.widthAnchor],
        [exerciseLabel.centerYAnchor constraintEqualToAnchor:container.centerYAnchor],
        [imageView.trailingAnchor constraintEqualToAnchor:container.trailingAnchor constant:-30],
        [imageView.centerYAnchor constraintEqualToAnchor:container.centerYAnchor],
        [imageView.widthAnchor constraintEqualToConstant:kImageViewSize],
        [imageView.heightAnchor constraintEqualToConstant:kImageViewSize],
        [container.widthAnchor constraintEqualToAnchor:self.widthAnchor],
        [container.heightAnchor constraintEqualToAnchor:self.heightAnchor],
        [container.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [container.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
    ]];
}

#pragma mark - Private

+ (UILabel *)labelWithText:(NSString *)text size:(CGFloat)size {
    UILabel *label = [[UILabel alloc] init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = text;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    label.font = [UIFont fontWithName:@"Roboto-Black" size:size];
    return label;
}

@end
