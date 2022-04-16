#import <UIKit/UIKit.h>

@interface WorkoutRoutineCollectionViewController : UICollectionViewController

- (instancetype)initWithConfig:(NSDictionary<NSString *, UIImageView *> *)config NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end
