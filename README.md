

for k=1:size(mat,3)
    poro=sum(sum(mat(:,:,k)));
    %mat(:,:,k)=imresize(matt(:,:,k),3);
    mat_deflation(:,:,k)=double(mat(:,:,k));
    if poro~=0
        for i=1:steps
            boundary=bwmorph(mat(:,:,k),'remove');
            layer_deflation=mat_deflation(:,:,k);
            layer_deflation(boundary)=i+1;
            mat_deflation(:,:,k)=layer_deflation;
            layer=mat(:,:,k);
            layer(boundary)=0;
            mat(:,:,k)=layer;
            
        end
    else
        
    end
end
