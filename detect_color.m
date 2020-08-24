function color = detect_color(CARD)
% CARD: RGB image of the card (uint8 type)

rg_diff = CARD(:,:,1) - CARD(:,:,2);
diff_mean = mean(rg_diff(:));
if diff_mean > 4
    color = 'R';
else 
    color = 'B';
end



% color: char type, possible values:
%         'R' for red
%         'B' for black

end