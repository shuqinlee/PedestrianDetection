%% 从视频里面分割图片
clc;
clear;
%% 读取视频
% video_file='/Users/shuqinlee/Documents/PROJECT/Transportation/Video/FILE0039.MOV';

% video=VideoReader(video_file);
% frame_number=floor(video.Duration * video.FrameRate);
% %% 分离图片
% for i=1:frame_number
%     if mod(i,10) == 0
%         
%         image_name=strcat('video3sup\',num2str(i));
%         image_name=strcat(image_name,'.jpg');
%         I=read(video,i);            %读出图片
%         imwrite(I,image_name,'jpg');      %写图片
%         I=[];
%     end
% end
%%

prefix = '/Users/shuqinlee/Documents/PROJECT/Transportation/Video/video_data/第一批/FILE';
subfix = '.MOV';
videos = {'0006','0036', '0066','0105'};
save = '/Users/shuqinlee/Documents/PROJECT/Transportation/VideoFrame/';
for j = 1:size(videos, 2)
    dir = strcat(save, 'video', videos{j})
    mkdir(dir)
    video = VideoReader( [prefix, videos{j}, subfix] );
    frame_number = floor(video.Duration * video.FrameRate);
    for i=1:frame_number
        if mod(i,10) == 0

            image_name=strcat(videos{j}, '_',int2str(i));
            image_name=strcat(image_name,'.jpg');
            I=read(video,i);            %读出图片
            imwrite(I,strcat(dir, '/', image_name),'jpg');      %写图片
            I=[];
        end
    end
end

%%
path = '/Users/shuqinlee/Documents/PROJECT/Transportation/Output/第三批'
for i = 1:103 
    mkdir([path, '/', int2str(i)])
end
