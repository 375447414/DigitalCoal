function [O,L]=orientation_length(binary)
L=[];
O=[];
%BINARY=[];
for k=1:size(binary,3)
    BW = binary(:,:,k);
    BW = logical(BW);              %conhorizing unit8 to logical
   % area=(cell2mat(struct2cell(regionprops(BW,'Area'))))';
    %if size(BW(find(BW==1)),1)>0
    orientation=(cell2mat(struct2cell(regionprops(BW,'Orientation'))))';
    length = (cell2mat(struct2cell(regionprops(BW,'Area'))))';
    %center = (cell2mat(struct2cell(regionprops(BW,'Centroid'))))';
    L=[L;length];
    O=[O;orientation];
    %SP=[SP;center];
    %else
    %end
end

