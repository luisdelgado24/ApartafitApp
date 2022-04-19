#import "ContactUsViewController.h"

#import "AccountCreationViewController.h"
#import "MaterialButtons.h"
#import "MemberViewController.h"

@interface ContactUsViewController ()

@property(nonatomic, readonly) UILabel *introLabel;
@property(nonatomic, readonly) UITextField *textField;
@property(nonatomic, readonly) UIButton *signUpButton;

@end

@implementation ContactUsViewController

- (instancetype)init {
    self = [super init];

    if (self) {
        _introLabel = [[self class] labelWithText:@"Want to switch up your routine or have any comments for your trainer? Leave a detailed description and we'll get back to you as soon as possible." size:16];
        _introLabel.textColor = UIColor.whiteColor;
        [self.view addSubview:_introLabel];
        
        _textField = [[self class] textFieldWithPlaceholderText:@"Description"];
        [self.view addSubview:_textField];
        
        _signUpButton = [[UIButton alloc] init];
        [_signUpButton setTitle:@"Sign up now" forState:UIControlStateNormal];
        _signUpButton.titleLabel.textColor = [UIColor colorWithRed:20/255.0 green:43/255.0 blue:63/255.0 alpha:.5];
        _signUpButton.translatesAutoresizingMaskIntoConstraints = NO;
        _signUpButton.backgroundColor = [UIColor colorWithRed:83/255.0 green:147/255.0 blue:115/255.0 alpha:1];
        [_signUpButton addTarget:self
                        action:@selector(didTapSignUpButton)
              forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_signUpButton];
    }

    return self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    UIColor *backgroundColor = [UIColor colorWithRed:20/255.0 green:43/255.0 blue:63/255.0 alpha:1];
    self.view.backgroundColor = backgroundColor;
    
    [self.introLabel sizeToFit];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.introLabel.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.8],
        [self.introLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:50],
        [self.introLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.textField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.textField.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [self.textField.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.8],
        [self.textField.heightAnchor constraintEqualToConstant:200],
    ]];
    
    /*
     //        [moreTextField.leadingAnchor constraintEqualToAnchor:moreLabel.leadingAnchor],
     //        [moreTextField.topAnchor constraintEqualToAnchor:moreLabel.bottomAnchor constant:8],
     //        [moreTextField.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-16],
     */
    
    [NSLayoutConstraint activateConstraints:@[
        [self.signUpButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.signUpButton.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.70],
        [self.signUpButton.heightAnchor constraintEqualToConstant:50],
        [self.signUpButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-65],
    ]];
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFormSheet;
}

#pragma mark - Private

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
    textField.textAlignment = NSTextAlignmentLeft;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    return textField;
}

@end
