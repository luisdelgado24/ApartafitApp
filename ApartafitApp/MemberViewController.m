#import "MemberViewController.h"

#import "WorkoutDashboardView.h"

static const CGFloat kTabBarHeight = 85;

@interface MemberViewController () <UITabBarDelegate>

@property(nonatomic, readonly) UITabBar *memberTabBar;
@property(nonatomic, readonly) UIView *workoutRoutineView;

@end

@implementation MemberViewController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _memberTabBar = [[UITabBar alloc] init];
        _memberTabBar.delegate = self;
        _memberTabBar.translatesAutoresizingMaskIntoConstraints = NO;
        
        NSMutableArray *memberTabBarItems = [[NSMutableArray alloc] init];

        UITabBarItem *tabBarItem1 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
        UITabBarItem *tabBarItem2 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1 ];
        UITabBarItem *tabBarItem3 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:2 ];

        [memberTabBarItems addObject:tabBarItem1];
        [memberTabBarItems addObject:tabBarItem2];
        [memberTabBarItems addObject:tabBarItem3];

        _memberTabBar.items = memberTabBarItems;
        _memberTabBar.selectedItem = [memberTabBarItems objectAtIndex:0];
        
        _workoutRoutineView = [[WorkoutDashboardView alloc] init];
        _workoutRoutineView.translatesAutoresizingMaskIntoConstraints = NO;
        [self renderWorkoutRoutineView];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.memberTabBar];
    [NSLayoutConstraint activateConstraints:@[
        [self.memberTabBar.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
        [self.memberTabBar.heightAnchor constraintEqualToConstant:kTabBarHeight],
        [self.memberTabBar.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.memberTabBar.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
    ]];
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFullScreen;
}

#pragma mark - UITabBarDelegate

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSInteger selectedTag = tabBar.selectedItem.tag;
    NSLog(@"%ld",(long)selectedTag);
    if (selectedTag == 0) {
        [self renderWorkoutRoutineView];
    } else if(selectedTag == 1) {
        self.view.backgroundColor = UIColor.greenColor;
        [self.workoutRoutineView removeFromSuperview];
        NSLog(@"1");
    } else { //if(selectedTag == 2)
        self.view.backgroundColor = UIColor.blackColor;
        [self.workoutRoutineView removeFromSuperview];
        NSLog(@"2");
    }
}

#pragma mark - Private

- (void)renderWorkoutRoutineView {
    [self.view addSubview:self.workoutRoutineView];
    [NSLayoutConstraint activateConstraints:@[
        [self.workoutRoutineView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
        [self.workoutRoutineView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor constant:-kTabBarHeight],
        [self.workoutRoutineView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.workoutRoutineView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
    ]];
}

@end
