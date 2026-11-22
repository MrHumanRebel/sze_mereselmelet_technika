function final_matrix = create_final_matrix(result_matrix)
    % Kinyerjük az első oszlopot
    first_column = result_matrix(:, 1);
    % Kinyerjük a második oszlopot
    second_column = result_matrix(:, 2);
    % Kinyerjük a harmadik oszlopot
    third_column = result_matrix(:, 3);
    
    % Létrehozzuk az új mátrixot
    final_matrix = zeros(size(result_matrix, 1), 3);
    for i = 1:size(result_matrix, 1)
        % Megkeressük a harmadik oszlop legnagyobb elemét
        max_value = max(third_column(first_column == first_column(i)));
        % Megkeressük a harmadik oszlop legnagyobb elemének indexét
        max_index = find(third_column == max_value & first_column == first_column(i), 1);
        % Beállítjuk az új mátrix értékeit
        final_matrix(i, :) = [first_column(i), second_column(max_index), max_value];
    end
end
