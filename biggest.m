function [id]=biggest(mat)
	i=0;
	idx=1;
	big=mat(1,1);
	[a,j] = size(mat);
	for i=1:j
		if mat(1,i)>big
			big = mat(1,i);
			idx = i;
		endif
	endfor
	id = idx;
end