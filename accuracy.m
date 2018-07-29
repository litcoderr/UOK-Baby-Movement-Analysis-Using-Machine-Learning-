clear; close all; clc
cd = '/Users/jameschee/Desktop/octave/test/ISEF';
trig=0;
high = [0,0,0,0,0];
higher = 0;
graph=0;
ti=0;
lam = 0;
count=0;
total = [];
for lam=0:2
	for ti=0:3
		%<<==========getting testdata and theta matrix=============>>
		stilltestdata = load('stilltest.txt');
		walktestdata = load('walktest.txt');
		falltestdata = load('falltest.txt');
		swingtestdata = load('swingtest.txt');
		testdata = [];
		testdata = [stilltestdata;walktestdata;falltestdata;swingtestdata];
		testdata = testdata(:,1:1200-(300*ti));
		test = [];
		if ti==0
			if lam==0
				load A1thetaag.mat;
				load A1thetaa.mat;
				load A1thetag.mat;
			elseif lam==1
				load A2thetaag.mat;
				load A2thetaa.mat;
				load A2thetag.mat;
			elseif lam==2
				load A3thetaag.mat;
				load A3thetaa.mat;
				load A3thetag.mat;
			endif
		elseif ti==1
			if lam==0
				load B1thetaag.mat;
				load B1thetaa.mat;
				load B1thetag.mat;
			elseif lam==1
				load B2thetaag.mat;
				load B2thetaa.mat;
				load B2thetag.mat;
			elseif lam==2
				load B3thetaag.mat;
				load B3thetaa.mat;
				load B3thetag.mat;
			endif
		elseif ti==2
			if lam==0
				load C1thetaag.mat;
				load C1thetaa.mat;
				load C1thetag.mat;
			elseif lam==1
				load C2thetaag.mat;
				load C2thetaa.mat;
				load C2thetag.mat;
			elseif lam==2
				load C3thetaag.mat;
				load C3thetaa.mat;
				load C3thetag.mat;
			endif
		elseif ti==3
			if lam==0
				load D1thetaag.mat;
				load D1thetaa.mat;
				load D1thetag.mat;
			elseif lam==1
				load D2thetaag.mat;
				load D2thetaa.mat;
				load D2thetag.mat;
			elseif lam==2
				load D3thetaag.mat;
				load D3thetaa.mat;
				load D3thetag.mat;
			endif
		endif

		%<<==========variables===========>>
		idx = 0;
		j = 0;
		guessag = 0;
		guessa = 0;
		guessg = 0;
		accag = zeros(1,11);%%number of success of ag theta set
		acca = zeros(1,11);%%number of success of a theta set
		accg = zeros(1,11);%%number of success of a theta set

		stillacc = ones(1,10);
		walkacc = ones(1,10)*2;
		fallacc = ones(1,10)*4;
		swingacc = ones(1,10)*5;
		accuratey = [];
		accuratey = [accuratey,stillacc,walkacc,fallacc,swingacc];


		%%<<=======start of testing by each testdata=============>>
		[sizea,sizeb] = size(testdata);
		for idx=1:sizea
			test = testdata(idx,:);
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
			[testtimetemp,newdima,newdimb] = iteration_sec(1,dima,test,2,ti);
			testres = [newdima,newdimb];
			testtime = [testtime;testtimetemp];
			for time=2:10
				[testtimetemp,newdima,newdimb] = iteration_sec(time,dima,test,2,ti);
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
			[testacceltimetemp,newdima,newdimb] = iteration_sec(1,dima,testaccel,1,ti);
			testaccelres = [newdima,newdimb];
			testacceltime = [testacceltime;testacceltimetemp];
			for time=2:10
				[testacceltimetemp,newdima,newdimb] = iteration_sec(time,dima,testaccel,1,ti);
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
			[testgyrotimetemp,newdima,newdimb] = iteration_sec(1,dima,testgyro,1,ti);
			testgyrores = [newdima,newdimb];
			testgyrotime = [testgyrotime;testgyrotimetemp];
			for time=2:10
				[testgyrotimetemp,newdima,newdimb] = iteration_sec(time,dima,testgyro,1,ti);
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
						summ = sum([testset(indexa,:)].*thetaag(indexb,:));
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
			%%<<===========see if something the model is accurate of not=============>
			dif = zeros(33,80);
			difidx = ones(1,3);
			wrong = [];
			for j = 1:11
				guessag = biggest(sigag(1,(j*7)-6 : j*7));%start 0
				guessa = biggest(siga(1,(j*7)-6 : j*7));%start 11
				guessg = biggest(sigg(1,(j*7)-6 : j*7));%start 22

				if guessag == accuratey(idx)
					accag(1,j)++;
				elseif guessag != accuratey(idx)
					dif(0+j,difidx(1,1)) = guessag;
					dif(0+j,difidx(1,1)+1) = accuratey(idx);
					difidx(1,1) = difidx(1,1)+2;
					%if ti==0&&lam==0&&j==6
					%	know = [num2str(guessag)," ",num2str(accuratey(idx))," ",num2str(ti)," ",num2str(lam)," ",num2str(1)," ",num2str(j)];
					%	disp(know);
					%endif
					%if ti==0&&lam==1&&j==6
					%	know = [num2str(guessag)," ",num2str(accuratey(idx))," ",num2str(ti)," ",num2str(lam)," ",num2str(1)," ",num2str(j)];
					%	disp(know);
					%endif
					%if ti==0&&lam==2&&j==6
					%	know = [num2str(guessag)," ",num2str(accuratey(idx))," ",num2str(ti)," ",num2str(lam)," ",num2str(1)," ",num2str(j)];
					%	disp(know);
					%endif
				endif

				if guessa == accuratey(idx)
					acca(1,j)++;
				elseif guessa != accuratey(idx)
					dif(11+j,difidx(1,2)) = guessa;
					dif(11+j,difidx(1,2)+1) = accuratey(idx);
					difidx(1,2) = difidx(1,2)+2;
					%if ti==0&&lam==0&&j==1
					%	know = [num2str(guessa)," ",num2str(accuratey(idx))," ",num2str(ti)," ",num2str(lam)," ",num2str(1)," ",num2str(j)];
					%	disp(know);
					%endif
					%if ti==1&&lam==0&&j==1
					%	know = [num2str(guessa)," ",num2str(accuratey(idx))," ",num2str(ti)," ",num2str(lam)," ",num2str(1)," ",num2str(j)];
					%	disp(know);
					%endif
					%if ti==0&&lam==1&&j==1
					%	know = [num2str(guessa)," ",num2str(accuratey(idx))," ",num2str(ti)," ",num2str(lam)," ",num2str(1)," ",num2str(j)];
					%	disp(know);
					%endif
					%if ti==1&&lam==1&&j==1
					%	know = [num2str(guessa)," ",num2str(accuratey(idx))," ",num2str(ti)," ",num2str(lam)," ",num2str(1)," ",num2str(j)];
					%	disp(know);
					%endif
					%if ti==0&&lam==2&&j==1
					%	know = [num2str(guessa)," ",num2str(accuratey(idx))," ",num2str(ti)," ",num2str(lam)," ",num2str(1)," ",num2str(j)];
					%	disp(know);
					%endif
					%if ti==1&&lam==2&&j==1
					%	know = [num2str(guessa)," ",num2str(accuratey(idx))," ",num2str(ti)," ",num2str(lam)," ",num2str(1)," ",num2str(j)];
					%	disp(know);
					%endif
				endif

				if guessg == accuratey(idx)
					accg(1,j)++;
				elseif guessg!= accuratey(idx)
					dif(22+j,difidx(1,3)) = guessg;
					dif(22+j,difidx(1,3)+1) = accuratey(idx);
					difidx(1,3) = difidx(1,3)+2;
					%%know = [num2str(guessg)," ",num2str(accuratey(idx))," ",num2str(ti)," ",num2str(lam)," ",num2str(j)];
					%%disp(know);
				endif

			endfor

		endfor

		%%<<=========getting the percentage=============>>
		for j=1:11
			accag(1,j) = (accag(1,j)/sizea)*100;%%1
			acca(1,j) = (acca(1,j)/sizea)*100;%%2
			accg(1,j) = (accg(1,j)/sizea)*100;%%3
			temptype = biggest([accag(1,j),acca(1,j),accg(1,j)]);
			if temptype==1
				if accag(1,j)>=high(1)
					high(1) = accag(1,j);
					high(2) = ti;
					high(3) = lam;
					high(4) = temptype;
					high(5) = j;
					higher=1;
					wrong = dif(0+j,:);
				endif
			elseif temptype==2
				if acca(1,j)>=high(1)
					high(1) = acca(1,j);
					high(2) = ti;
					high(3) = lam;
					high(4) = temptype;
					high(5) = j;
					higher=1;
					wrong = dif(11+j,:);
				endif
			elseif temptype==3
				if accg(1,j)>=high(1)
					high(1) = accg(1,j);
					high(2) = ti;
					high(3) = lam;
					high(4) = temptype;
					high(5) = j;
					higher=1;
					wrong = dif(22+j,:);
				endif
			endif

			if higher==1
				pr = [num2str(high(1)),"_",num2str(high(2)),"_",num2str(high(3)),"_",num2str(high(4)),"_",num2str(high(5)),"::"];
				disp(pr);
				higher=0;
			endif
				
		endfor

		total = [total,acca,accg,accag];

		if graph==1
			%%<<=========plot accuracy===================>>
			setenv GNUTERM qt

			figure((6*count)+1);
			clf();
			x = [1:11];
			y = accag;
			subplot(1,1,1);
			bar(x,y);
			xlabel('accel+gyro type');
			ylabel('accuracy');

			figure((6*count)+2);
			clf();
			x = [1:11];
			y = acca;
			subplot(1,1,1);
			bar(x,y);
			xlabel('accel type');
			ylabel('accuracy');

			figure((6*count)+3);
			clf();
			x = [1:11];
			y = accg;
			subplot(1,1,1);
			bar(x,y);
			xlabel('gyro type');
			ylabel('accuracy');

			figure((6*count)+4);
			clf();
			x = [1:77];
			y = siga';
			subplot(1,1,1);
			bar(x,y);
			xlabel('state(accelerometer)');
			ylabel('sigmoid_value');

			figure((6*count)+5);
			clf();
			x = [1:77];
			y = sigg';
			subplot(1,1,1);
			bar(x,y);
			xlabel('state(gyrometer)');
			ylabel('sigmoid_value');

			figure((6*count)+6);
			clf();
			x = [1:77];
			y = sigag';
			subplot(1,1,1);
			bar(x,y);
			xlabel('state(accelerometer+gyrometer)');
			ylabel('sigmoid_value');
		endif

		count++;
	endfor
endfor

csvwrite('total.txt',total);










