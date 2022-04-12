#import "AccountCreationViewController.h"

#import "MaterialButtons.h"

@interface AccountCreationViewController ()

@end

@implementation AccountCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *backgroundColor = [UIColor colorWithRed:20/255.0 green:43/255.0 blue:63/255.0 alpha:1];
    self.view.backgroundColor = backgroundColor;
    
    UILabel *signUpLabel = [[self class] labelWithText:@"SIGN UP" size:18];
    signUpLabel.textColor = UIColor.whiteColor;
    [self.view addSubview:signUpLabel];
    [signUpLabel sizeToFit];
    
    [NSLayoutConstraint activateConstraints:@[
        [signUpLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [signUpLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:80],
    ]];
    
    [self addBorder];
    
    UILabel *signUpDescriptionLabel = [[self class] labelWithText:@"" size:16];
    NSString *text = @"Sign up for an Apartafit Account to begin receiving customized workout routines.";
    NSMutableParagraphStyle *signUpDescriptionParagraph = [[NSMutableParagraphStyle alloc] init];
    signUpDescriptionParagraph.alignment = NSTextAlignmentCenter;
    signUpDescriptionParagraph.lineSpacing = 2.0f;
    signUpDescriptionParagraph.lineHeightMultiple = 1.3;
    NSMutableAttributedString* attrText = [[NSMutableAttributedString alloc] initWithString:text];
    [attrText addAttribute:NSParagraphStyleAttributeName value:signUpDescriptionParagraph range:NSMakeRange(0, text.length)];
    signUpDescriptionLabel.attributedText = attrText;
    signUpDescriptionLabel.textColor = UIColor.whiteColor;
    signUpDescriptionLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:signUpDescriptionLabel];
    [signUpDescriptionLabel sizeToFit];
    
    [NSLayoutConstraint activateConstraints:@[
        [signUpDescriptionLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [signUpDescriptionLabel.topAnchor constraintEqualToAnchor:signUpLabel.bottomAnchor constant:80],
        [signUpDescriptionLabel.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.85],
    ]];
    
    UITextField *emailTextField = [[self class] textFieldWithPlaceholderText:@"Email"];
    [self.view addSubview:emailTextField];

    [NSLayoutConstraint activateConstraints:@[
        [emailTextField.leadingAnchor constraintEqualToAnchor:signUpDescriptionLabel.leadingAnchor],
        [emailTextField.topAnchor constraintEqualToAnchor:signUpDescriptionLabel.bottomAnchor constant:28],
        [emailTextField.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.8],
    ]];
    
    UITextField *passwordField = [[self class] textFieldWithPlaceholderText:@"Password"];
    [passwordField setSecureTextEntry:YES];
    [self.view addSubview:passwordField];

    [NSLayoutConstraint activateConstraints:@[
        [passwordField.leadingAnchor constraintEqualToAnchor:emailTextField.leadingAnchor],
        [passwordField.topAnchor constraintEqualToAnchor:emailTextField.bottomAnchor constant:18],
        [passwordField.widthAnchor constraintEqualToAnchor:emailTextField.widthAnchor],
    ]];
    
    UIButton *signUpButton = [[UIButton alloc] init];
    [signUpButton setTitle:@"Sign up now" forState:UIControlStateNormal];
    signUpButton.titleLabel.textColor = [UIColor colorWithRed:20/255.0 green:43/255.0 blue:63/255.0 alpha:.5];
    signUpButton.translatesAutoresizingMaskIntoConstraints = NO;
    signUpButton.backgroundColor = [UIColor colorWithRed:83/255.0 green:147/255.0 blue:115/255.0 alpha:1];
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
    
//    UILabel *firstNameLabel = [[self class] labelWithText:@"First name:"];
//    [self.view addSubview:firstNameLabel];
//
//    UITextField *firstNameTextField = [[self class] textFieldWithPlaceholderText:@""];
//    [self.view addSubview:firstNameTextField];
//
//    UILabel *lastNameLabel = [[self class] labelWithText:@"Last name:"];
//    [self.view addSubview:lastNameLabel];
//
//    UITextField *lastNameTextField = [[self class] textFieldWithPlaceholderText:@""];
//    [self.view addSubview:lastNameTextField];
//
//    UILabel *emailLabel = [[self class] labelWithText:@"Email:"];
//    [self.view addSubview:emailLabel];
//
//    UITextField *emailTextField = [[self class] textFieldWithPlaceholderText:@""];
//    [self.view addSubview:emailTextField];
//
//    UILabel *moreLabel = [[self class] labelWithText:@"Tell us a bit about yourself (where you are now plus what your fitness goals are:"];
//    [self.view addSubview:moreLabel];
//
//    UITextField *moreTextField = [[self class] textFieldWithPlaceholderText:@""];
//    [self.view addSubview:moreTextField];
//
//    MDCButton *submitButton = [[MDCButton alloc] init];
//    submitButton.translatesAutoresizingMaskIntoConstraints = NO;
//    [submitButton setTitle:@"Submit" forState:UIControlStateNormal];
//
//    [submitButton addTarget:self
//                 action:@selector(createAccount)
//       forControlEvents:UIControlEventTouchUpInside];
//
//    [self.view addSubview:submitButton];
//
//    [NSLayoutConstraint activateConstraints:@[
//        [firstNameLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:8],
//        [firstNameLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:12],
//        [firstNameTextField.leadingAnchor constraintEqualToAnchor:firstNameLabel.leadingAnchor],
//        [firstNameTextField.topAnchor constraintEqualToAnchor:firstNameLabel.bottomAnchor constant:8],
//        [firstNameTextField.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-16],
//        [lastNameLabel.leadingAnchor constraintEqualToAnchor:firstNameLabel.leadingAnchor],
//        [lastNameLabel.topAnchor constraintEqualToAnchor:firstNameTextField.bottomAnchor constant:16],
//        [lastNameTextField.leadingAnchor constraintEqualToAnchor:lastNameLabel.leadingAnchor],
//        [lastNameTextField.topAnchor constraintEqualToAnchor:lastNameLabel.bottomAnchor constant:8],
//        [lastNameTextField.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-16],
//        [emailLabel.leadingAnchor constraintEqualToAnchor:lastNameLabel.leadingAnchor],
//        [emailLabel.topAnchor constraintEqualToAnchor:lastNameTextField.bottomAnchor constant:16],
//        [emailTextField.leadingAnchor constraintEqualToAnchor:emailLabel.leadingAnchor],
//        [emailTextField.topAnchor constraintEqualToAnchor:emailLabel.bottomAnchor constant:8],
//        [emailTextField.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-16],
//        [moreLabel.leadingAnchor constraintEqualToAnchor:emailLabel.leadingAnchor],
//        [moreLabel.topAnchor constraintEqualToAnchor:emailTextField.bottomAnchor constant:16],
//        [moreLabel.widthAnchor constraintEqualToAnchor:self.view.widthAnchor],
//        [moreTextField.leadingAnchor constraintEqualToAnchor:moreLabel.leadingAnchor],
//        [moreTextField.topAnchor constraintEqualToAnchor:moreLabel.bottomAnchor constant:8],
//        [moreTextField.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-16],
//        [submitButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-100],
//        [submitButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
//    ]];
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationPopover;
}

- (void)createAccount {
    
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

+ (UITextField *)textFieldWithPlaceholderText:(NSString *)placeholderText {
    UITextField *textField = [[UITextField alloc] init];
    textField.backgroundColor = [UIColor colorWithRed:8/255.0 green:20/255.0 blue:42/255.0 alpha:1];
    textField.placeholder = placeholderText;
    UIColor *placeholderTextColor = [UIColor colorWithRed:225/255.0 green:227/255.0 blue:228/255.0 alpha:1];
    textField.textColor = placeholderTextColor;
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholderText attributes:@{ NSForegroundColorAttributeName : placeholderTextColor }];
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    textField.borderStyle = UITextBorderStyleLine;
    return textField;
}

- (void)addBorder {
    CALayer *border = [[CALayer alloc] init];
    border.backgroundColor = UIColor.blackColor.CGColor;

    border.frame = CGRectMake(20, 120, self.view.frame.size.width - 40, 1);
    [self.view.layer addSublayer:border];
}

- (void)didTapSignUpButton {
    
}

@end
