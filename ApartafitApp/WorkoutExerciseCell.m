#import "WorkoutExerciseCell.h"

@interface WorkoutExerciseCell ()

@property(nonatomic) NSString *text;
@property(nonatomic) UIImageView *imageView;

@end

@implementation WorkoutExerciseCell

- (void)updateSetWithText:(NSString *)text imageView:(UIImageView *)imageView {
    [self setBackgroundColor:UIColor.brownColor];
    [self.backgroundView setBackgroundColor:UIColor.brownColor];
}

@end
