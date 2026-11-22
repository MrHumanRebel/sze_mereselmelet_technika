

function result_matrix = process_matrix(input_matrix)
    % Kinyerjük az első két oszlopot
    pairs = input_matrix(:, 1:2);
    % Kinyerjük a harmadik oszlopot
    values = input_matrix(:, 3);
    
    % Kiszámítjuk az ismétlődő számpárok mediánját
    unique_pairs = unique(pairs, 'rows');
    median_values = zeros(size(unique_pairs, 1), 1);
    for i = 1:size(unique_pairs, 1)
        median_values(i) = median(values(pairs(:, 1) == unique_pairs(i, 1) & pairs(:, 2) == unique_pairs(i, 2)));
    end
    
    % Létrehozzuk az új mátrixot
    result_matrix = [unique_pairs, median_values];
end
