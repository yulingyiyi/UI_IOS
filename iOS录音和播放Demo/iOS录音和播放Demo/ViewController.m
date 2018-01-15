//
//  ViewController.m
//  iOS录音和播放Demo
//
//  Created by apple on 2017/12/7.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#define KRecordAudioFile @"record.caf"
@interface ViewController ()<AVAudioRecorderDelegate>

/**
 
 */
@property (nonatomic, strong) AVAudioRecorder * audioRecorder;
@property (nonatomic,strong) AVAudioPlayer *audioPlayer;//音频播放器，用于播放录音文件
@property (nonatomic,strong) NSTimer *timer;//录音声波监控（注意这里暂时不对播放进行监控）


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [session setActive:YES error:nil];
    [session overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSURL *)getSavePath{
    NSString *urlStr=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    urlStr=[urlStr stringByAppendingPathComponent:KRecordAudioFile];
    NSLog(@"file path:%@",urlStr);
    NSURL *url=[NSURL fileURLWithPath:urlStr];
    return url;
}
/**
 *  取得录音文件设置
 *
 *  @return 录音设置
 */
-(NSDictionary *)getAudioSetting{
    NSMutableDictionary *dicM=[NSMutableDictionary dictionary];
    //设置录音格式
    [dicM setObject:@(kAudioFormatLinearPCM) forKey:AVFormatIDKey];
    //设置录音采样率，8000是电话采样率，对于一般录音已经够了
    [dicM setObject:@(8000) forKey:AVSampleRateKey];
    //设置通道,这里采用单声道
    [dicM setObject:@(1) forKey:AVNumberOfChannelsKey];
    //每个采样点位数,分为8、16、24、32
    [dicM setObject:@(8) forKey:AVLinearPCMBitDepthKey];
    //是否使用浮点数采样
    [dicM setObject:@(YES) forKey:AVLinearPCMIsFloatKey];
    //....其他设置等
    return dicM;
}
- (AVAudioRecorder *)audioRecorder{
    if (_audioRecorder == nil) {
        NSURL *url = [self getSavePath];
        NSDictionary *setting = [self getAudioSetting];
        NSError *error = nil;
        _audioRecorder = [[AVAudioRecorder alloc] initWithURL:url settings:setting error:&error];
        if (error) {
            NSLog(@"创建录音机对象时发生错误，错误信息：%@",error.localizedDescription);
            return nil;
        }
        _audioRecorder.delegate = self;
        _audioRecorder.meteringEnabled = YES;
    }
    return _audioRecorder;
}
- (AVAudioPlayer *)audioPlayer{
    if (_audioPlayer == nil) {
        NSURL *url = [self getSavePath];
        NSError *error = nil;
        if ([[NSFileManager defaultManager] fileExistsAtPath:[url absoluteString]]) {
              NSLog(@"play%@", [NSData dataWithContentsOfURL:url]);
        }
        NSLog(@"play%@", [NSData dataWithContentsOfURL:url]);
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        _audioPlayer.numberOfLoops = 0;
        self.audioPlayer.volume = 1.0;
        [_audioPlayer prepareToPlay];
        if (error) {
            NSLog(@"创建播放器过程中发生错误，错误信息：%@",error.localizedDescription);
            return nil;
        }
    }
    return _audioPlayer;
}


/**
 *  录音声波监控定制器
 *
 *  @return 定时器
 */
-(NSTimer *)timer{
    if (!_timer) {
        _timer=[NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(audioPowerChange) userInfo:nil repeats:YES];
    }
    return _timer;
}

/**
 *  录音声波状态设置
 */
-(void)audioPowerChange{
    [self.audioRecorder updateMeters];//更新测量值
    float power= [self.audioRecorder averagePowerForChannel:0];//取得第一个通道的音频，注意音频强度范围时-160到0
    CGFloat progress=(1.0/160.0)*(power+160.0);
    [self.proessView setProgress:progress];
}



- (IBAction)start:(UIButton *)sender {
    if (!self.audioRecorder.isRecording) {
        [self.audioRecorder record];
        self.timer.fireDate = [NSDate distantPast];
    }
}



- (IBAction)stop:(UIButton *)sender {
    if (self.audioRecorder.isRecording) {
        [self.audioRecorder pause];
        self.timer.fireDate = [NSDate distantFuture];
    }
}
- (IBAction)end:(UIButton *)sender {
    if (self.audioRecorder.isRecording) {
        [self.audioRecorder stop];
        self.timer.fireDate = [NSDate distantFuture];
    }
}
- (IBAction)play:(UIButton *)sender {
    if (!self.audioRecorder.isRecording) {
        [self.audioRecorder stop];
    }
    if (!self.audioPlayer.isPlaying) {
        [self.audioPlayer play];
        self.timer.fireDate = [NSDate distantFuture];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
