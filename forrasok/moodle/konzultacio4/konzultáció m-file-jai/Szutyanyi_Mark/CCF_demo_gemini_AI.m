% =========================================================================
% INTERAKTÍV KERESZTKORRELÁCIÓ VIZUALIZÁCIÓ (Oktató Script)
% Generálta: Gemini AI
% Promptolta: Szutyányi Márk
% Dátum: 2025. november 22.
%
% Funkciók:
%   1. Két jel (X és Y) létrehozása és ábrázolása.
%   2. A keresztkorreláció (csúszó szorzatösszeg) animált kiszámítása.
%   3. Teljes képernyős megjelenítés 3 részablakban.
%   4. SPACE billentyűre PAUSE (megállás) és RÉSZLETES NÉZET.
% =========================================================================

clear;          % Törli a változókat a memóriából
clc;            % Törli a parancsablakot (Command Window)
close all;      % Bezár minden nyitott ábrát

%% 1. JELEK GENERÁLÁSA
% -------------------------------------------------------------------------
% Létrehozunk két diszkrét idejű jelet, amelyek Gauss-görbékből (csúcsokból) állnak.

N = 25;         % A jelek hossza (mintapontok száma)
t = 0:N-1;      % Időtengely vektor (0-tól 24-ig)

% --- 'x' jel (Kék, fixen álló jel) ---
x = zeros(1, N);                    % Üres vektor inicializálása
% Hozzáadunk egy nagyobb csúcsot az 5. pozíciónál:
x = x + 1.5 * exp(-(t-5).^2 / 2);   
% Hozzáadunk egy kisebb csúcsot a 15. pozíciónál:
x = x + 1.0 * exp(-(t-15).^2 / 3);  

% --- 'y' jel (Piros, ezt fogjuk tologatni) ---
y = zeros(1, N);
% Hasonló csúcsok, de máshol (8. és 18. pozíció), hogy legyen mit illeszteni:
y = y + 1.2 * exp(-(t-8).^2 / 2);
y = y + 0.8 * exp(-(t-18).^2 / 3);

% --- Előzetes számítás a grafikon skálázásához ---
% Kiszámoljuk előre a maximumot, hogy a grafikon Y-tengelye ne ugráljon.
[r_ref, ~] = xcorr(x, y);           % A MATLAB beépített függvénye referenciának
max_val = max(r_ref) * 1.1;         % A maximum érték + 10% ráhagyás

%% 2. GRAFIKA ÉS INTERAKTIVITÁS ELŐKÉSZÍTÉSE
% -------------------------------------------------------------------------

% Létrehozzuk az ablakot teljes képernyős módban:
fig = figure('Name', 'Interaktív Keresztkorreláció (Nyomj SPACE-t!)', ...
             'Color', 'white', ...              % Fehér háttér
             'Units', 'normalized', ...         % Normalizált egységek (0-1)
             'OuterPosition', [0 0 1 1]);       % Teljes képernyő kitöltése

% Beállítunk egy változót az ablakon belül, ami jelzi, hogy áll-e az animáció:
setappdata(fig, 'isPaused', false); 

% Megadjuk, melyik függvény fusson le billentyűnyomáskor (@keyPressCallback):
set(fig, 'WindowKeyPressFcn', @keyPressCallback);

% Létrehozzuk az "eltolás" (lag) vektort: -24-től +24-ig
lags = -(N-1):(N-1);

% Létrehozunk egy üres tömböt az eredmények tárolására (NaN = még nincs adat):
corr_values = nan(size(lags)); 

disp('A szimuláció elindult. Nyomj SPACE-t a megállításhoz!');

%% 3. FŐ ANIMÁCIÓS CIKLUS
% -------------------------------------------------------------------------
% Végigmegyünk minden lehetséges eltoláson (lag).

for k = 1:length(lags)
    % Ellenőrizzük, hogy a felhasználó bezárta-e az ablakot. Ha igen, kilépünk.
    if ~isvalid(fig), break; end
    
    current_lag = lags(k);  % Az aktuális eltolás mértéke
    
    % --- Az Y jel eltolása (Shift) ---
    % Mivel a MATLAB tömbindexelés nem tud negatív lenni, manuálisan toljuk el nullákkal.
    if current_lag < 0
        % Ha negatív (balra) tolás: Levágjuk az elejét, nullákat fűzünk a végére
        shift = abs(current_lag);
        y_shifted = [y(shift+1:end), zeros(1, shift)];
    elseif current_lag > 0
        % Ha pozitív (jobbra) tolás: Nullákat fűzünk az elejére, levágjuk a végét
        shift = current_lag;
        y_shifted = [zeros(1, shift), y(1:end-shift)];
    else
        % Ha nincs eltolás (0)
        y_shifted = y;
    end
    
    % --- MATEMATIKAI SZÁMÍTÁS (A lényeg!) ---
    % 1. Összeszorozzuk a két jelet elemenként (pontról pontra):
    product_vector = x .* y_shifted;
    
    % 2. Összeadjuk a szorzatokat (ez az integrál diszkrét megfelelője):
    current_sum = sum(product_vector);
    
    % 3. Eltároljuk az eredményt a grafikonhoz:
    corr_values(k) = current_sum;
    
    % ================= GRAFIKA KIRAJZOLÁSA (3 Részablak) =================
    
    % --- 1. PLOT (FELSŐ): Eredeti jelek (Referencia) ---
    subplot(3, 1, 1); hold off;     % Töröljük az előző rajzot
    stem(t, x, 'b', 'LineWidth', 1.5); hold on; % X jel kékkel
    stem(t, y, 'r', 'LineWidth', 1.5);          % Y jel pirossal
    grid on; 
    legend('X jel', 'Y jel', 'Location', 'northeast');
    title('1. Eredeti jelek (Statikus nézet)', 'FontSize', 12);
    xlim([0 N-1]); ylim([0 2]);     % Fix tengelyhatárok
    
    % --- 2. PLOT (KÖZÉPSŐ): Az animáció (Átfedés vizsgálata) ---
    subplot(3, 1, 2); hold off;
    
    % Kirajzoljuk a fix X jelet:
    stem(t, x, 'filled', 'b', 'LineWidth', 1.5, 'DisplayName', 'X jel (Fix)'); 
    hold on;
    
    % Kirajzoljuk a mozgó Y jelet (dinamikus felirattal):
    y_label = ['Y jel (Eltolás: ' num2str(current_lag) ')'];
    stem(t, y_shifted, 'r', 'LineWidth', 1.5, 'MarkerFaceColor', 'r', 'DisplayName', y_label);
    
    % Kirajzoljuk a SZORZATOT (Zöld színnel), ahol van átfedés:
    idx_active = find(product_vector > 0.01); % Megkeressük a nem nulla elemeket
    if ~isempty(idx_active)
        % Zöld oszlopok a szorzathoz:
        stem(t(idx_active), product_vector(idx_active), 'g', 'LineWidth', 3, ...
            'Marker', 'none', 'DisplayName', 'Szorzat (Átfedés)');
        
        % Zöld árnyékolás a jobb láthatóságért (nem kerül a legendába):
        area(t, product_vector, 'FaceColor', 'g', 'FaceAlpha', 0.3, ...
            'EdgeColor', 'none', 'HandleVisibility', 'off');
    end
    
    grid on;
    legend('Location', 'northeast'); % Jelmagyarázat bekapcsolása
    
    % A címben mutatjuk az aktuális eltolást és az összeget:
    title({['2. Átfedés (Lag: ' num2str(current_lag) ')'], ...
           ['Számolás: \Sigma = ' num2str(current_sum, '%.2f')]}, ...
           'FontSize', 12, 'FontWeight', 'bold');
    ylabel('Amplitúdó'); xlim([0 N-1]); ylim([0 2]);
    
    % --- 3. PLOT (ALSÓ): A végeredmény (Keresztkorrelációs függvény) ---
    subplot(3, 1, 3); hold off;
    
    % Kirajzoljuk az eddigi görbét vonallal és pontokkal:
    plot(lags, corr_values, 'k-', 'LineWidth', 1); hold on;
    stem(lags, corr_values, 'filled', 'k', 'MarkerSize', 4);
    
    % Kiemeljük az éppen aktuális pontot egy nagy piros pöttyel:
    plot(current_lag, current_sum, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    
    grid on;
    title('3. Eredmény: Keresztkorrelációs függvény', 'FontSize', 12);
    xlabel('Eltolás (Lag)'); 
    ylabel('Korreláció Értéke');
    xlim([min(lags) max(lags)]); 
    ylim([-1 max_val]); % Fix Y skála, hogy ne ugráljon
    
    drawnow; % Kényszerítjük a MATLAB-ot, hogy frissítse a képernyőt most
    
    % ================= MEGÁLLÍTÁS LOGIKA (PAUSE MODE) =================
    % Ha a felhasználó megnyomta a SPACE-t, az 'isPaused' változó igaz lesz.
    
    if getappdata(fig, 'isPaused')
        
        % 1. Jelezzük a címen, hogy megálltunk:
        subplot(3, 1, 2);
        title('!!! MEGÁLLÍTVA - RÉSZLETEK A FELSŐ ÁBRÁN !!!', 'Color', 'r', 'FontSize', 14);
        
        % 2. Kiírjuk a konkrét számokat a zöld oszlopok tetejére:
        text_handles = []; % Ebben tároljuk a feliratokat, hogy később törölhessük
        if ~isempty(idx_active)
            for i = idx_active
                val = product_vector(i);
                % Szöveg elhelyezése az oszlop felett:
                th = text(t(i), val + 0.1, num2str(val, '%.2f'), ...
                    'Color', 'k', 'FontWeight', 'bold', 'FontSize', 10, ...
                    'HorizontalAlignment', 'center', 'BackgroundColor', 'w', 'EdgeColor', 'g');
                text_handles = [text_handles, th]; %#ok<AGROW>
            end
        end
        
        % 3. Összeállítjuk a részletes szöveges leírást (Szorzások listája):
        equation_str = {'RÉSZLETES SZÁMÍTÁS:'};
        equation_str{end+1} = '-------------------';
        sum_check = 0;
        
        for i = idx_active
            prod_val = product_vector(i);
            sum_check = sum_check + prod_val;
            % Egy sor formátuma: "t=5: 1.20 * 0.80 = 0.96"
            line_str = sprintf('t=%d:  %.2f * %.2f  =  %.2f', t(i), x(i), y_shifted(i), prod_val);
            equation_str{end+1} = line_str; %#ok<AGROW>
        end
        
        equation_str{end+1} = '-------------------';
        equation_str{end+1} = sprintf('ÖSSZEG (Szumma):  %.4f', sum_check);
        
        % 4. Megjelenítjük a szövegdobozt a legfelső plot helyén (takarásban):
        % Pozíció: [bal, alsó, szélesség, magasság] -> 0.62 az alsó koordináta, így fentre kerül
        annot = annotation('textbox', [0.15, 0.62, 0.4, 0.35], 'String', equation_str, ...
            'FitBoxToText', 'on', 'BackgroundColor', [1 1 0.9], ...
            'FontName', 'Courier', 'EdgeColor', 'k', 'LineWidth', 1);
        
        % 5. VÁRAKOZÓ CIKLUS: Itt ragadunk, amíg újra nem nyomják a SPACE-t
        while getappdata(fig, 'isPaused') && isvalid(fig)
            pause(0.1); % Kis várakozás, hogy ne terheljük a processzort
            drawnow;    % Fontos, hogy érzékelje a billentyűnyomást
        end
        
        % 6. Ha tovább megyünk, eltüntetjük a segédelemeket:
        delete(annot);          % Töröljük a szövegdobozt
        delete(text_handles);   % Töröljük a számokat a grafikonról
        
        % Visszaállítjuk az eredeti címet:
        if isvalid(fig)
            subplot(3, 1, 2);
            title({['2. Átfedés (Lag: ' num2str(current_lag) ')'], ...
                   ['Számolás: \Sigma = ' num2str(current_sum, '%.2f')]}, ...
                   'FontSize', 12, 'FontWeight', 'bold');
        end
    end
    
    % --- SEBESSÉG BEÁLLÍTÁSA ---
    % Itt történt a módosítás: 0.1 helyett 0.2 másodpercet várunk
    pause(0.2); 
end

disp('Animáció kész!');

%% SEGÉDFÜGGVÉNY: Billentyűzet figyelése
% -------------------------------------------------------------------------
% Ez a függvény hívódik meg minden gombnyomáskor.
function keyPressCallback(src, event)
    % Ha a lenyomott billentyű a SPACE:
    if strcmp(event.Key, 'space')
        % Kiolvassuk a jelenlegi állapotot:
        currentState = getappdata(src, 'isPaused');
        % Megfordítjuk (True -> False vagy False -> True):
        setappdata(src, 'isPaused', ~currentState);
    end
end