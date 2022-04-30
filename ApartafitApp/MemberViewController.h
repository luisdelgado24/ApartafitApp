#import <UIKit/UIKit.h>

@protocol MemberViewControllerDelegate <NSObject>

- (void)userDidSuccessfullyLogout;

@end

@interface MemberViewController : UIViewController

@property(nonatomic, weak, nullable) id<MemberViewControllerDelegate> delegate;

@end
