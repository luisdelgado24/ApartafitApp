#import "WorkoutDashboardViewController.h"

#import "ContactUsViewController.h"
#import "WorkoutRoutineCollectionViewController.h"

@import GoogleSignIn;
@import FirebaseCore;
@import FirebaseAuth;

@interface WorkoutDashboardViewController () <UITabBarDelegate>

@property(nonatomic, readonly) UITabBar *memberTabBar;
@property(nonatomic, readonly) UICollectionViewController *routineCollectionViewController;
@property(nonatomic, readonly) ContactUsViewController *contactUsViewController;

@end

@implementation WorkoutDashboardViewController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        UILabel *helloLabel = [[self class] labelWithText:@"Hello Luis!" size:28];
        helloLabel.textColor = UIColor.whiteColor;
        [self.view addSubview:helloLabel];
        [helloLabel sizeToFit];
        
        UILabel *signOutLabel = [[self class] labelWithText:@"(Sign out)" size:14];
        signOutLabel.textColor = UIColor.whiteColor;
        signOutLabel.userInteractionEnabled = YES;
        [self.view addSubview:signOutLabel];
        [signOutLabel sizeToFit];
        
        UITapGestureRecognizer *signOutTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapSignOut)];
        [signOutLabel addGestureRecognizer:signOutTapRecognizer];
        
        [NSLayoutConstraint activateConstraints:@[
            [helloLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
            [helloLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:80],
            [signOutLabel.centerYAnchor constraintEqualToAnchor:helloLabel.centerYAnchor],
            [signOutLabel.leadingAnchor constraintEqualToAnchor:helloLabel.trailingAnchor constant:8],
        ]];
        
        UILabel *introLabel = [[self class] labelWithText:@"" size:16];
        NSString *text = @"Your trainer, Andrew, left you these sets of exercises for you to complete.";
        NSMutableParagraphStyle *introParagraph = [[NSMutableParagraphStyle alloc] init];
        introParagraph.alignment = NSTextAlignmentCenter;
        introParagraph.lineSpacing = 2.0f;
        introParagraph.lineHeightMultiple = 1.3;
        NSMutableAttributedString* attrText = [[NSMutableAttributedString alloc] initWithString:text];
        [attrText addAttribute:NSParagraphStyleAttributeName value:introParagraph range:NSMakeRange(0, text.length)];
        introLabel.attributedText = attrText;
        introLabel.textColor = UIColor.whiteColor;
        introLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:introLabel];
        [introLabel sizeToFit];
        
        [NSLayoutConstraint activateConstraints:@[
            [introLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
            [introLabel.topAnchor constraintEqualToAnchor:helloLabel.bottomAnchor constant:40],
            [introLabel.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.85],
        ]];

        _routineCollectionViewController = [[WorkoutRoutineCollectionViewController alloc] initWithConfig:[[self class] workoutRoutineConfig]];
        _routineCollectionViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_routineCollectionViewController.view];
        
        UIView *contactUsContainer = [[UIView alloc] init];
        contactUsContainer.translatesAutoresizingMaskIntoConstraints = NO;
        
        UILabel *ifLabel = [[self class] labelWithText:@"If you have any questions, " size:18];
        ifLabel.textColor = UIColor.whiteColor;
        [contactUsContainer addSubview:ifLabel];
        [ifLabel sizeToFit];
        
        UILabel *reachOutLabel = [[self class] labelWithText:@"" size:18];
        NSMutableAttributedString *attributedString;
        attributedString = [[NSMutableAttributedString alloc] initWithString:@"reach out!"];
        [attributedString addAttribute:NSUnderlineStyleAttributeName value:@1 range:NSMakeRange(0, [attributedString length])];
        [reachOutLabel setAttributedText:attributedString];
        reachOutLabel.textColor = UIColor.whiteColor;
        [contactUsContainer addSubview:reachOutLabel];
        [reachOutLabel sizeToFit];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapContactUsLabel)];
        [reachOutLabel addGestureRecognizer:tapGestureRecognizer];
        reachOutLabel.userInteractionEnabled = YES;

        [self.view addSubview:contactUsContainer];
        
        CGFloat containerWidth = ifLabel.bounds.size.width + reachOutLabel.bounds.size.width + 5;
        
        [NSLayoutConstraint activateConstraints:@[
            [_routineCollectionViewController.view.topAnchor constraintEqualToAnchor:introLabel.bottomAnchor constant:10],
            [_routineCollectionViewController.view.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
            [_routineCollectionViewController.view.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
            [_routineCollectionViewController.view.bottomAnchor constraintEqualToAnchor:contactUsContainer.topAnchor],
        ]];
        
        [NSLayoutConstraint activateConstraints:@[
            [contactUsContainer.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
            [contactUsContainer.widthAnchor constraintEqualToConstant:containerWidth],
            [contactUsContainer.heightAnchor constraintEqualToConstant:reachOutLabel.bounds.size.height],
            [contactUsContainer.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-50],
            [ifLabel.leadingAnchor constraintEqualToAnchor:contactUsContainer.leadingAnchor],
            [reachOutLabel.leadingAnchor constraintEqualToAnchor:ifLabel.trailingAnchor constant:5],
        ]];
        
        _contactUsViewController = [[ContactUsViewController alloc] init];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"close-icon"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapGoBack)];
        backButton.tintColor = UIColor.blackColor;
        _contactUsViewController.navigationItem.leftBarButtonItem = backButton;
        _contactUsViewController.navigationItem.title = @"Contact us";
    }

    return self;
}

#pragma mark - UIView overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *backgroundColor = [UIColor colorWithRed:20/255.0 green:43/255.0 blue:63/255.0 alpha:1];
    self.view.backgroundColor = backgroundColor;
}

#pragma mark - Private

- (void)didTapGoBack {
    [UIView animateWithDuration:1
                     animations:^{
        [self.contactUsViewController.view removeFromSuperview];
    }];
}

- (void)didTapContactUsLabel {
    [UIView animateWithDuration:1
                     animations:^{
        [self.view addSubview:self.contactUsViewController.view];
    }];
}

- (void)didTapSignOut {
    NSError *signOutError;
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if (!status) {
      NSLog(@"Error signing out: %@", signOutError);
      return;
    } else {
      [self.delegate userDidSuccessfullyLogout];
    }
}

+ (UILabel *)labelWithText:(NSString *)text size:(CGFloat)size {
    UILabel *label = [[UILabel alloc] init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = text;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    label.font = [UIFont fontWithName:@"Roboto-Black" size:size];
    return label;
}

+ (NSDictionary<NSString *, UIImageView *> *)workoutRoutineConfig {
    NSMutableDictionary<NSString *, UIImageView *> *config = [NSMutableDictionary dictionary];
    
    UIImageView *pullupsImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pullups"]];
    pullupsImageView.contentMode = UIViewContentModeScaleAspectFill;
    config[@"• 4 sets of pull-ups"] = pullupsImageView;
    
    UIImageView *tbarRowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tbarrow"]];
    tbarRowImageView.contentMode = UIViewContentModeScaleAspectFill;
    config[@"• 3 sets of T-bar row"] = tbarRowImageView;
    
    UIImageView *seatedRowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"seatedrow1"]];
    seatedRowImageView.contentMode = UIViewContentModeScaleAspectFill;
    config[@"• 3 sets of seated row"] = seatedRowImageView;
    
    UIImageView *inclineDumbbellCurlsImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dumbbellcurl"]];
    inclineDumbbellCurlsImageView.contentMode = UIViewContentModeScaleAspectFill;
    config[@"• 3 sets of incline dumbbell curls"] = inclineDumbbellCurlsImageView;
    
    UIImageView *dumbbellCurlsImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dumbbellHammerCurls1"]];
    dumbbellCurlsImageView.contentMode = UIViewContentModeScaleAspectFill;
    config[@"• 3 sets of dumbbell hammer curls"] = dumbbellCurlsImageView;
    return config;
}

@end
