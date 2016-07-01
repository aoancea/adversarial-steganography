%           EXAMPLE - USING "WOW" embedding distortion
%
% -------------------------------------------------------------------------
% Copyright (c) 2012 DDE Lab, Binghamton University, NY.
% All Rights Reserved.
% -------------------------------------------------------------------------
% Permission to use, copy, modify, and distribute this software for
% educational, research and non-profit purposes, without fee, and without a
% written agreement is hereby granted, provided that this copyright notice
% appears in all copies. The program is supplied "as is," without any
% accompanying services from DDE Lab. DDE Lab does not warrant the
% operation of the program will be uninterrupted or error-free. The
% end-user understands that the program was developed for research purposes
% and is advised not to rely exclusively on the program for any reason. In
% no event shall Binghamton University or DDE Lab be liable to any party
% for direct, indirect, special, incidental, or consequential damages,
% including lost profits, arising out of the use of this software. DDE Lab
% disclaims any warranties, and has no obligations to provide maintenance,
% support, updates, enhancements or modifications.
% -------------------------------------------------------------------------
% Author: Vojtech Holub
% -------------------------------------------------------------------------
% Contact: vojtech_holub@yahoo.com
%          fridrich@binghamton.edu
%          http://dde.binghamton.edu
% -------------------------------------------------------------------------
clc; clear all;

pkg load image;

files = dir(fullfile('/', 'home', 'dvolkhonskiy', 'datasets', 'stego_celeb', 's_uniward_test', '*.png'));

% set payload
payload = 0.4;

% set params
params.p = -1;  % holder norm parameter

for file = files'

    fprintf(file.name)
    fprintf('\n')

    image = double(imread(fullfile('/', 'home', 'dvolkhonskiy', 'datasets', 'stego_celeb', 's_uniward_test', file.name)));

    fprintf('Embedding using matlab code\n');

    %% Run embedding simulation
    stego = S_UNIWARD(image(:, :, 1), payload);
    image(:, :, 1) = stego;

    %stego = S_UNIWARD(image(:, :, 2), payload);
    %image(:, :, 2) = stego;

    %stego = S_UNIWARD(image(:, :, 3), payload);
    %image(:, :, 3) = stego;


    imwrite(image, strcat('/home/dvolkhonskiy/datasets/stego_celeb/s_uniward_test/stego_', file.name), 'png')

    fprintf(' - DONE\n');
end

