function docount(datadir)
%% load motion data
h5fn = [datadir, filesep, 'motion.h5'];
try
load(h5fn)  % creates variable "motion"
end_try_catch

%% main loop
Ncount = 0;
for i = 1:size(motion, 3)
  N = countcars(motion(:,:,i));
  Ncount = Ncount + N;
  disp(Ncount)
endfor


endfunction
