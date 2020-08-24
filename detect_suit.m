function suit = detect_suit(CARD)
% CARD: RGB image of the card (uint8 type)
%
% cuit: char type, possible values:
%         'C' for clubs (â™?)
%         'D' for diamonds (â™?)
%         'H' for hearts (â™?)
%         'S' for spades (â™?)

suits = load('input/suits.mat');
inverted_card = 255-rgb2gray(CARD);

inverted_card = inverted_card> 10;

color = detect_color(CARD);

if color == 'R'
    hearts_card = conv2(inverted_card,suits.hearts);
    diamonds_card = conv2(inverted_card,suits.diamonds);

    [h_max,~] = max(hearts_card(:));
    [d_max,~] = max(diamonds_card(:));
    if h_max > d_max
        suit = 'H';
    else
        suit = 'D';
    end
    
elseif color == 'B'
    spades_card = conv2(inverted_card,suits.spades);  
    clubs_card = conv2(inverted_card,suits.clubs);
      
    [s_max,~] = max(spades_card(:));
    [c_max,~] = max(clubs_card(:));
    %[~,max_index] = max([h_max,d_max,s_max,c_max]);
    if s_max > c_max
        suit = 'S';
    else 
        suit = 'C';
    end
end


%suit_array = ['H','D','S','C'];
%suit = suit_array(max_index);
   
    
end