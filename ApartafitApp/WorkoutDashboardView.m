#import "WorkoutDashboardView.h"

#import "WorkoutRoutineCollectionViewController.h"

@interface WorkoutDashboardView () <UITabBarDelegate>

@property(nonatomic, readonly) UITabBar *memberTabBar;
@property(nonatomic, readonly) UICollectionViewController *routineCollectionViewController;

@end

@implementation WorkoutDashboardView

- (instancetype)init {
    self = [super init];
    
    if (self) {
        UILabel *helloLabel = [[self class] labelWithText:@"Hello Luis!" size:28];
        helloLabel.textColor = UIColor.whiteColor;
        [self addSubview:helloLabel];
        [helloLabel sizeToFit];
        
        [NSLayoutConstraint activateConstraints:@[
            [helloLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
            [helloLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:80],
        ]];
        
        UILabel *introLabel = [[self class] labelWithText:@"" size:16];
        NSString *text = @"Your trainer, Andrew, left you these sets of exercises for you to complete. If you have any questions reach out!";
        NSMutableParagraphStyle *introParagraph = [[NSMutableParagraphStyle alloc] init];
        introParagraph.alignment = NSTextAlignmentCenter;
        introParagraph.lineSpacing = 2.0f;
        introParagraph.lineHeightMultiple = 1.3;
        NSMutableAttributedString* attrText = [[NSMutableAttributedString alloc] initWithString:text];
        [attrText addAttribute:NSParagraphStyleAttributeName value:introParagraph range:NSMakeRange(0, text.length)];
        introLabel.attributedText = attrText;
        introLabel.textColor = UIColor.whiteColor;
        introLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:introLabel];
        [introLabel sizeToFit];
        
        [NSLayoutConstraint activateConstraints:@[
            [introLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
            [introLabel.topAnchor constraintEqualToAnchor:helloLabel.bottomAnchor constant:40],
            [introLabel.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:.85],
        ]];

        _routineCollectionViewController = [[WorkoutRoutineCollectionViewController alloc] init];
        _routineCollectionViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_routineCollectionViewController.view];
        
        [NSLayoutConstraint activateConstraints:@[
            [_routineCollectionViewController.view.topAnchor constraintEqualToAnchor:introLabel.bottomAnchor],
            [_routineCollectionViewController.view.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
            [_routineCollectionViewController.view.widthAnchor constraintEqualToAnchor:self.widthAnchor],
            [_routineCollectionViewController.view.heightAnchor constraintEqualToConstant:40],
        ]];
    }

    return self;
}

#pragma mark - UIView overrides

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIColor *backgroundColor = [UIColor colorWithRed:20/255.0 green:43/255.0 blue:63/255.0 alpha:1];
    self.backgroundColor = backgroundColor;
    
    
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
