clear; close all; clc
cd = '/Users/jameschee/Desktop/octave/test/ISEF';

still = load('still.txt');%%loading 'still' training set of accel and gyro
walk = load('walk.txt');%%loading 'walk' training set of accel and gyro
fall = load('fall.txt');%%loading 'fall' training set of accel and gyro
swing = load('swing.txt');%%loading 'swing' training set of accel and gyro

%%manufacture training sets
%%use accel+gyro
%%use 10seconds of time
%%use lambda = 1
%use 6th time interval ==>0.3seconds interval

[dima,dimb] = size(still);
[restill,stilla,stillb] = iteration_sec(5,dima,still,2,0);

[dima,dimb] = size(walk);
[rewalk,walka,walkb] = iteration_sec(5,dima,walk,2,0);

[dima,dimb] = size(fall);
[refall,falla,fallb] = iteration_sec(5,dima,fall,2,0);

[dima,dimb] = size(swing);
[reswing,swinga,swingb] = iteration_sec(5,dima,swing,2,0);

Xa = [restill;rewalk;refall;reswing];
Xb = [rewalk;restill;refall;reswing];
Xc = [refall;restill;rewalk;reswing];
Xd = [reswing;restill;rewalk;refall];

Ya = [ones(stilla,1);zeros(walka+falla+swinga,1)];
Yb = [ones(walka,1);zeros(stilla+falla+swinga,1)];
Yc = [ones(falla,1);zeros(stilla+walka+swinga,1)];
Yd = [ones(swinga,1);zeros(stilla+walka+falla,1)];

[m,n]=size(Xa);
	Xa = [ones(m,1) Xa];
	initial_theta = zeros(n+1,1);
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	[stilltheta, cost] = ...
	fminunc(@(t)(costFunctionReg(t, Xa, Ya,1)), initial_theta, options);
	stilltheta = stilltheta';

[m,n]=size(Xb);
	Xb = [ones(m,1) Xb];
	initial_theta = zeros(n+1,1);
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	[walktheta, cost] = ...
	fminunc(@(t)(costFunctionReg(t, Xb, Yb,1)), initial_theta, options);
	walktheta = walktheta';

[m,n]=size(Xc);
	Xc = [ones(m,1) Xc];
	initial_theta = zeros(n+1,1);
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	[falltheta, cost] = ...
	fminunc(@(t)(costFunctionReg(t, Xc, Yc,1)), initial_theta, options);
	falltheta = falltheta';

[m,n]=size(Xd);
	Xd = [ones(m,1) Xd];
	initial_theta = zeros(n+1,1);
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	[swingtheta, cost] = ...
	fminunc(@(t)(costFunctionReg(t, Xd, Yd,1)), initial_theta, options);
	swingtheta = swingtheta';

csvwrite('stillfinaltheta.txt',stilltheta);
csvwrite('walkfinaltheta.txt',walktheta);
csvwrite('fallfinaltheta.txt',falltheta);
csvwrite('swingfinaltheta.txt',swingtheta);












