function N = countcars(mot, ilanes, iLPF, minv)

validateattributes(mot, {'numeric'}, {'real', '2d'})
validateattributes(ilanes, {'numeric'}, {'real', 'size', [NaN, 2]})
validateattributes(iLPF, {'numeric'}, {'real', 'numel', 2})
validateattributes(minv, {'numeric'}, {'real', 'scalar'})

Nlanes = size(ilanes(1));


N = 0;

for i = 1:Nlanes
  lane = sum(mot(ilanes(i,1):ilanes(i,2), :), 1);

  Flane = fftshift(abs(fft(lane)).^2);

  M = sum(Flane(iLPF(1):iLPF(2)));

  N = N + minv <= M;
end

end
