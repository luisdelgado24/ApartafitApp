#import <UIKit/UIKit.h>

@protocol WorkoutDashboardViewControllerDelegate <NSObject>

- (void)userDidSuccessfullyLogout;

@end

@interface WorkoutDashboardViewController : UIViewController

@property(nonatomic, weak, nullable) id<WorkoutDashboardViewControllerDelegate> delegate;

@end
