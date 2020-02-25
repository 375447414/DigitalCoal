function aperture=aperture_measurement_horizental(V1,V2)
%V1: skeleton 0 is background
%V2: full 0 is background
a=5;
aperture=zeros(100,1);
n=0;
%for k=1:50:num_images
    %BW_family = logical(V1(:,:,k));    %~logical((imread(fname1, k, 'Info', info)));
    %BW_full = logical(V2(:,:,k));      %~logical((imread(fname2, k, 'Info', info)));
    BW_family = logical(V1);    %~logical((imread(fname1, k, 'Info', info)));
    BW_full = logical(V2);      %~logical((imread(fname2, k, 'Info', info)));
    BW=BW_family+BW_full;
    clear BW_family;
    clear BW_full;
    [x,y]=find(BW==2);
    zeronr=size(x,1);
    for i=1:zeronr
        n=n+1;
        try
        aperture(n)=numel(find(BW(x(i)-a:x(i)+a,y(i))));   %cleat is horizental
        
        end
    end
%end