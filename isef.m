clear; close all; clc
cd = '/Users/jameschee/Desktop/octave/test/ISEF';
%%<==========load all training sets(each state of accel and gyro sensor)here====>
still = load('still.txt');%%loading 'still' training set of accel and gyro
walk = load('walk.txt');%%loading 'walk' training set of accel and gyro
runn = load('run.txt');%%loading 'run' training set of accel and gyro
fall = load('fall.txt');%%loading 'fall' training set of accel and gyro
ss = load('seesaw.txt');%%loading 'seesaw' training set of accel and gyro
slide = load('slide.txt');%%loading 'slide' training set of accel and gyro
swing = load('swing.txt');%%loading 'swing' training set of accel and gyro
%%<==========load all test sets here==================>
test = load('testdata.txt');
%%<==========trainingset of accelerometer each state============>
col=1;%%indexing variable
i = 1;%%another indexing variable
check=0;%%check if still has more numbers
temp = [];%%temporary matrix for calculation
%%still%%
stillaccel = [];%%matrix that actually gets the stillaccelerometer set
[dima,dimb] = size(still);%%dimention of matrix 'still'
for col=1:dima
	while(check==0)
		temp = [temp,still(col,i),still(col,i+1),still(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=1)
			check=1;
		endif
	endwhile
	stillaccel = [stillaccel;temp];
	check=0;
	temp = [];
	i = 1;
endfor
%%walk
walkaccel = [];%%matrix that actually gets the walkaccelerometer set
[dima,dimb] = size(walk);%%dimention of matrix 'walk'
for col=1:dima
	while(check==0)
		temp = [temp,walk(col,i),walk(col,i+1),walk(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=1)
			check=1;
		endif
	endwhile
	walkaccel = [walkaccel;temp];
	check=0;
	temp = [];
	i = 1;
endfor
%%run
runaccel = [];%%matrix that actually gets the runaccelerometer set
[dima,dimb] = size(runn);%%dimention of matrix 'runn'
for col=1:dima
	while(check==0)
		temp = [temp,runn(col,i),runn(col,i+1),runn(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=1)
			check=1;
		endif
	endwhile
	runaccel = [runaccel;temp];
	check=0;
	temp = [];
	i = 1;
endfor
%%fall
fallaccel = [];%%matrix that actually gets the fallaccelerometer set
[dima,dimb] = size(fall);%%dimention of matrix 'fall'
for col=1:dima
	while(check==0)
		temp = [temp,fall(col,i),fall(col,i+1),fall(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=1)
			check=1;
		endif
	endwhile
	fallaccel = [fallaccel;temp];
	check=0;
	temp = [];
	i = 1;
endfor
%%seesaw
ssaccel = [];%%matrix that actually gets the seesaw-accelerometer set
[dima,dimb] = size(ss);%%dimention of matrix 'ss'
for col=1:dima
	while(check==0)
		temp = [temp,ss(col,i),ss(col,i+1),ss(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=1)
			check=1;
		endif
	endwhile
	ssaccel = [ssaccel;temp];
	check=0;
	temp = [];
	i = 1;
endfor
%%slide
slideaccel = [];%%matrix that actually gets the slideaccelerometer set
[dima,dimb] = size(slide);%%dimention of matrix 'ss'
for col=1:dima
	while(check==0)
		temp = [temp,slide(col,i),slide(col,i+1),slide(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=1)
			check=1;
		endif
	endwhile
	slideaccel = [slideaccel;temp];
	check=0;
	temp = [];
	i = 1;
endfor
%%swing
swingaccel = [];%%matrix that actually gets the slideaccelerometer set
[dima,dimb] = size(swing);%%dimention of matrix 'ss'
for col=1:dima
	while(check==0)
		temp = [temp,swing(col,i),swing(col,i+1),swing(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=1)
			check=1;
		endif
	endwhile
	swingaccel = [swingaccel;temp];
	check=0;
	temp = [];
	i = 1;
endfor
%%<==========trainingset of gyro sensor each state============>
col=1;%%indexing variable
i = 4;%%another indexing variable
check=0;%%check if still has more numbers
temp = [];%%temporary matrix for calculation
%%still%%
stillgyro = [];%%matrix that actually gets the stillgyrosensor set
[dima,dimb] = size(still);%%dimention of matrix 'still'
for col=1:dima
	while(check==0)
		temp = [temp,still(col,i),still(col,i+1),still(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=4)
			check=1;
		endif
	endwhile
	stillgyro = [stillgyro;temp];
	check=0;
	temp = [];
	i = 4;
endfor
%%walk%%
walkgyro = [];%%matrix that actually gets the walkgyrosensor set
[dima,dimb] = size(walk);%%dimention of matrix 'walk'
for col=1:dima
	while(check==0)
		temp = [temp,walk(col,i),walk(col,i+1),walk(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=4)
			check=1;
		endif
	endwhile
	walkgyro = [walkgyro;temp];
	check=0;
	temp = [];
	i = 4;
endfor
%%run%%
rungyro = [];%%matrix that actually gets the rungyrosensor set
[dima,dimb] = size(runn);%%dimention of matrix 'runn'
for col=1:dima
	while(check==0)
		temp = [temp,runn(col,i),runn(col,i+1),runn(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=4)
			check=1;
		endif
	endwhile
	rungyro = [rungyro;temp];
	check=0;
	temp = [];
	i = 4;
endfor
%%fall%%
fallgyro = [];%%matrix that actually gets the fallgyrosensor set
[dima,dimb] = size(fall);%%dimention of matrix 'fall'
for col=1:dima
	while(check==0)
		temp = [temp,fall(col,i),fall(col,i+1),fall(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=4)
			check=1;
		endif
	endwhile
	fallgyro = [fallgyro;temp];
	check=0;
	temp = [];
	i = 4;
endfor
%%seesaw%%
ssgyro = [];%%matrix that actually gets the seesaw-gyrosensor set
[dima,dimb] = size(ss);%%dimention of matrix 'ss'
for col=1:dima
	while(check==0)
		temp = [temp,ss(col,i),ss(col,i+1),ss(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=4)
			check=1;
		endif
	endwhile
	ssgyro = [ssgyro;temp];
	check=0;
	temp = [];
	i = 4;
endfor
%%slide%%
slidegyro = [];%%matrix that actually gets the slidegyrosensor set
[dima,dimb] = size(slide);%%dimention of matrix 'slide'
for col=1:dima
	while(check==0)
		temp = [temp,slide(col,i),slide(col,i+1),slide(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=4)
			check=1;
		endif
	endwhile
	slidegyro = [slidegyro;temp];
	check=0;
	temp = [];
	i = 4;
endfor
%%swing%%
swinggyro = [];%%matrix that actually gets the swinggyrosensor set
[dima,dimb] = size(swing);%%dimention of matrix 'swing'
for col=1:dima
	while(check==0)
		temp = [temp,swing(col,i),swing(col,i+1),swing(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=4)
			check=1;
		endif
	endwhile
	swinggyro = [swinggyro;temp];
	check=0;
	temp = [];
	i = 4;
endfor
%%<==========trainingset of (accel+gyro)sensor by [time interval]====>
%%still(accel+gyro)
stilltime = [];
stillres = [];
stilltimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(still);
[stilltimetemp,newdima,newdimb] = iteration(1,dima,still,2);
stillres = [newdima,newdimb];
stilltime = [stilltime;stilltimetemp];
for time=2:10
	[stilltimetemp,newdima,newdimb] = iteration(time,dima,still,2);
	stilltime = [stilltime;stilltimetemp,zeros(newdima,stillres(1,2)-newdimb)];
	stillres = [stillres;newdima,newdimb];
endfor
%%walk(accel+gyro)
walktime = [];
walkres = [];
walktimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(walk);
[walktimetemp,newdima,newdimb] = iteration(1,dima,walk,2);
walkres = [newdima,newdimb];
walktime = [walktime;walktimetemp];
for time=2:10
	[walktimetemp,newdima,newdimb] = iteration(time,dima,walk,2);
	walktime = [walktime;walktimetemp,zeros(newdima,walkres(1,2)-newdimb)];
	walkres = [walkres;newdima,newdimb];
endfor
%%runn(accel+gyro)
runtime = [];
runres = [];
runtimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(runn);
[runtimetemp,newdima,newdimb] = iteration(1,dima,runn,2);
runres = [newdima,newdimb];
runtime = [runtime;runtimetemp];
for time=2:10
	[runtimetemp,newdima,newdimb] = iteration(time,dima,runn,2);
	runtime = [runtime;runtimetemp,zeros(newdima,runres(1,2)-newdimb)];
	runres = [runres;newdima,newdimb];
endfor
%%fall(accel+gyro)
falltime = [];
fallres = [];
falltimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(fall);
[falltimetemp,newdima,newdimb] = iteration(1,dima,fall,2);
fallres = [newdima,newdimb];
falltime = [falltime;falltimetemp];
for time=2:10
	[falltimetemp,newdima,newdimb] = iteration(time,dima,fall,2);
	falltime = [falltime;falltimetemp,zeros(newdima,fallres(1,2)-newdimb)];
	fallres = [fallres;newdima,newdimb];
endfor
%%seesaw(accel+gyro)
sstime = [];
ssres = [];
sstimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(ss);
[sstimetemp,newdima,newdimb] = iteration(1,dima,ss,2);
ssres = [newdima,newdimb];
sstime = [sstime;sstimetemp];
for time=2:10
	[sstimetemp,newdima,newdimb] = iteration(time,dima,ss,2);
	sstime = [sstime;sstimetemp,zeros(newdima,ssres(1,2)-newdimb)];
	ssres = [ssres;newdima,newdimb];
endfor
%%slide(accel+gyro)
slidetime = [];
slideres = [];
slidetimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(slide);
[slidetimetemp,newdima,newdimb] = iteration(1,dima,slide,2);
slideres = [newdima,newdimb];
slidetime = [slidetime;slidetimetemp];
for time=2:10
	[slidetimetemp,newdima,newdimb] = iteration(time,dima,slide,2);
	slidetime = [slidetime;slidetimetemp,zeros(newdima,slideres(1,2)-newdimb)];
	slideres = [slideres;newdima,newdimb];
endfor
%%swing(accel+gyro)
swingtime = [];
swingres = [];
swingtimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(swing);
[swingtimetemp,newdima,newdimb] = iteration(1,dima,swing,2);
swingres = [newdima,newdimb];
swingtime = [swingtime;swingtimetemp];
for time=2:10
	[swingtimetemp,newdima,newdimb] = iteration(time,dima,swing,2);
	swingtime = [swingtime;swingtimetemp,zeros(newdima,swingres(1,2)-newdimb)];
	swingres = [swingres;newdima,newdimb];
endfor
%%<==========trainingset of (accel)sensor by [time interval]=============>
%%stillaccel(accel)
stillacceltime = [];
stillaccelres = [];
stillacceltimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(stillaccel);
[stillacceltimetemp,newdima,newdimb] = iteration(1,dima,stillaccel,1);
stillaccelres = [newdima,newdimb];
stillacceltime = [stillacceltime;stillacceltimetemp];
for time=2:10
	[stillacceltimetemp,newdima,newdimb] = iteration(time,dima,stillaccel,1);
	stillacceltime = [stillacceltime;stillacceltimetemp,zeros(newdima,stillaccelres(1,2)-newdimb)];
	stillaccelres = [stillaccelres;newdima,newdimb];
endfor
%%walkaccel(accel)
walkacceltime = [];
walkaccelres = [];
walkacceltimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(walkaccel);
[walkacceltimetemp,newdima,newdimb] = iteration(1,dima,walkaccel,1);
walkaccelres = [newdima,newdimb];
walkacceltime = [walkacceltime;walkacceltimetemp];
for time=2:10
	[walkacceltimetemp,newdima,newdimb] = iteration(time,dima,walkaccel,1);
	walkacceltime = [walkacceltime;walkacceltimetemp,zeros(newdima,walkaccelres(1,2)-newdimb)];
	walkaccelres = [walkaccelres;newdima,newdimb];
endfor
%%runaccel(accel)
runacceltime = [];
runaccelres = [];
runacceltimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(runaccel);
[runacceltimetemp,newdima,newdimb] = iteration(1,dima,runaccel,1);
runaccelres = [newdima,newdimb];
runacceltime = [runacceltime;runacceltimetemp];
for time=2:10
	[runacceltimetemp,newdima,newdimb] = iteration(time,dima,runaccel,1);
	runacceltime = [runacceltime;runacceltimetemp,zeros(newdima,runaccelres(1,2)-newdimb)];
	runaccelres = [runaccelres;newdima,newdimb];
endfor
%%fallaccel(accel)
fallacceltime = [];
fallaccelres = [];
fallacceltimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(fallaccel);
[fallacceltimetemp,newdima,newdimb] = iteration(1,dima,fallaccel,1);
fallaccelres = [newdima,newdimb];
fallacceltime = [fallacceltime;fallacceltimetemp];
for time=2:10
	[fallacceltimetemp,newdima,newdimb] = iteration(time,dima,fallaccel,1);
	fallacceltime = [fallacceltime;fallacceltimetemp,zeros(newdima,fallaccelres(1,2)-newdimb)];
	fallaccelres = [fallaccelres;newdima,newdimb];
endfor
%%ssaccel(accel)
ssacceltime = [];
ssaccelres = [];
ssacceltimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(ssaccel);
[ssacceltimetemp,newdima,newdimb] = iteration(1,dima,ssaccel,1);
ssaccelres = [newdima,newdimb];
ssacceltime = [ssacceltime;ssacceltimetemp];
for time=2:10
	[ssacceltimetemp,newdima,newdimb] = iteration(time,dima,ssaccel,1);
	ssacceltime = [ssacceltime;ssacceltimetemp,zeros(newdima,ssaccelres(1,2)-newdimb)];
	ssaccelres = [ssaccelres;newdima,newdimb];
endfor
%%slideaccel(accel)
slideacceltime = [];
slideaccelres = [];
slideacceltimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(slideaccel);
[slideacceltimetemp,newdima,newdimb] = iteration(1,dima,slideaccel,1);
slideaccelres = [newdima,newdimb];
slideacceltime = [slideacceltime;slideacceltimetemp];
for time=2:10
	[slideacceltimetemp,newdima,newdimb] = iteration(time,dima,slideaccel,1);
	slideacceltime = [slideacceltime;slideacceltimetemp,zeros(newdima,slideaccelres(1,2)-newdimb)];
	slideaccelres = [slideaccelres;newdima,newdimb];
endfor
%%swingaccel(accel)
swingacceltime = [];
swingaccelres = [];
swingacceltimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(swingaccel);
[swingacceltimetemp,newdima,newdimb] = iteration(1,dima,swingaccel,1);
swingaccelres = [newdima,newdimb];
swingacceltime = [swingacceltime;swingacceltimetemp];
for time=2:10
	[swingacceltimetemp,newdima,newdimb] = iteration(time,dima,swingaccel,1);
	swingacceltime = [swingacceltime;swingacceltimetemp,zeros(newdima,swingaccelres(1,2)-newdimb)];
	swingaccelres = [swingaccelres;newdima,newdimb];
endfor

%%<==========trainingset of (gyro)sensor by [time interval]=============>
%%stillgyro(gyro)
stillgyrotime = [];
stillgyrores = [];
stillgyrotimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(stillgyro);
[stillgyrotimetemp,newdima,newdimb] = iteration(1,dima,stillgyro,1);
stillgyrores = [newdima,newdimb];
stillgyrotime = [stillgyrotime;stillgyrotimetemp];
for time=2:10
	[stillgyrotimetemp,newdima,newdimb] = iteration(time,dima,stillgyro,1);
	stillgyrotime = [stillgyrotime;stillgyrotimetemp,zeros(newdima,stillgyrores(1,2)-newdimb)];
	stillgyrores = [stillgyrores;newdima,newdimb];
endfor
%%walkgyro(gyro)
walkgyrotime = [];
walkgyrores = [];
walkgyrotimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(walkgyro);
[walkgyrotimetemp,newdima,newdimb] = iteration(1,dima,walkgyro,1);
walkgyrores = [newdima,newdimb];
walkgyrotime = [walkgyrotime;walkgyrotimetemp];
for time=2:10
	[walkgyrotimetemp,newdima,newdimb] = iteration(time,dima,walkgyro,1);
	walkgyrotime = [walkgyrotime;walkgyrotimetemp,zeros(newdima,walkgyrores(1,2)-newdimb)];
	walkgyrores = [walkgyrores;newdima,newdimb];
endfor
%%rungyro(gyro)
rungyrotime = [];
rungyrores = [];
rungyrotimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(rungyro);
[rungyrotimetemp,newdima,newdimb] = iteration(1,dima,rungyro,1);
rungyrores = [newdima,newdimb];
rungyrotime = [rungyrotime;rungyrotimetemp];
for time=2:10
	[rungyrotimetemp,newdima,newdimb] = iteration(time,dima,rungyro,1);
	rungyrotime = [rungyrotime;rungyrotimetemp,zeros(newdima,rungyrores(1,2)-newdimb)];
	rungyrores = [rungyrores;newdima,newdimb];
endfor
%%fallgyro(gyro)
fallgyrotime = [];
fallgyrores = [];
fallgyrotimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(fallgyro);
[fallgyrotimetemp,newdima,newdimb] = iteration(1,dima,fallgyro,1);
fallgyrores = [newdima,newdimb];
fallgyrotime = [fallgyrotime;fallgyrotimetemp];
for time=2:10
	[fallgyrotimetemp,newdima,newdimb] = iteration(time,dima,fallgyro,1);
	fallgyrotime = [fallgyrotime;fallgyrotimetemp,zeros(newdima,fallgyrores(1,2)-newdimb)];
	fallgyrores = [fallgyrores;newdima,newdimb];
endfor
%%ssgyro(gyro)
ssgyrotime = [];
ssgyrores = [];
ssgyrotimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(ssgyro);
[ssgyrotimetemp,newdima,newdimb] = iteration(1,dima,ssgyro,1);
ssgyrores = [newdima,newdimb];
ssgyrotime = [ssgyrotime;ssgyrotimetemp];
for time=2:10
	[ssgyrotimetemp,newdima,newdimb] = iteration(time,dima,ssgyro,1);
	ssgyrotime = [ssgyrotime;ssgyrotimetemp,zeros(newdima,ssgyrores(1,2)-newdimb)];
	ssgyrores = [ssgyrores;newdima,newdimb];
endfor
%%slidegyro(gyro)
slidegyrotime = [];
slidegyrores = [];
slidegyrotimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(slidegyro);
[slidegyrotimetemp,newdima,newdimb] = iteration(1,dima,slidegyro,1);
slidegyrores = [newdima,newdimb];
slidegyrotime = [slidegyrotime;slidegyrotimetemp];
for time=2:10
	[slidegyrotimetemp,newdima,newdimb] = iteration(time,dima,slidegyro,1);
	slidegyrotime = [slidegyrotime;slidegyrotimetemp,zeros(newdima,slidegyrores(1,2)-newdimb)];
	slidegyrores = [slidegyrores;newdima,newdimb];
endfor
%%swinggyro(gyro)
swinggyrotime = [];
swinggyrores = [];
swinggyrotimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(swinggyro);
[swinggyrotimetemp,newdima,newdimb] = iteration(1,dima,swinggyro,1);
swinggyrores = [newdima,newdimb];
swinggyrotime = [swinggyrotime;swinggyrotimetemp];
for time=2:10
	[swinggyrotimetemp,newdima,newdimb] = iteration(time,dima,swinggyro,1);
	swinggyrotime = [swinggyrotime;swinggyrotimetemp,zeros(newdima,swinggyrores(1,2)-newdimb)];
	swinggyrores = [swinggyrores;newdima,newdimb];
endfor
%%<-----done getting all trainig sets and start to do the real work----->
%%<==========Get theta of (accel+gyro) by [time interval]=========>
thetaag =[];
[thetaag]=learning(still,stilltime,stillres,walk,walktime,walkres,runn,runtime,runres,fall,falltime,fallres,ss,sstime,ssres,slide,slidetime,slideres,swing,swingtime,swingres);
save testthetaag.mat thetaag;
%%<==========Get theta of (accel) by [time interval]=========>
thetaa=[];
[thetaa]=learning(stillaccel,stillacceltime,stillaccelres,walkaccel,walkacceltime,walkaccelres,runaccel,runacceltime,runaccelres,fallaccel,fallacceltime,fallaccelres,ssaccel,ssacceltime,ssaccelres,slideaccel,slideacceltime,slideaccelres,swingaccel,swingacceltime,swingaccelres);
save testthetaa.mat thetaa;
%%<==========Get theta of (gyro) by [time interval]=========>
thetag=[];
[thetag]=learning(stillgyro,stillgyrotime,stillgyrores,walkgyro,walkgyrotime,walkgyrores,rungyro,rungyrotime,rungyrores,fallgyro,fallgyrotime,fallgyrores,ssgyro,ssgyrotime,ssgyrores,slidegyro,slidegyrotime,slidegyrores,swinggyro,swinggyrotime,swinggyrores);
save testthetag.mat thetag;
%%<==========Test set manufacturing Process =================>
col=1;%%indexing variable
i = 1;%%another indexing variable
check=0;%%check if test has more numbers
temp = [];%%temporary matrix for calculation
testaccel = [];%%matrix that actually gets the testaccelerometer set
[dima,dimb] = size(test);%%dimention of matrix 'testaccel'
for col=1:dima
	while(check==0)
		temp = [temp,test(col,i),test(col,i+1),test(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=1)
			check=1;
		endif
	endwhile
	testaccel = [testaccel;temp];
	check=0;
	temp = [];
	i = 1;
endfor

col=1;%%indexing variable
i = 4;%%another indexing variable
check=0;%%check if test has more numbers
temp = [];%%temporary matrix for calculation
%%testgyro%%
testgyro = [];%%matrix that actually gets the testgyrosensor set
[dima,dimb] = size(test);%%dimention of matrix 'test'
for col=1:dima
	while(check==0)
		temp = [temp,test(col,i),test(col,i+1),test(col,i+2)];
		i = i+6;
		if(i>dimb||rem(i,6)!=4)
			check=1;
		endif
	endwhile
	testgyro = [testgyro;temp];
	check=0;
	temp = [];
	i = 4;
endfor
%%testtime time interval(accel+gyro)
testtime = [];
testres = [];
testtimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(test);
[testtimetemp,newdima,newdimb] = iteration(1,dima,test,2);
testres = [newdima,newdimb];
testtime = [testtime;testtimetemp];
for time=2:10
	[testtimetemp,newdima,newdimb] = iteration(time,dima,test,2);
	testtime = [testtime;testtimetemp,zeros(newdima,testres(1,2)-newdimb)];
	testres = [testres;newdima,newdimb];
endfor

%%testaccel time interval(accel)
testacceltime = [];
testaccelres = [];
testacceltimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(testaccel);
[testacceltimetemp,newdima,newdimb] = iteration(1,dima,testaccel,1);
testaccelres = [newdima,newdimb];
testacceltime = [testacceltime;testacceltimetemp];
for time=2:10
	[testacceltimetemp,newdima,newdimb] = iteration(time,dima,testaccel,1);
	testacceltime = [testacceltime;testacceltimetemp,zeros(newdima,testaccelres(1,2)-newdimb)];
	testaccelres = [testaccelres;newdima,newdimb];
endfor

%%testgyro time interval(gyro)
testgyrotime = [];
testgyrores = [];
testgyrotimetemp=[];
newdima=0;
newdimb=0;
time=0;

[dima,dimb] = size(testgyro);
[testgyrotimetemp,newdima,newdimb] = iteration(1,dima,testgyro,1);
testgyrores = [newdima,newdimb];
testgyrotime = [testgyrotime;testgyrotimetemp];
for time=2:10
	[testgyrotimetemp,newdima,newdimb] = iteration(time,dima,testgyro,1);
	testgyrotime = [testgyrotime;testgyrotimetemp,zeros(newdima,testgyrores(1,2)-newdimb)];
	testgyrores = [testgyrores;newdima,newdimb];
endfor
%%<==========Test the accuracy (accel+gyro) by [time interval]=========>

[m,n] = size(test);
sigag=zeros(m,77);
testset = [ones(m,1) test];
indexb=1;
indexa=1;
summ=0;
sigmo=0;

tempa=[];
tempb=[];

for indexa=1:m
	for indexb=1:77
		if(indexb<=7)
			summ = sum(testset(indexa,:).*thetaag(indexb,:));
			sigmo = sigmoid(summ);
			sigag(indexa,indexb)= sigmo;
		else
			if(indexb==77)
				tempa = testtime(fix(indexb/7)-1,1:testres(fix(indexb/7)-1,2));
				tempb = thetaag(indexb,1:testres(fix(indexb/7)-1,2)+1);
				tempa = [1 tempa];
				summ = sum(tempa.*tempb);
				sigmo = sigmoid(summ);
				sigag(indexa,indexb)=sigmo;
			else
				if fix(indexb/7)==indexb/7
					tempa = testtime(fix(indexb/7)-1,1:testres(fix(indexb/7)-1,2));
					tempb = thetaag(indexb,1:testres(fix(indexb/7)-1,2)+1);
					tempa = [1 tempa];
					summ = sum(tempa.*tempb);
					sigmo = sigmoid(summ);
					sigag(indexa,indexb)=sigmo;
				else
					tempa = testtime(fix(indexb/7),1:testres(fix(indexb/7),2));
					tempb = thetaag(indexb,1:testres(fix(indexb/7),2)+1);
					tempa = [1 tempa];
					summ = sum(tempa.*tempb);
					sigmo = sigmoid(summ);
					sigag(indexa,indexb)=sigmo;
				endif
			endif
		endif
	endfor
endfor
%%<==========Test the accuracy (accel) by [time interval]=========>
[m,n] = size(testaccel);
siga=zeros(m,77);
testset = [ones(m,1) testaccel];
indexb=1;
indexa=1;
summ=0;
sigmo=0;

tempa=[];
tempb=[];

for indexa=1:m
	for indexb=1:77
		if(indexb<=7)
			summ = sum(testset(indexa,:).*thetaa(indexb,:));
			sigmo = sigmoid(summ);
			siga(indexa,indexb)= sigmo;
		else
			if(indexb==77)
				tempa = testacceltime(fix(indexb/7)-1,1:testaccelres(fix(indexb/7)-1,2));
				tempb = thetaa(indexb,1:testaccelres(fix(indexb/7)-1,2)+1);
				tempa = [1 tempa];
				summ = sum(tempa.*tempb);
				sigmo = sigmoid(summ);
				siga(indexa,indexb)=sigmo;
			else
				if fix(indexb/7)==indexb/7
					tempa = testacceltime(fix(indexb/7)-1,1:testaccelres(fix(indexb/7)-1,2));
					tempb = thetaa(indexb,1:testaccelres(fix(indexb/7)-1,2)+1);
					tempa = [1 tempa];
					summ = sum(tempa.*tempb);
					sigmo = sigmoid(summ);
					siga(indexa,indexb)=sigmo;
				else
					tempa = testacceltime(fix(indexb/7),1:testaccelres(fix(indexb/7),2));
					tempb = thetaa(indexb,1:testaccelres(fix(indexb/7),2)+1);
					tempa = [1 tempa];
					summ = sum(tempa.*tempb);
					sigmo = sigmoid(summ);
					siga(indexa,indexb)=sigmo;
				endif
			endif
		endif
	endfor
endfor
%%<==========Test the accuracy (gyro) by [time interval]=========>
[m,n] = size(testgyro);
sigg=zeros(m,77);
testset = [ones(m,1) testgyro];
indexb=1;
indexa=1;
summ=0;
sigmo=0;

tempa=[];
tempb=[];

for indexa=1:m
	for indexb=1:77
		if(indexb<=7)
			summ = sum(testset(indexa,:).*thetag(indexb,:));
			sigmo = sigmoid(summ);
			sigg(indexa,indexb)= sigmo;
		else
			if(indexb==77)
				tempa = testgyrotime(fix(indexb/7)-1,1:testgyrores(fix(indexb/7)-1,2));
				tempb = thetag(indexb,1:testgyrores(fix(indexb/7)-1,2)+1);
				tempa = [1 tempa];
				summ = sum(tempa.*tempb);
				sigmo = sigmoid(summ);
				sigg(indexa,indexb)=sigmo;
			else
				if fix(indexb/7)==indexb/7
					tempa = testgyrotime(fix(indexb/7)-1,1:testgyrores(fix(indexb/7)-1,2));
					tempb = thetag(indexb,1:testgyrores(fix(indexb/7)-1,2)+1);
					tempa = [1 tempa];
					summ = sum(tempa.*tempb);
					sigmo = sigmoid(summ);
					sigg(indexa,indexb)=sigmo;
				else
					tempa = testgyrotime(fix(indexb/7),1:testgyrores(fix(indexb/7),2));
					tempb = thetag(indexb,1:testgyrores(fix(indexb/7),2)+1);
					tempa = [1 tempa];
					summ = sum(tempa.*tempb);
					sigmo = sigmoid(summ);
					sigg(indexa,indexb)=sigmo;
				endif
			endif
		endif
	endfor
endfor
%%<==========plot things ==========>
setenv GNUTERM qt
figure(1);
clf();
x = [1:77];
class1 = zeros(1,77);
class2 = zeros(1,77);
class3 = zeros(1,77);
for i = 1:77
	class1(1,i) = siga(1,i);
	class2(1,i) = sigg(1,i);
	class3(1,i) = sigag(1,i);
endfor
class1 = class1';
class2 = class2';
class3 = class3';
y = [class1 class2 class3];
subplot(1,1,1);
bar(x,y);
xlabel('state');
ylabel('sigmoid value');
legend('accelerometer data','gyrosensor data', 'accel+gyro data');

figure(2);
clf();
ya = [class1];
subplot(1,1,1);
bar(x,ya);
xlabel('state(accelerometer)');
ylabel('sigmoid value');
legend('accelerometer data');

figure(3);
clf();
yb = [class2];
subplot(1,1,1);
bar(x,yb);
xlabel('state(gyrosensor)');
ylabel('sigmoid value');
legend('gyrosensor data');

figure(4);
clf();
yc = [class3];
subplot(1,1,1);
bar(x,yc);
xlabel('state(accelerometer+gyrosensor)');
ylabel('sigmoid value');
legend('accelerometer+gyrosensor data');