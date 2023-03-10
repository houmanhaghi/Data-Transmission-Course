% Initializatio
clc
clear
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


% y 
disp('y = ')
disp(y)
% length of y:
disp('length y = ');
disp(length(y));
%size of Fs:
disp('Fs = ')
disp(Fs)
%time
disp('time = ')
time = length(y) / Fs;
disp(time)

%histogram of handel:
hs = histogram(y, 'FaceColor', 'red');
grid on;

x = hs.BinEdges;
x(end)=[];
h = hs.Values;


entropy = 0;
l = length(y);
for i = 1 : length(h)
    p = h(i) / l;
    if p == 0
        continue
    end
    entropy = entropy - p*log2(p);
end


% entropy
disp('entropy = ')
disp(entropy)

dict = dictionary(x, h/l);

% huffmane code
code = huffmanenco(dict,y);
disp('huffmane code = ')
disp(code);
