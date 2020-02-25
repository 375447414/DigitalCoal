%==========================================================================
%~~~~~~~~~~~~~~~~~~ooooo~~~~ooooo~~~~0~~~0~~~~ooooo~~~~~~~~~~~~~~~~~~~~~~~~
%~~~~~~~~~~~~~~~~~~~~0~~~~~~~~0~~~~~~0o~~0~~~~0~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%~~~~~~~~~~~~~~~~~~~~0~~~~~~~~0~~~~~~0~o~0~~~~0~oo0~~~~~~~~~~~~~~~~~~~~~~~~
%~~~~~~~~~~~~~~~~~~~~0~~~~~~~~0~~~~~~0~~o0~~~~0~~~0~~~~~~~~~~~~~~~~~~~~~~~~
%-----------------ooo0------oo0oo----0---0----0oooo------------------------
%==========================================================================

% This code can only apply for regular coal cleat network with T junction
% connectivity. To extract the geometrical statistics of coal, you
% basically need to follow following steps:

% 1. Skeletonise the cleat networ: since 3D skeletonisation is not
% accurate, this is performed slice by slice

% 2. Divide cleat network into face cleats and butt cleats:
% fracture_grouping_2d.m

% 3. Measure aperture: 
% aperture_measurement_vertical.m
% aperture_measurement_horizental.m

% 4. Meaure length and orientation of each cleat group 
% orientation_length.m

% Please note:
% [1] orientations here are not 3D orientation vectors as
% normally used. I measure the 2D orientation of fractures from top and
% side of the sample. Since they are the two parameters I use for my DFN
% modelling. While if you need a more common way, please refer to Matlab
% function 'regionprops', it is easy to obtain.
% [2] length and aperture are in the unit of number of voxels.

clear;
fname='Sample_image.tif';
%fname=fullfile(dname,file);
info = imfinfo(fname);
num_images = numel(info);
Orientation_face=[];
Orientation_butt=[];
Length_face=[];
Length_butt=[];
Aperture_face=[];
Aperture_butt=[];
for k=1:num_images
    BW_full = (imread(fname, k, 'Info', info));
    BW_full = ~logical(BW_full);   %make sure back is 0, objects are 1
    BW = bwmorph(BW_full,'skel',Inf);
    
    [face,butt]=fracture_grouping_2d(BW); 
    
    [o_f,l_f]=orientation_length(face);
    [o_b,l_b]=orientation_length(butt);
    
    Orientation_face=[Orientation_face;o_f];
    Orientation_butt=[Orientation_butt;o_b];

    Length_face=[Length_face;l_f];
    Length_butt=[Length_butt;l_b];
    
    a_f=aperture_measurement_vertical(face,BW_full);  
    a_b=aperture_measurement_horizental(butt,BW_full);  

    Aperture_face=[Aperture_face;a_f];
    Aperture_butt=[Aperture_butt;a_b];

end