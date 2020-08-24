function CROP = apply_mask_and_crop(IMG, MASK, center)
%    IMG: RGB image in uint8 format (from 0 to 255) 
%   MASK: logical array (only zeros and ones).
%          0 if not card,
%          1 if card
% center: 2-element vector, coordinate of the center of mass
%          center(1) is the horizontal coordinate
%          center(2) is the vertical coordinate
%
% CROP: RGB image in uint8 format (from 0 to 255) showing the cropped card

    WHT = uint8(ones(size(IMG))*255);
    IMG_masked = IMG.*uint8(MASK);
    WHT_masked = WHT.*uint8(~MASK);
    Masked = WHT_masked + IMG_masked;
   
    
    
    card_size = [420, 280]; % [height, width]
    
    center(1) = center(1)-card_size(2)/2;
    center(2) = center(2)-card_size(1)/2;

    rect = [center(1),center(2),card_size(2),card_size(1)];
    CROP = imcrop(Masked, rect);
    
    
    
    
end