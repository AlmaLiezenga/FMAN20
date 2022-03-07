%some code to display several example images 
%display(image(projection(stacks{1}(:,:,1), bases{1}))); %111
%display(image(projection(stacks{1}(:,:,1), bases{2}))); %112
%display(image(projection(stacks{1}(:,:,1), bases{3}))); %113
%display(image(projection(stacks{1}(:,:,2), bases{1}))); %121
%display(image(projection(stacks{1}(:,:,2), bases{2}))); %122
%display(image(projection(stacks{1}(:,:,2), bases{3}))); %123

%display(image(projection(stacks{2}(:,:,1), bases{1}))); %211
%display(image(projection(stacks{2}(:,:,1), bases{2}))); %212
%display(image(projection(stacks{2}(:,:,1), bases{3}))); %213
%display(image(projection(stacks{2}(:,:,2), bases{1}))); %221
%display(image(projection(stacks{2}(:,:,2), bases{2}))); %222
display(image(projection(stacks{2}(:,:,2), bases{3}))); %223

%some code to display the basis elements 
%display(imagesc(bases{1}(:,:,1))); %b11
%display(imagesc(bases{1}(:,:,2))); %b12
%display(imagesc(bases{1}(:,:,3))); %b13
%display(imagesc(bases{1}(:,:,4))); %b14

%display(imagesc(bases{2}(:,:,1))); %b21
%display(imagesc(bases{2}(:,:,2))); %b22
%display(imagesc(bases{2}(:,:,3))); %b23
%display(imagesc(bases{2}(:,:,4))); %b24

%display(imagesc(bases{3}(:,:,1))); %b31
%display(imagesc(bases{3}(:,:,2))); %b32
%display(imagesc(bases{3}(:,:,3))); %b33
%display(imagesc(bases{3}(:,:,4))); %b34

%display(image(projection(stacks{2}(:,:,200), bases{1}))); %211
