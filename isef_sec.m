clear; close all; clc
cd = '/Users/jameschee/Desktop/octave/test/ISEF';
%%<==========load all test sets here==================>
test = load('testdata.txt');
%%<<======variables==========>
idx=1;
%%<==========trainingset of accelerometer each state============>
for idx=0:3
	%%<==========load all training sets(each state of accel and gyro sensor)here====>
	still = load('still.txt');%%loading 'still' training set of accel and gyro
	walk = load('walk.txt');%%loading 'walk' training set of accel and gyro
	runn = load('run.txt');%%loading 'run' training set of accel and gyro
	fall = load('fall.txt');%%loading 'fall' training set of accel and gyro
	ss = load('seesaw.txt');%%loading 'seesaw' training set of accel and gyro
	slide = load('slide.txt');%%loading 'slide' training set of accel and gyro
	swing = load('swing.txt');%%loading 'swing' training set of accel and gyro

	still = still(:,1:1200-(300*idx));
	walk = walk(:,1:1200-(300*idx));
	runn = runn(:,1:1200-(300*idx));
	fall = fall(:,1:1200-(300*idx));
	ss = ss(:,1:1200-(300*idx));
	slide = slide(:,1:1200-(300*idx));
	swing = swing(:,1:1200-(300*idx));

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
	[stilltimetemp,newdima,newdimb] = iteration_sec(1,dima,still,2,idx);
	stillres = [newdima,newdimb];
	stilltime = [stilltime;stilltimetemp];
	for time=2:10
		[stilltimetemp,newdima,newdimb] = iteration_sec(time,dima,still,2,idx);
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
	[walktimetemp,newdima,newdimb] = iteration_sec(1,dima,walk,2,idx);
	walkres = [newdima,newdimb];
	walktime = [walktime;walktimetemp];
	for time=2:10
		[walktimetemp,newdima,newdimb] = iteration_sec(time,dima,walk,2,idx);
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
	[runtimetemp,newdima,newdimb] = iteration_sec(1,dima,runn,2,idx);
	runres = [newdima,newdimb];
	runtime = [runtime;runtimetemp];
	for time=2:10
		[runtimetemp,newdima,newdimb] = iteration_sec(time,dima,runn,2,idx);
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
	[falltimetemp,newdima,newdimb] = iteration_sec(1,dima,fall,2,idx);
	fallres = [newdima,newdimb];
	falltime = [falltime;falltimetemp];
	for time=2:10
		[falltimetemp,newdima,newdimb] = iteration_sec(time,dima,fall,2,idx);
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
	[sstimetemp,newdima,newdimb] = iteration_sec(1,dima,ss,2,idx);
	ssres = [newdima,newdimb];
	sstime = [sstime;sstimetemp];
	for time=2:10
		[sstimetemp,newdima,newdimb] = iteration_sec(time,dima,ss,2,idx);
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
	[slidetimetemp,newdima,newdimb] = iteration_sec(1,dima,slide,2,idx);
	slideres = [newdima,newdimb];
	slidetime = [slidetime;slidetimetemp];
	for time=2:10
		[slidetimetemp,newdima,newdimb] = iteration_sec(time,dima,slide,2,idx);
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
	[swingtimetemp,newdima,newdimb] = iteration_sec(1,dima,swing,2,idx);
	swingres = [newdima,newdimb];
	swingtime = [swingtime;swingtimetemp];
	for time=2:10
		[swingtimetemp,newdima,newdimb] = iteration_sec(time,dima,swing,2,idx);
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
	[stillacceltimetemp,newdima,newdimb] = iteration_sec(1,dima,stillaccel,1,idx);
	stillaccelres = [newdima,newdimb];
	stillacceltime = [stillacceltime;stillacceltimetemp];
	for time=2:10
		[stillacceltimetemp,newdima,newdimb] = iteration_sec(time,dima,stillaccel,1,idx);
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
	[walkacceltimetemp,newdima,newdimb] = iteration_sec(1,dima,walkaccel,1,idx);
	walkaccelres = [newdima,newdimb];
	walkacceltime = [walkacceltime;walkacceltimetemp];
	for time=2:10
		[walkacceltimetemp,newdima,newdimb] = iteration_sec(time,dima,walkaccel,1,idx);
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
	[runacceltimetemp,newdima,newdimb] = iteration_sec(1,dima,runaccel,1,idx);
	runaccelres = [newdima,newdimb];
	runacceltime = [runacceltime;runacceltimetemp];
	for time=2:10
		[runacceltimetemp,newdima,newdimb] = iteration_sec(time,dima,runaccel,1,idx);
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
	[fallacceltimetemp,newdima,newdimb] = iteration_sec(1,dima,fallaccel,1,idx);
	fallaccelres = [newdima,newdimb];
	fallacceltime = [fallacceltime;fallacceltimetemp];
	for time=2:10
		[fallacceltimetemp,newdima,newdimb] = iteration_sec(time,dima,fallaccel,1,idx);
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
	[ssacceltimetemp,newdima,newdimb] = iteration_sec(1,dima,ssaccel,1,idx);
	ssaccelres = [newdima,newdimb];
	ssacceltime = [ssacceltime;ssacceltimetemp];
	for time=2:10
		[ssacceltimetemp,newdima,newdimb] = iteration_sec(time,dima,ssaccel,1,idx);
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
	[slideacceltimetemp,newdima,newdimb] = iteration_sec(1,dima,slideaccel,1,idx);
	slideaccelres = [newdima,newdimb];
	slideacceltime = [slideacceltime;slideacceltimetemp];
	for time=2:10
		[slideacceltimetemp,newdima,newdimb] = iteration_sec(time,dima,slideaccel,1,idx);
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
	[swingacceltimetemp,newdima,newdimb] = iteration_sec(1,dima,swingaccel,1,idx);
	swingaccelres = [newdima,newdimb];
	swingacceltime = [swingacceltime;swingacceltimetemp];
	for time=2:10
		[swingacceltimetemp,newdima,newdimb] = iteration_sec(time,dima,swingaccel,1,idx);
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
	[stillgyrotimetemp,newdima,newdimb] = iteration_sec(1,dima,stillgyro,1,idx);
	stillgyrores = [newdima,newdimb];
	stillgyrotime = [stillgyrotime;stillgyrotimetemp];
	for time=2:10
		[stillgyrotimetemp,newdima,newdimb] = iteration_sec(time,dima,stillgyro,1,idx);
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
	[walkgyrotimetemp,newdima,newdimb] = iteration_sec(1,dima,walkgyro,1,idx);
	walkgyrores = [newdima,newdimb];
	walkgyrotime = [walkgyrotime;walkgyrotimetemp];
	for time=2:10
		[walkgyrotimetemp,newdima,newdimb] = iteration_sec(time,dima,walkgyro,1,idx);
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
	[rungyrotimetemp,newdima,newdimb] = iteration_sec(1,dima,rungyro,1,idx);
	rungyrores = [newdima,newdimb];
	rungyrotime = [rungyrotime;rungyrotimetemp];
	for time=2:10
		[rungyrotimetemp,newdima,newdimb] = iteration_sec(time,dima,rungyro,1,idx);
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
	[fallgyrotimetemp,newdima,newdimb] = iteration_sec(1,dima,fallgyro,1,idx);
	fallgyrores = [newdima,newdimb];
	fallgyrotime = [fallgyrotime;fallgyrotimetemp];
	for time=2:10
		[fallgyrotimetemp,newdima,newdimb] = iteration_sec(time,dima,fallgyro,1,idx);
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
	[ssgyrotimetemp,newdima,newdimb] = iteration_sec(1,dima,ssgyro,1,idx);
	ssgyrores = [newdima,newdimb];
	ssgyrotime = [ssgyrotime;ssgyrotimetemp];
	for time=2:10
		[ssgyrotimetemp,newdima,newdimb] = iteration_sec(time,dima,ssgyro,1,idx);
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
	[slidegyrotimetemp,newdima,newdimb] = iteration_sec(1,dima,slidegyro,1,idx);
	slidegyrores = [newdima,newdimb];
	slidegyrotime = [slidegyrotime;slidegyrotimetemp];
	for time=2:10
		[slidegyrotimetemp,newdima,newdimb] = iteration_sec(time,dima,slidegyro,1,idx);
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
	[swinggyrotimetemp,newdima,newdimb] = iteration_sec(1,dima,swinggyro,1,idx);
	swinggyrores = [newdima,newdimb];
	swinggyrotime = [swinggyrotime;swinggyrotimetemp];
	for time=2:10
		[swinggyrotimetemp,newdima,newdimb] = iteration_sec(time,dima,swinggyro,1,idx);
		swinggyrotime = [swinggyrotime;swinggyrotimetemp,zeros(newdima,swinggyrores(1,2)-newdimb)];
		swinggyrores = [swinggyrores;newdima,newdimb];
	endfor

	for lam=0:2
		%%<==========Get theta of (accel+gyro) by [time interval]=========>
		thetaag =[];
		[thetaag]=learning(still,stilltime,stillres,walk,walktime,walkres,runn,runtime,runres,fall,falltime,fallres,ss,sstime,ssres,slide,slidetime,slideres,swing,swingtime,swingres,1+(lam+0.5));

		%%<==========Get theta of (accel) by [time interval]=========>
		thetaa=[];
		[thetaa]=learning(stillaccel,stillacceltime,stillaccelres,walkaccel,walkacceltime,walkaccelres,runaccel,runacceltime,runaccelres,fallaccel,fallacceltime,fallaccelres,ssaccel,ssacceltime,ssaccelres,slideaccel,slideacceltime,slideaccelres,swingaccel,swingacceltime,swingaccelres,1+(lam+0.5));

		%%<==========Get theta of (gyro) by [time interval]=========>
		thetag=[];
		[thetag]=learning(stillgyro,stillgyrotime,stillgyrores,walkgyro,walkgyrotime,walkgyrores,rungyro,rungyrotime,rungyrores,fallgyro,fallgyrotime,fallgyrores,ssgyro,ssgyrotime,ssgyrores,slidegyro,slidegyrotime,slidegyrores,swinggyro,swinggyrotime,swinggyrores,1+(lam+0.5));

		%%<<=========save theta into a .mat file ============>>
		if idx==0
			if lam==0
				save A1thetaag.mat thetaag;
				save A1thetaa.mat thetaa;
				save A1thetag.mat thetag;
			elseif lam==1
				save A2thetaag.mat thetaag;
				save A2thetaa.mat thetaa;
				save A2thetag.mat thetag;
			elseif lam==2
				save A3thetaag.mat thetaag;
				save A3thetaa.mat thetaa;
				save A3thetag.mat thetag;
			endif
		elseif idx==1
			if lam==0
				save B1thetaag.mat thetaag;
				save B1thetaa.mat thetaa;
				save B1thetag.mat thetag;
			elseif lam==1
				save B2thetaag.mat thetaag;
				save B2thetaa.mat thetaa;
				save B2thetag.mat thetag;
			elseif lam==2
				save B3thetaag.mat thetaag;
				save B3thetaa.mat thetaa;
				save B3thetag.mat thetag;
			endif
		elseif idx==2
			if lam==0
				save C1thetaag.mat thetaag;
				save C1thetaa.mat thetaa;
				save C1thetag.mat thetag;
			elseif lam==1
				save C2thetaag.mat thetaag;
				save C2thetaa.mat thetaa;
				save C2thetag.mat thetag;
			elseif lam==2
				save C3thetaag.mat thetaag;
				save C3thetaa.mat thetaa;
				save C3thetag.mat thetag;
			endif
		elseif idx==3
			if lam==0
				save D1thetaag.mat thetaag;
				save D1thetaa.mat thetaa;
				save D1thetag.mat thetag;
			elseif lam==1
				save D2thetaag.mat thetaag;
				save D2thetaa.mat thetaa;
				save D2thetag.mat thetag;
			elseif lam==2
				save D3thetaag.mat thetaag;
				save D3thetaa.mat thetaa;
				save D3thetag.mat thetag;
			endif
		endif
	endfor
endfor








