function docount(datadir)
validateattributes(datadir, {'string','char'}, {'vector'})

%% load motion data
h5fn = [datadir, filesep, 'motion.h5'];

assert(exist(h5fn,'file')==2, [h5fn, ' does not exist'])
try
load(h5fn)  % creates variable "motion"
end

%% params

ilanes = [];
iLPF = [];
minv = 0;


%% main loop
Ncount = 0;
%tic
for i = 1:size(motion, 3)
  N = countcars(motion(:,:,i), ilanes, iLPF, minv);
  Ncount = Ncount + N;
  disp(Ncount)
end
%toc

end
