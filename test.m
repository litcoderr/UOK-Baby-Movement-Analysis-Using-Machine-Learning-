clear ; close all; clc

cd = '/Users/jameschee/Desktop/octave/test/ISEF';
still = load('still.txt');%%loading 'still' training set of accel and gyro
walk = load('walk.txt');%%loading 'walk' training set of accel and gyro
runn = load('run.txt');%%loading 'run' training set of accel and gyro
fall = load('fall.txt');%%loading 'fall' training set of accel and gyro
ss = load('seesaw.txt');%%loading 'seesaw' training set of accel and gyro
slide = load('slide.txt');%%loading 'slide' training set of accel and gyro
swing = load('swing.txt');%%loading 'swing' training set of accel and gyro

stilltest = load('stilltest.txt');
walktest = load('walktest.txt');
falltest = load('falltest.txt');
swingtest = load('swingtest.txt');

[still_sizea,still_sizeb] = size(still);
[walk_sizea,walk_sizeb] = size(walk);
[fall_sizea,fall_sizeb] = size(fall);
[swing_sizea,swing_sizeb] = size(swing);
X = [num2str(still_sizea),"_____",num2str(still_sizeb),"_____",num2str(walk_sizea),"_____",num2str(walk_sizeb),"______",num2str(fall_sizea),"_____",num2str(fall_sizeb),"_____",num2str(swing_sizea),"_____",num2str(swing_sizeb)];
disp('still_a stillb  walk_a walk_b  fall_a fall_b  swing_a swing_b');
disp(X);

[stilltest_sizea,stilltest_sizeb] = size(stilltest);
[walktest_sizea,walktest_sizeb] = size(walktest);
[falltest_sizea,falltest_sizeb] = size(falltest);
[swingtest_sizea,swingtest_sizeb] = size(swingtest);

Y = [num2str(stilltest_sizea),"____",num2str(stilltest_sizeb),"____",num2str(walktest_sizea),"____",num2str(walktest_sizeb),"_____",num2str(falltest_sizea),"____",num2str(falltest_sizeb),"____",num2str(swingtest_sizea),"____",num2str(swingtest_sizeb)];
disp('stilltest_a stilltestb  walktest_a walktest_b  falltest_a falltest_b  swingtest_a swingtest_b');
disp(Y);