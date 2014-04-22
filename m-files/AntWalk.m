% Ant-agent


point = pos(1:2,Index);
p = phi(Index);


odd = rand(1);


if odd < turn_odd
    p = p + turn;
elseif odd < 2*turn_odd
    p = p - turn;
else
    %straight
end


% �ndert p (phi) falls n�tig
PheroDir;

% Definiert direction und �ndert p (phi)
direction = round([-sin(p * pi); cos(p * pi)]);

%Pheromonspur (w�hrend Suchvorgang):
Field_2(point(1),point(2)) = Field_2(point(1),point(2))+10;
%Test
%Field_1(point(1),point(2)) = 10;


% Index not out of bounds
if max(point + direction) < n && min(point + direction) > 1
    
    % Zuweisen der Koordinaten und des Winkels Phi
    pos(1:2,Index) = point + direction;
    
    
    %Field(point(1),point(2)) = Field(point(1),point(2)) + 2;
 
% X-Achsen-Spiegelung 
elseif point(2) + direction(2) < n && point(2) + direction(2) > 1
    
    p = mod(2 - p,2);
    
% Y-Achsen-Spiegelung    
else
    
    p = mod(1 - p,2);
end


if Field_0(pos(1,Index),pos(2,Index)) == 2
    carries_food(Index) = 1;
    phi(Index) = mod(p + 1,2);
else
    phi(Index) = p;
end


