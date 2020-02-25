function [H,V]=fracture_grouping_2d(bin) 

dim_x=size(bin,2)+2;
dim_y=size(bin,1)+2;
binary=zeros(dim_y,dim_x);
binary(2:end-1,2:end-1)=bin;
H=binary;
V=binary;
%binary=[zeros(dim_y,1),[zeros(1,dim_x);binary;zeros(1,dim_x)],zeros(dim_y,1)];    
[x,y]=find(binary==1);
zeronr=size(x,1);
for i=1:zeronr
    if (binary(x(i),y(i)-1)==0 && binary(x(i),y(i)+1)==0)   %remove vertical ones
        
        H(x(i)-1:x(i)+1,y(i)-1:y(i)+1)=zeros(3,3);
    else if (binary(x(i)-1,y(i))==0 && binary(x(i)+1,y(i))==0)
            V(x(i)-1:x(i)+1,y(i)-1:y(i)+1)=zeros(3,3);
        end
    end
end
    H=H(2:end-1,2:end-1);
    V=V(2:end-1,2:end-1);
end