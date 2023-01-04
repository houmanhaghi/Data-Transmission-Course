% Initializatio
% n
clc
close All

% Create WAV file in current folder .
load handel.mat
audiowrite('handel.wav',y,Fs);
clear y Fs

% Read the data back into MATLAB , and listen to audio
[y, Fs] = audioread('handel.wav');

% Play wav file
player = audioplayer(y,Fs);
play(player);





% % y 
% disp('y = ')
% disp(y)
% % length of y:
% disp('length y = ');
% disp(length(y));
% %size of Fs:
% disp('Fs = ')
% disp(Fs)
% %time
% disp('time = ')
% time = length(y) / Fs;
% disp(time)

%histogram of handel:
hs = histogram(y, 'FaceColor', 'red');
grid on;

x = hs.BinEdges;
h = hs.Values;




% count = 0;   count = len(Y)
% for i = 1 : length(h)
%     count = count + h(i);
% end 

% zero = find(h == 0);
% for k = 1:length(zero)
%     h(zero(k)) = 1;
% end


total = 0;
l = length(y)
for i = 1 : length(h)
    p = h(i) / l;
    if p == 0
        continue
    end
    disp(p)
    total = total - p*log2(p);

end

I = entropy(h)

% sum = 0.0;
% count_element = 0;
% for i = 0 : length(h)
%     count_element = count_element + h(i);
%     sum = sum - h.*(log2(h));
% end

% sum2 = 0.0;
% 
% for i = 0:Fs
%     sum2 = sum2 - Fs.*(log(Fs)/log(2));
% end




