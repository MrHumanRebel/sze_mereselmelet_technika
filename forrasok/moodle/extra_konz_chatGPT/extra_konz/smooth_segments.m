
function output_matrix = smooth_segments(input_matrix)
    % Kimeneti mátrix inicializálása
    output_matrix = input_matrix;

    % Egyedi értékek az els? oszlopból
    unique_first_col = unique(input_matrix(:, 1));

    % Ablak szélessége a mozgóátlaghoz
    window_size = 3;

    % Számoljuk a mozgóátlagot szakaszosan az els? oszlop azonos értékei mentén
    for i = 1:length(unique_first_col)
        % Aktuális szakasz indexei
        idx = input_matrix(:, 1) == unique_first_col(i);

        % Aktuális szakasz
        segment = input_matrix(idx, :);

        % Mozgóátlag számítása az utolsó oszlopra a smooth függvénnyel
        smoothed_values = smooth(segment(:, 3), window_size);

        % Cseréljük az eredeti mátrix utolsó oszlopának értékeit a simított értékekre
        output_matrix(idx, 3) = smoothed_values;
    end
end
