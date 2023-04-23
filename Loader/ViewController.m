//
//  ViewController.m
//  Loader
//
//  Created by Abbas Lutvaliyev on 23.04.23.
//

#import "ViewController.h"
#import "NSTask.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)cydia:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Are you sure?"
                message:@"After you can't cancel this action."
                preferredStyle:UIAlertControllerStyleAlert]; // 1
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Yes"
                style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                    NSLog(@"You pressed button one"); // install cydia
                    int pid = [[NSProcessInfo processInfo] processIdentifier];
                    NSPipe *pipe = [NSPipe pipe];
                    NSFileHandle *file = pipe.fileHandleForReading;
                    // Cydia installing
                    NSTask *task = [[NSTask alloc] init];
                    task.launchPath = @"/bin/sh";
                    task.arguments = @[@"apt-get", @"install", @"cydia"];
                    task.standardOutput = pipe;

                    [task launch];
                    // Something
                    int pid2 = [[NSProcessInfo processInfo] processIdentifier];
                    NSPipe *pipe2 = [NSPipe pipe];
                    NSFileHandle *file2 = pipe.fileHandleForReading;

                    NSTask *task2 = [[NSTask alloc] init];
                    task2.launchPath = @"/bin/sh";
                    task2.arguments = @[@"su", @"mobile", @"-c", @"uicache"];
                    task2.standardOutput = pipe;

                    [task2 launch];
                    //reboot
                    int pid3 = [[NSProcessInfo processInfo] processIdentifier];
                    NSPipe *pipe3 = [NSPipe pipe];
                    NSFileHandle *file3 = pipe.fileHandleForReading;

                    NSTask *task3 = [[NSTask alloc] init];
                    task3.launchPath = @"/bin/sh";
                    task3.arguments = @[@"reboot"];
                    task3.standardOutput = pipe;

                    [task3 launch];

                    
                }];
        UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"No"
                style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                    NSLog(@"You pressed button two"); // cancel
                }];

        [alert addAction:firstAction];
        [alert addAction:secondAction];

    [self presentViewController:alert animated:YES completion:nil];
   }



- (IBAction)restore:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Are you sure?"
                message:@"After you can't cancel this action."
                preferredStyle:UIAlertControllerStyleAlert]; // 1
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"Yes"
                style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                    NSLog(@"You pressed button one"); // install cydia
                    int pid = [[NSProcessInfo processInfo] processIdentifier];
                    NSPipe *pipe = [NSPipe pipe];
                    NSFileHandle *file = pipe.fileHandleForReading;
                    // Restore
                    NSTask *task = [[NSTask alloc] init];
                    task.launchPath = @"/bin/sh";
                    task.arguments = @[@"snappy", @"-o"];
                    task.standardOutput = pipe;

                    [task launch];
                    // Something
                    int pid2 = [[NSProcessInfo processInfo] processIdentifier];
                    NSPipe *pipe2 = [NSPipe pipe];
                    NSFileHandle *file2 = pipe.fileHandleForReading;

                    NSTask *task2 = [[NSTask alloc] init];
                    task2.launchPath = @"/bin/sh";
                    task2.arguments = @[@"reboot"];
                    task2.standardOutput = pipe;

                    [task2 launch];


                    
                }];
        UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"No"
                style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                    NSLog(@"You pressed button two"); // cancel
                }];
        [alert addAction:firstAction];
        [alert addAction:secondAction];
    [self presentViewController:alert animated:YES completion:nil];
        

}



- (IBAction)github:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://github.com/z3ven/loader"]];
}



@end
