#import "MemberViewController.h"

#import "WorkoutDashboardView.h"

@interface MemberViewController ()

@property(nonatomic, readonly) UIView *workoutRoutineView;

@end

@implementation MemberViewController

- (instancetype)init {
    self = [super init];
    
    if (self) {
        _workoutRoutineView = [[WorkoutDashboardView alloc] init];
        _workoutRoutineView.translatesAutoresizingMaskIntoConstraints = NO;
        [self renderWorkoutRoutineView];
    }

    return self;
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFullScreen;
}

#pragma mark - Private

- (void)renderWorkoutRoutineView {
    [self.view addSubview:self.workoutRoutineView];
    [NSLayoutConstraint activateConstraints:@[
        [self.workoutRoutineView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
        [self.workoutRoutineView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor],
        [self.workoutRoutineView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.workoutRoutineView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
    ]];
}

@end
