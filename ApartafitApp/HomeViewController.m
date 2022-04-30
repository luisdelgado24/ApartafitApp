#import "HomeViewController.h"

#import "AccountCreationViewController.h"
#import "MemberViewController.h"

@import GoogleSignIn;
@import FirebaseCore;
@import FirebaseAuth;

@interface HomeViewController () <MemberViewControllerDelegate>

@property(nonatomic) UIImageView *backgroundImageView;
@property(nonatomic) MemberViewController *memberViewController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *backgroundColor = [UIColor colorWithRed:20/255.0 green:43/255.0 blue:63/255.0 alpha:.5];
    self.view.backgroundColor = backgroundColor;
    
    if ([GIDSignIn.sharedInstance hasPreviousSignIn]) {
        __weak __auto_type weakSelf = self;
        [GIDSignIn.sharedInstance restorePreviousSignInWithCallback:^(GIDGoogleUser * _Nullable user, NSError * _Nullable error) {
            __auto_type strongSelf = weakSelf;
            if (strongSelf == nil) { return; }

            if (error == nil) {
                self.memberViewController = [[MemberViewController alloc] init];
                self.memberViewController.delegate = self;
              [self presentViewController:self.memberViewController animated:YES completion:nil];
            } else {
                NSLog(@"Error!!");
                [self renderLoginState];
            }
        }];
    } else {
        [self renderLoginState];
    }
}

#pragma mark - MemberViewControllerDelegate

- (void)userDidSuccessfullyLogout {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private

- (void)renderLoginState {
    [self.view addSubview:self.backgroundImageView];
    
    UILabel *actionRequiredLabel = [[self class] labelWithText:@"ACTION REQUIRED" size:18];
    actionRequiredLabel.textColor = UIColor.whiteColor;
    [self.view addSubview:actionRequiredLabel];
    [actionRequiredLabel sizeToFit];
    
    [NSLayoutConstraint activateConstraints:@[
        [actionRequiredLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [actionRequiredLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:80],
    ]];

    [self addBorder];
    
    UILabel *createAccountSuggestionLabel = [[self class] labelWithText:@"In order for us to provide you with a customized workout routine, tailored to your facilities, you'll need to create an account." size:16];
    createAccountSuggestionLabel.textColor = UIColor.whiteColor;
    [self.view addSubview:createAccountSuggestionLabel];
    [createAccountSuggestionLabel sizeToFit];
    
    [NSLayoutConstraint activateConstraints:@[
        [createAccountSuggestionLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [createAccountSuggestionLabel.topAnchor constraintEqualToAnchor:actionRequiredLabel.bottomAnchor constant:80],
        [createAccountSuggestionLabel.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.85],
    ]];
    
    UIButton *signUpButton = [[UIButton alloc] init];
    [signUpButton setTitle:@"Sign up now" forState:UIControlStateNormal];
    signUpButton.titleLabel.textColor = [UIColor colorWithRed:20/255.0 green:43/255.0 blue:63/255.0 alpha:.5];
    signUpButton.translatesAutoresizingMaskIntoConstraints = NO;
    signUpButton.backgroundColor = [UIColor colorWithRed:16/255.0 green:61/255.0 blue:79/255.0 alpha:1];
    [signUpButton addTarget:self
                    action:@selector(didTapSignUpButton)
          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signUpButton];

    GIDSignInButton *googleButton = [[GIDSignInButton alloc] init];
    googleButton.translatesAutoresizingMaskIntoConstraints = NO;
    [googleButton setStyle:kGIDSignInButtonStyleWide];
    [googleButton addTarget:self action:@selector(didTapLoginLabel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:googleButton];

    [NSLayoutConstraint activateConstraints:@[
        [signUpButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [signUpButton.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.70],
        [signUpButton.heightAnchor constraintEqualToConstant:50],
        [signUpButton.bottomAnchor constraintEqualToAnchor:googleButton.topAnchor constant:-10],
    ]];

    [NSLayoutConstraint activateConstraints:@[
        [googleButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [googleButton.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.72],
        [googleButton.heightAnchor constraintEqualToConstant:50],
        [googleButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-65],
    ]];
}

- (void)didTapSignUpButton {
    AccountCreationViewController *acctCreationViewController = [[AccountCreationViewController alloc] init];
    [self presentViewController:acctCreationViewController animated:YES completion:nil];
}

- (void)didTapLoginLabel {
    GIDConfiguration *config = [[GIDConfiguration alloc] initWithClientID:[FIRApp defaultApp].options.clientID];

    __weak __auto_type weakSelf = self;
    [GIDSignIn.sharedInstance signInWithConfiguration:config presentingViewController:self callback:^(GIDGoogleUser * _Nullable user, NSError * _Nullable error) {
      __auto_type strongSelf = weakSelf;
      if (strongSelf == nil) { return; }

      if (error == nil) {
        GIDAuthentication *authentication = user.authentication;
        FIRAuthCredential *credential =
        [FIRGoogleAuthProvider credentialWithIDToken:authentication.idToken
                                         accessToken:authentication.accessToken];
        
        self.memberViewController = [[MemberViewController alloc] init];
        self.memberViewController.delegate = self;
        [self presentViewController:self.memberViewController animated:YES completion:nil];
      } else {
          NSLog(@"Error!!");
      }
    }];
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

- (void)addBorder {
    CALayer *border = [[CALayer alloc] init];
    border.backgroundColor = UIColor.blackColor.CGColor;

    border.frame = CGRectMake(20, 120, self.view.frame.size.width - 40, 1);
    [self.view.layer addSublayer:border];
}

+ (UITextField *)textFieldWithPlaceholderText:(NSString *)placeholderText {
    UITextField *textField = [[UITextField alloc] init];
    textField.placeholder = placeholderText;
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    textField.borderStyle = UITextBorderStyleLine;
    return textField;
}


+ (UIImageView *)backgroundImageView {
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    backgroundImageView.translatesAutoresizingMaskIntoConstraints = NO;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    return backgroundImageView;
}

@end
