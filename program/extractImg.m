%% ����Ƶ����ָ�ͼƬ
clc;
clear;
%% ��ȡ��Ƶ
% video_file='/Users/shuqinlee/Documents/PROJECT/Transportation/Video/FILE0039.MOV';

% video=VideoReader(video_file);
% frame_number=floor(video.Duration * video.FrameRate);
% %% ����ͼƬ
% for i=1:frame_number
%     if mod(i,10) == 0
%         
%         image_name=strcat('video3sup\',num2str(i));
%         image_name=strcat(image_name,'.jpg');
%         I=read(video,i);            %����ͼƬ
%         imwrite(I,image_name,'jpg');      %дͼƬ
%         I=[];
%     end
% end
%%

prefix = '/Users/shuqinlee/Documents/PROJECT/Transportation/Video/video_data/��һ��/FILE';
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
            I=read(video,i);            %����ͼƬ
            imwrite(I,strcat(dir, '/', image_name),'jpg');      %дͼƬ
            I=[];
        end
    end
end

%%
path = '/Users/shuqinlee/Documents/PROJECT/Transportation/Output/������'
for i = 1:103 
    mkdir([path, '/', int2str(i)])
end
