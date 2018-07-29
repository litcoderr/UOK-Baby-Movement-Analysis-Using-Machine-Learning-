function [resmat,sza,szb]=iteration_sec(idx,dim,mat,typ,id)
	resmat = [];
	col = 1;
	check=0;
	temp = [];
	sza=0;
	szb=0;
	i=1;
	if(typ==1)
		interval = 3+3*idx;
	else
		interval = 6+6*idx;
	endif
	for col=1:dim
		while(check==0)
			if(typ==1)
				temp = [temp,mat(col,i),mat(col,i+1),mat(col,i+2)];
				i = i+interval;
			elseif(typ==2)
				temp = [temp,mat(col,i),mat(col,i+1),mat(col,i+2),mat(col,i+3),mat(col,i+4),mat(col,i+5)];
				i = i+interval;
			endif
			if(typ==1)
				if(i>(1200-(300*id))/2||rem(i,interval)!=1)
					check=1;
				endif
			elseif(typ==2)
				if(i>(1200-(300*id))||rem(i,interval)!=1)
					check=1;
				endif
			endif
		endwhile
		resmat = [resmat;temp];
		check=0;
		temp = [];
		i = 1;
	endfor
	[sza,szb] = size(resmat);
end