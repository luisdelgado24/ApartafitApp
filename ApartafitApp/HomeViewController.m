#import "HomeViewController.h"

#import "AccountCreationViewController.h"
#import "MaterialButtons.h"

static const CGFloat kTextFieldWidth = 200;

@interface HomeViewController ()

@property(nonatomic) UIImageView *backgroundImageView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *backgroundColor = [UIColor colorWithRed:20/255.0 green:43/255.0 blue:63/255.0 alpha:.5];
    self.view.backgroundColor = backgroundColor;
    
    [self renderLoginState];
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

    [NSLayoutConstraint activateConstraints:@[
        [signUpButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [signUpButton.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.70],
        [signUpButton.heightAnchor constraintEqualToConstant:50],
        [signUpButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-65],
    ]];
    
    UIView *orLoginContainer = [[UIView alloc] init];
    orLoginContainer.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILabel *orLabel = [[self class] labelWithText:@"or" size:14];
    orLabel.textColor = UIColor.whiteColor;
    [orLoginContainer addSubview:orLabel];
    [orLabel sizeToFit];
    
    
    UILabel *loginLabel = [[self class] labelWithText:@"" size:14];
    loginLabel.backgroundColor = [UIColor lightGrayColor];
    NSMutableAttributedString *attributedString;
    attributedString = [[NSMutableAttributedString alloc] initWithString:@"Log in"];
    [attributedString addAttribute:NSUnderlineStyleAttributeName value:@1 range:NSMakeRange(0, [attributedString length])];
    [loginLabel setAttributedText:attributedString];
    
    loginLabel.textColor = UIColor.whiteColor;
    [orLoginContainer addSubview:loginLabel];
    [loginLabel sizeToFit];
    
    [self.view addSubview:orLoginContainer];
    
    CGFloat orLoginWidth = orLabel.bounds.size.width + loginLabel.bounds.size.width + 5;
    
    [NSLayoutConstraint activateConstraints:@[
        [orLoginContainer.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [orLoginContainer.topAnchor constraintEqualToAnchor:signUpButton.bottomAnchor constant:5],
        [orLoginContainer.widthAnchor constraintEqualToConstant:orLoginWidth],
        [orLoginContainer.heightAnchor constraintEqualToConstant:loginLabel.bounds.size.height],
        [orLabel.leadingAnchor constraintEqualToAnchor:orLoginContainer.leadingAnchor],
        [loginLabel.leadingAnchor constraintEqualToAnchor:orLabel.trailingAnchor constant:5],
    ]];
    
    
//    UILabel *loginLabel = [[self class] labelWithText:@"Login:"];
//    loginLabel.textColor = UIColor.whiteColor;
//    loginLabel.font = [UIFont boldSystemFontOfSize:20.0];
//
//    UITextField *loginTextField = [[self class] textFieldWithPlaceholderText:@""];
//    loginTextField.layer.borderColor = UIColor.whiteColor.CGColor;
//    loginTextField.textColor = UIColor.whiteColor;
//    loginTextField.font = [UIFont boldSystemFontOfSize:20.0];
//
//    UIView *containerView = [[UIView alloc] init];
//    containerView.translatesAutoresizingMaskIntoConstraints = NO;
//
//    [containerView addSubview:loginLabel];
//    [loginLabel sizeToFit];
//
//    [containerView addSubview:loginTextField];
//    [loginTextField sizeToFit];
//
//    [self.view addSubview:containerView];
//
//    CGFloat dynamicWidth = loginLabel.frame.size.width + loginTextField.frame.size.width + kTextFieldWidth;
//
//    [NSLayoutConstraint activateConstraints:@[
//        [containerView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
//        [containerView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
//        [containerView.widthAnchor constraintEqualToConstant:dynamicWidth],
//        [containerView.heightAnchor constraintEqualToConstant:45],
//        [loginLabel.centerYAnchor constraintEqualToAnchor:containerView.centerYAnchor],
//        [loginLabel.leadingAnchor constraintEqualToAnchor:containerView.leadingAnchor],
//        [loginTextField.leadingAnchor constraintEqualToAnchor:loginLabel.trailingAnchor constant:6],
//        [loginTextField.centerYAnchor constraintEqualToAnchor:loginLabel.centerYAnchor],
//        [loginTextField.widthAnchor constraintEqualToConstant:kTextFieldWidth],
//    ]];
}

- (void)didTapSignUpButton {
    AccountCreationViewController *acctCreationViewController = [[AccountCreationViewController alloc] init];
    [self presentViewController:acctCreationViewController animated:YES completion:nil];
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
