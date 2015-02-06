function output_image = histogram_equalization(input_image)

% input_image : The given grayscale input image
% output_image : The grayscale input image after histogram equalization
    
        % Initialization 
    num_of_pixels = size(input_image, 1) * size(input_image, 2);
    output_image = uint8(zeros(size(input_image, 1), size(input_image, 2)));
    pixel_freq = zeros(256, 1);                  % COUNTS THE OCCURENCE OF EACH PIXEL
    probability_f = zeros(256, 1);               % PROBABILITY OF EACH OCCURENCE IS CALCULATED
    probability_c = zeros(256, 1);
    Cumul_dist = zeros(256, 1);
    output = zeros(256, 1);
    sum = 0;    num_ele = 255;
        % CALCULATION THE PROBABILITY OF EACH OCCURRENCE 
    for i = 1:size(input_image, 1)
        for j = 1:size(input_image, 2)
            value = input_image(i, j);
            pixel_freq(value + 1) = pixel_freq(value + 1) + 1;
        end
    end
        probability_f(value + 1) = pixel_freq(value + 1)/num_of_pixels;        
        % CALCUALTION OF THE CUMULATIVE DISTRIBUTION
    for i = 1:size(probability_f)
       sum = sum + pixel_freq(i);
       Cumul_dist(i) = sum;
       probability_c(i) = Cumul_dist(i)/num_of_pixels;
       output(i) = round(probability_c(i) * num_ele);
    end
    for i = 1:size(input_image, 1)
        for j = 1:size(input_image, 2)
         output_image(i, j) = output(input_image(i, j) + 1);
        end
    end
end