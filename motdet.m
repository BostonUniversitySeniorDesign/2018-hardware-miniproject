% Using GNU Octave to process PiCamera data using motdet.py

function motdet(datadir, duration)
% inputs
% ------
% datadir: directory to use for data storage
% duration: (seconds) to measure motion

validateattributes(datadir, {'string','char'}, {'vector'})
validateattributes(duration, {'numeric'}, {'real','nonnegative', 'scalar'})

cmd = ["python3 motdet.py ",datadir, " ", num2str(duration)];

[serr, sout] = system(cmd); 

disp(sout)

end