classdef preprocessing
    methods(Static)
        % Erosion Trial
        function img_erosion = erosion(img) 
            if size(img,3)==3
                img = rgb2gray(img);
            end
            se = strel('square',3);
            img_erosion = imerode(img, se);
            img_erosion = imerode(img_erosion, se);
            img_erosion = imerode(img_erosion, se);
        end

        % Canny Edge Detection
        function img_edge_det = canny_edge_detection(img) 
            if size(img,3)==3
                img = rgb2gray(img);
            end
            img_edge_det = edge(img, 'Canny');
        end

        % Sobel Edge Detection
        function img_edge_det = sobel_edge_detection(img) 
            if size(img,3)==3
                img = rgb2gray(img);
            end
            img_edge_det = edge(img, 'Sobel');
        end
    
        % Skeletonisation
        function img_skel = skeletonisation(img)
            if size(img, 3)
                img = im2gray(img);
            end
            skel_BW = imbinarize(img, 0.4);
            img_skel = bwmorph(skel_BW,'thin',Inf);
        end
        
        % Binarize
        function img_bin = binarize(img)
            if size(img, 3)
                img = rgb2gray(img);
            end
            level = graythresh(img);
            img_bin = imbinarize(gray,level);
        end
        
        %Illumination
        function img_illum = illumination(img)
            %Used to easily Analyze Foreground Objects
            img_illum = imtophat(img,strel('disk',15))
        end

        %Sharpin
        function img_sharp = sharpen(img)
            img_sharp = imsharpen(img,'Radius',2,'Amount',1);
        end
        
        
    end
end