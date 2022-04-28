#import "ContactUsViewController.h"

#import "AccountCreationViewController.h"
#import "MemberViewController.h"

@interface ContactUsViewController ()

@property(nonatomic, readonly) UILabel *introLabel;
@property(nonatomic, readonly) UITextField *textField;
@property(nonatomic, readonly) UIButton *sendButton;

@end

@implementation ContactUsViewController

- (instancetype)init {
    self = [super init];

    if (self) {
        _introLabel = [[self class] labelWithText:@"" size:16];
        _introLabel.textColor = UIColor.whiteColor;
        
        NSString *text = @"Want to switch up your routine or have any comments for your trainer? Leave a detailed description and we'll get back to you as soon as possible.";
        NSMutableParagraphStyle *introParagraph = [[NSMutableParagraphStyle alloc] init];
        introParagraph.alignment = NSTextAlignmentCenter;
        introParagraph.lineSpacing = 2.0f;
        introParagraph.lineHeightMultiple = 1.3;
        NSMutableAttributedString* attrText = [[NSMutableAttributedString alloc] initWithString:text];
        [attrText addAttribute:NSParagraphStyleAttributeName value:introParagraph range:NSMakeRange(0, text.length)];
        _introLabel.attributedText = attrText;

        [self.view addSubview:_introLabel];
        
        _textField = [[self class] textFieldWithPlaceholderText:@"Description"];
        [self.view addSubview:_textField];
        
        _sendButton = [[UIButton alloc] init];
        [_sendButton setTitle:@"Send" forState:UIControlStateNormal];
        _sendButton.titleLabel.textColor = [UIColor colorWithRed:20/255.0 green:43/255.0 blue:63/255.0 alpha:.5];
        _sendButton.translatesAutoresizingMaskIntoConstraints = NO;
        _sendButton.backgroundColor = [UIColor colorWithRed:83/255.0 green:147/255.0 blue:115/255.0 alpha:1];
        [_sendButton addTarget:self
                        action:@selector(didTapSendButton)
              forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_sendButton];
    }

    return self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    UIColor *backgroundColor = [UIColor colorWithRed:66/255.0 green:182/255.0 blue:132/255.0 alpha:1];
    self.view.backgroundColor = backgroundColor;
    
    [self.introLabel sizeToFit];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.introLabel.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.8],
        [self.introLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:50],
        [self.introLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.textField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.textField.topAnchor constraintEqualToAnchor:self.introLabel.bottomAnchor constant:10],
        [self.textField.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.8],
        [self.textField.heightAnchor constraintEqualToConstant:200],
    ]];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.sendButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.sendButton.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:.70],
        [self.sendButton.heightAnchor constraintEqualToConstant:50],
        [self.sendButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-65],
    ]];
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationFullScreen;
}

#pragma mark - Private

- (void)didTapSendButton {
    
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
    textField.backgroundColor = UIColor.whiteColor;//[UIColor colorWithRed:8/255.0 green:20/255.0 blue:42/255.0 alpha:1];
    textField.placeholder = placeholderText;
    textField.textColor = UIColor.blackColor;
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholderText attributes:@{ NSForegroundColorAttributeName : UIColor.blackColor }];
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    textField.borderStyle = UITextBorderStyleLine;
    textField.textAlignment = NSTextAlignmentLeft;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    return textField;
}

@end
