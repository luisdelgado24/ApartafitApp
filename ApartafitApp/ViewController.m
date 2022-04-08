#import "ViewController.h"

#import "HomeViewController.h"

@interface ViewController () <UITabBarControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    homeViewController.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addChildViewController:homeViewController];
    [self.view addSubview:homeViewController.view];
    
    [NSLayoutConstraint activateConstraints:@[
        [homeViewController.view.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
        [homeViewController.view.heightAnchor constraintEqualToAnchor:self.view.heightAnchor],
    ]];
}

@end
