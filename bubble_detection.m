
clc;
clear;

folder_dir=dir('blade3/');
Number_images=length(folder_dir)-2;
folder_save = 'newblade3/';

for k=1:Number_images
    name_of_image = folder_dir(k+2).name;
    image=imread(['blade3/' name_of_image]);
    grey_image = rgb2gray(image);

    [r,c] = size(grey_image);

    bubble = 0;
    new_c = c-350;
    for i=(1+200):(r-90)
        for j=1:new_c
            pixel = grey_image(i,j);
            if(pixel >18)
                image(i,j,:) = [255,0,0];
                bubble = bubble + 1;
            end
        end
    end

    percent = bubble/((r-290)*new_c);
    position = [0 0];
      
%     image = insertText(image,position,percent,'FontSize',18,'BoxColor',...
%     'yellow','BoxOpacity',0.4,'TextColor','white');

    imwrite(image,[folder_save,name_of_image]);
end






