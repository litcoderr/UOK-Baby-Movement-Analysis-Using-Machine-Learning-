function [thetares] = learning(still,stilltime,stillres,walk,walktime,walkres,runn,runtime,runres,fall,falltime,fallres,ss,sstime,ssres,slide,slidetime,slideres,swing,swingtime,swingres,lambda)
	thetares = [];
	Xa = [];
	Xb = [];
	Xc = [];
	Xd = [];
	Xe = [];
	Xf = [];
	Xg = [];
	[ma,na] = size(still);
	[mb,nb] = size(walk);
	[mc,nc] = size(runn);
	[md,nd] = size(fall);
	[me,nne] = size(ss);
	[mf,nf] = size(slide);
	[mg,ng] = size(swing);
	Xa = [still;walk;runn;fall;ss;slide;swing];
	Xb = [walk;still;runn;fall;ss;slide;swing];
	Xc = [runn;still;walk;fall;ss;slide;swing];
	Xd = [fall;still;walk;runn;ss;slide;swing];
	Xe = [ss;still;walk;runn;fall;slide;swing];
	Xf = [slide;still;walk;runn;fall;ss;swing];
	Xg = [swing;still;walk;runn;fall;ss;slide];
	Ya = [ones(ma,1);zeros(mb+mc+md+me+mf+mg,1)];
	Yb = [ones(mb,1);zeros(ma+mc+md+me+mf+mg,1)];
	Yc = [ones(mc,1);zeros(mb+ma+md+me+mf+mg,1)];
	Yd = [ones(md,1);zeros(mb+mc+ma+me+mf+mg,1)];
	Ye = [ones(me,1);zeros(mb+mc+md+ma+mf+mg,1)];
	Yf = [ones(mf,1);zeros(mb+mc+md+me+ma+mg,1)];
	Yg = [ones(mg,1);zeros(mb+mc+md+me+mf+ma,1)];
	lamda = lambda;

	[m,n]=size(Xa);
	Xa = [ones(m,1) Xa];
	initial_theta = zeros(n+1,1);
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	[theta, cost] = ...
	fminunc(@(t)(costFunctionReg(t, Xa, Ya,lamda)), initial_theta, options);
	thetares = [thetares;theta'];

	biggest = n;

	[m,n]=size(Xb);
	Xb = [ones(m,1) Xb];
	initial_theta = zeros(n+1,1);
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	[theta, cost] = ...
	fminunc(@(t)(costFunctionReg(t, Xb, Yb, lamda)), initial_theta, options);
	thetares = [thetares;theta'];

	[m,n]=size(Xc);
	Xc = [ones(m,1) Xc];
	initial_theta = zeros(n+1,1);
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	[theta, cost] = ...
	fminunc(@(t)(costFunctionReg(t, Xc, Yc, lamda)), initial_theta, options);
	thetares = [thetares;theta'];

	[m,n]=size(Xd);
	Xd = [ones(m,1) Xd];
	initial_theta = zeros(n+1,1);
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	[theta, cost] = ...
	fminunc(@(t)(costFunctionReg(t, Xd, Yd, lamda)), initial_theta, options);
	thetares = [thetares;theta'];

	[m,n]=size(Xe);
	Xe = [ones(m,1) Xe];
	initial_theta = zeros(n+1,1);
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	[theta, cost] = ...
	fminunc(@(t)(costFunctionReg(t, Xe, Ye, lamda)), initial_theta, options);
	thetares = [thetares;theta'];

	[m,n]=size(Xf);
	Xf = [ones(m,1) Xf];
	initial_theta = zeros(n+1,1);
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	[theta, cost] = ...
	fminunc(@(t)(costFunctionReg(t, Xf, Yf, lamda)), initial_theta, options);
	thetares = [thetares;theta'];

	[m,n]=size(Xg);
	Xg = [ones(m,1) Xg];
	initial_theta = zeros(n+1,1);
	options = optimset('GradObj', 'on', 'MaxIter', 400);
	[theta, cost] = ...
	fminunc(@(t)(costFunctionReg(t, Xg, Yg, lamda)), initial_theta, options);
	thetares = [thetares;theta'];

	i=1;
	starta=[1,1,1,1,1,1,1];
	for i=1:10
		still = stilltime(starta(1,1):starta(1,1)+stillres(i,1)-1,1:stillres(1,2));
		walk = walktime(starta(1,2):starta(1,2)+walkres(i,1)-1,1:walkres(1,2));
		runn = runtime(starta(1,3):starta(1,3)+runres(i,1)-1,1:runres(1,2));
		fall = falltime(starta(1,4):starta(1,4)+fallres(i,1)-1,1:fallres(1,2));
		ss = sstime(starta(1,5):starta(1,5)+ssres(i,1)-1,1:ssres(1,2));
		slide = slidetime(starta(1,6):starta(1,6)+slideres(i,1)-1,1:slideres(1,2));
		swing = swingtime(starta(1,7):starta(1,7)+swingres(i,1)-1,1:swingres(1,2));
		Xa = [];
		Xb = [];
		Xc = [];
		Xd = [];
		Xe = [];
		Xf = [];
		Xg = [];
		[ma,na] = size(still);
		[mb,nb] = size(walk);
		[mc,nc] = size(runn);
		[md,nd] = size(fall);
		[me,nne] = size(ss);
		[mf,nf] = size(slide);
		[mg,ng] = size(swing);
		Xa = [still;walk;runn;fall;ss;slide;swing];
		Xb = [walk;still;runn;fall;ss;slide;swing];
		Xc = [runn;still;walk;fall;ss;slide;swing];
		Xd = [fall;still;walk;runn;ss;slide;swing];
		Xe = [ss;still;walk;runn;fall;slide;swing];
		Xf = [slide;still;walk;runn;fall;ss;swing];
		Xg = [swing;still;walk;runn;fall;ss;slide];
		Ya = [ones(ma,1);zeros(mb+mc+md+me+mf+mg,1)];
		Yb = [ones(mb,1);zeros(ma+mc+md+me+mf+mg,1)];
		Yc = [ones(mc,1);zeros(mb+ma+md+me+mf+mg,1)];
		Yd = [ones(md,1);zeros(mb+mc+ma+me+mf+mg,1)];
		Ye = [ones(me,1);zeros(mb+mc+md+ma+mf+mg,1)];
		Yf = [ones(mf,1);zeros(mb+mc+md+me+ma+mg,1)];
		Yg = [ones(mg,1);zeros(mb+mc+md+me+mf+ma,1)];

		[m,n]=size(Xa);
		Xa = [ones(m,1) Xa];
		initial_theta = zeros(n+1,1);
		options = optimset('GradObj', 'on', 'MaxIter', 400);
		[theta, cost] = ...
		fminunc(@(t)(costFunctionReg(t, Xa, Ya, lamda)), initial_theta, options);
		thetares = [thetares;theta',zeros(1,biggest-n)];

		[m,n]=size(Xb);
		Xb = [ones(m,1) Xb];
		initial_theta = zeros(n+1,1);
		options = optimset('GradObj', 'on', 'MaxIter', 400);
		[theta, cost] = ...
		fminunc(@(t)(costFunctionReg(t, Xb, Yb, lamda)), initial_theta, options);
		thetares = [thetares;theta',zeros(1,biggest-n)];

		[m,n]=size(Xc);
		Xc = [ones(m,1) Xc];
		initial_theta = zeros(n+1,1);
		options = optimset('GradObj', 'on', 'MaxIter', 400);
		[theta, cost] = ...
		fminunc(@(t)(costFunctionReg(t, Xc, Yc, lamda)), initial_theta, options);
		thetares = [thetares;theta',zeros(1,biggest-n)];

		[m,n]=size(Xd);
		Xd = [ones(m,1) Xd];
		initial_theta = zeros(n+1,1);
		options = optimset('GradObj', 'on', 'MaxIter', 400);
		[theta, cost] = ...
		fminunc(@(t)(costFunctionReg(t, Xd, Yd, lamda)), initial_theta, options);
		thetares = [thetares;theta',zeros(1,biggest-n)];

		[m,n]=size(Xe);
		Xe = [ones(m,1) Xe];
		initial_theta = zeros(n+1,1);
		options = optimset('GradObj', 'on', 'MaxIter', 400);
		[theta, cost] = ...
		fminunc(@(t)(costFunctionReg(t, Xe, Ye, lamda)), initial_theta, options);
		thetares = [thetares;theta',zeros(1,biggest-n)];

		[m,n]=size(Xf);
		Xf = [ones(m,1) Xf];
		initial_theta = zeros(n+1,1);
		options = optimset('GradObj', 'on', 'MaxIter', 400);
		[theta, cost] = ...
		fminunc(@(t)(costFunctionReg(t, Xf, Yf, lamda)), initial_theta, options);
		thetares = [thetares;theta',zeros(1,biggest-n)];

		[m,n]=size(Xg);
		Xg = [ones(m,1) Xg];
		initial_theta = zeros(n+1,1);
		options = optimset('GradObj', 'on', 'MaxIter', 400);
		[theta, cost] = ...
		fminunc(@(t)(costFunctionReg(t, Xg, Yg, lamda)), initial_theta, options);
		thetares = [thetares;theta',zeros(1,biggest-n)];

		starta(1,1) = starta(1,1)+stillres(i,1);
		starta(1,2) = starta(1,2)+walkres(i,1);
		starta(1,3) = starta(1,3)+runres(i,1);
		starta(1,4) = starta(1,4)+fallres(i,1);
		starta(1,5) = starta(1,5)+ssres(i,1);
		starta(1,6) = starta(1,6)+slideres(i,1);
		starta(1,7) = starta(1,7)+swingres(i,1);

	endfor

end





