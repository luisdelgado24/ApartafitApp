#import "MemberViewController.h"

#import "WorkoutDashboardViewController.h"

@interface MemberViewController ()

@property(nonatomic, readonly) UIViewController *workoutRoutineViewController;

@end

@implementation MemberViewController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _workoutRoutineViewController = [[WorkoutDashboardViewController alloc] init];
        _workoutRoutineViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
        [self renderWorkoutRoutineView];
    }

    return self;
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFullScreen;
}

#pragma mark - Private

- (void)renderWorkoutRoutineView {
    [self.view addSubview:self.workoutRoutineViewController.view];
    [NSLayoutConstraint activateConstraints:@[
        [self.workoutRoutineViewController.view.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
        [self.workoutRoutineViewController.view.heightAnchor constraintEqualToAnchor:self.view.heightAnchor],
        [self.workoutRoutineViewController.view.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.workoutRoutineViewController.view.topAnchor constraintEqualToAnchor:self.view.topAnchor],
    ]];
}

@end
