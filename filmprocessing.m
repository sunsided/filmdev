% $Id%
function filmprocessing3()
    home; clear; close all;   

    %% Filme definieren

    lucky = { 
        'HC-110',             49      100,     13,     20;
        'ID-11/D-76',          1      100,     6,      20;
        'ID-11/D-76',          1      100,     7,      20;
        'ID-11/D-76',          1      400,     8,      20;
        'XTOL',                3      400,     36,     20;
        'MicroMF',             1      100,     7,      20;
        'Ilfosol 3',           9      100,     7.5,    20;
        'MicroMF',             0      100,     8,      20;
        %'MicroMF',             1      400,     16,     25;
        %'MicroMF',             1      100,     7,      25;
        %'MicroMF',             1      100,     7,      28;
        'MicroMF',             0      100,     14,     20;
        'HC-110',             31      100,     7.5,    20;
        'MicroMF',             0      100,     9.5,    20;
        'Microphen',           1      100,     6,      20;
        'Microphen',           1      100,     10,     20;
        'Fomadon R09',        50      100,     10,     20;
        
        'Rodinal',            25      100,      6.5     20;
        'Rodinal',            25      100,      7       20;
        'Rodinal',            25      400,      7       20;
        %'Rodinal',           25      100,      5.0     23;
        %'Rodinal',            25      400,     25.0     22;
        'Rodinal',            50      100,     12.0     20;
        'Rodinal',            50      100,     13.0     20;
        'Rodinal',            50      160,     20.0     20;
        'Rodinal',           100      100,     20.0     20;
        
        %'Rodinal',            25     1600,     25.0     20; % Lucky 400
        'Rodinal',            25      800,     16.0     20; % Lucky 400 - angepasst
    };
    
    %{
    lucky_stand = {
         'Agfa Rodinal',        100,       50,      60,     20;
         'Spürsinn HCD',         15       100,       8.0,   20;
         'Spürsinn HCD',         25       800,      30.5,   20;
         'Agfa Rodinal',        100       100,      50,     20;         % Fehler! http://filmdev.org/recipe/show/5417
         'Agfa Rodinal',        200        50,     120,     20;
         };
    %}
    
    [results, meanalpha, developers] = plot_and_estimate('Lucky SHD 100', lucky)
    trix400 = { % TriX 400 in Rodinal
    %   Name            1+n      ASA     Zeit   Temp
        %'Rodinal'       50       1600    20      20; % FilmDev
        'Rodinal'       25       320    6.75      20; % FilmDev
        'Rodinal'       50       400     7      20; % FilmDev
        'Rodinal'       50       400     14      20; % FilmDev
        'Rodinal'       50       800     17      20; % FilmDev
        'Rodinal'       25       400     8      20; % FilmDev
        'Rodinal'       50       400     13      20; % FilmDev
        %'Rodinal'       50       1600     18.5      20; % FilmDev
        'Rodinal'       50       400     14      20; % FilmDev
        'Rodinal'       50       400     13      20; % FilmDev
        'Rodinal'       50       400     13      20; % FilmDev
        'Rodinal'       25       250     5.75      20; % FilmDev
        'Rodinal'       60       400     15      20; % FilmDev
        'Rodinal'       60       400     17      20; % FilmDev
        
        'Rodinal'       74       400     17.5      20; % FilmDev
        
        'Rodinal'       25       500     7      20; % Agfa Datenblatt
        'Rodinal'       50       500     14      20; % Agfa Datenblatt
        
        'Rodinal'       50       400     11+(50/60)      20;
        'Rodinal'       50       400     12+(45/60)      20;
        
        'Rodinal'       50       400     14      20; % triggerflanke
        'Rodinal'       50       800     16.5    20; % triggerflanke
        
        'Rodinal'       25       400      6      20;
        'Rodinal'       25       400      7      20;
        'Rodinal'       25       400      9      20;
        'Rodinal'       25       400     11      20;
        %'Rodinal'       25       200      7      20;
        %'Rodinal'       25       200     10      20;
        %'Rodinal'       25       100     11      20;
        
        %'Rodinal'       25      1600     15       20;
        %'Rodinal'       25      1600     16.16    20;
        %'Rodinal'       25      3200      9       20;
        
        'Rodinal'      100       400     18       20;
        'Rodinal'       25       400      7       20;
        'Rodinal'       50       400     13       20;
        'Rodinal'       50       100      7.5     20;
         
        'Rodinal'       50       200     9      20; % http://kzar.net/wiki/Photo/D%E9veloppement
        'Rodinal'       100      250     20      20;
        'Rodinal'       100      250     15      20;
        'Rodinal'       24      320      6      20;
        'Rodinal'       25      400      7      20;
        %'Rodinal'       35      320      10      20;
        'Rodinal'       50      400      10      20;
        'Rodinal'       60      400      15      20;
        'Rodinal'       75      400      17.5      20;
        'Rodinal'       100      400      20      20;
        %'Rodinal'       100      400      24      21;
        'Rodinal'       50      640      15.5      20;
        'Rodinal'       50      800      16.5      20;
        %'Rodinal'       100      800      17.5      24;
        %'Rodinal'       50      1600      18.5      20;
        
        %'Rodinal'       35       400      10.0   20;        
        
        'Rodinal'       50       100     7.5     20;
        'Rodinal'       50       200     9       20;
    %    'Rodinal'       100      200     20      20;
         'Rodinal'       100      250     20      20;
        'Rodinal'       100      250     15      20;
    %    'Rodinal'       24       320     6       20;
        'Rodinal'       25       400     7       20;
    %    'Rodinal'       35       400     10      20;
       'Rodinal'       50       400     13      20;
    %   'Rodinal'       60       400     15      20;
    %   'Rodinal'       75       400     17.5    20;
        'Rodinal'       100      400     20      20;
        %'Rodinal'       100      400     24      21;
        'Rodinal'       50       640     15.5    20;
        'Rodinal'       50       800     16.5    20;
        %'Rodinal'       100      800     17.5    24;
        
        'Rodinal'       50       100       7.5   20;
        'Rodinal'       50       200       9     20;
        'Rodinal'       25       320       6     20;
        'Rodinal'       50       400      14     20;
        'Rodinal'       25       400       7     20;
        'Rodinal'       75       400      17.5   20;
        'Rodinal'       60       400      15.0   20;
        'Rodinal'       50       640      15.5   20;
        'Rodinal'       50       800      16.5   20;
        %'Rodinal'       50      3200      33.0   20;
        %'Rodinal'       50     12800      51.0   20;
        
        'Rodinal'       25       500       7.5   20;
        'Rodinal'       50       400      12.5   20;
        'Rodinal'      100       250      15.0   20;
        'Rodinal'      100       400      20.0   20;
        
        'Rodinal'       25       800       9.5   20;
        %'Rodinal'       50       160       8.0   20;
        
        'Rodinal'       85       250      14.0   20;
        'Rodinal'       75       400      14.5   20;
        'Rodinal'      100       200      13.0   20;
        'Rodinal'      100       100      11.0   20; %??
        'Rodinal'      100       400      20.0   20;
        %'Rodinal'       50       250      15.0   20; %??
        
        'Rodinal'       50       800      16.5   20; % R09 One Shot
        'Rodinal'       50       200      14.0   20; % R09 One Shot
        'Rodinal'       50       400      15.0   20; % R09 One Shot
        
        'Rodinal'       25       400       7.0   20;
        'Rodinal'       25        80       5.0   20;
        
        'Xtol'          0       150         5.5          20;
        'Xtol'          1       150         8.0          20;
        'Xtol'          2       150         8.75         20;
        'Xtol'          3       150         10.75        20;
        %'Xtol'          0       320         7.75         20;
        %'Xtol'          1       320         11.25        20;
        'Xtol'          0       400         6.75         20;
        'Xtol'          0       400         7.0          20;
        'Xtol'          1       400         9            20;
        'Xtol'          1       400         8.75         20;
        'Xtol'          2       400         10.5         20;
        'Xtol'          3       400         12.5         20;
        'Xtol'          3       400         13           20;
        'Xtol'          0       800         7.75         20;
        'Xtol'          1       800         10.0         20;
        'Xtol'          2       800         12.5         20;
        'Xtol'          3       800         14           20;
        %'Xtol'          0      1250         12           20;
        %'Xtol'          1      1250         15.75        20;
        'Xtol'          0      1600         9            20;
        'Xtol'          0      1600         9.75         20;
        'Xtol'          1      1600         11.75        20;
        'Xtol'          1      1600         13.25        20;
        'Xtol'          2      1600         14.5         20;
        'Xtol'          3      1600         16.5         20;
        'Xtol'          0      3200         11.5         20;
        'Xtol'          0      3200         10.5         20;
        'Xtol'          1      3200         15.5         20;
        'Xtol'          1      3200         13.5         20;
        'Xtol'          2      3200         17           20;
        'Xtol'          3      3200         20           20;
        
        'Xtol'          1       800         12.5         20;
        
        'D-76'          1        50          7.0         20;
        'D-76'          1       200          9.5         20;
        'D-76'          0       600          6.75        20;
        'D-76'          1       600          9.75        20;
        'D-76'          3       400         20.0         20;
        'D-76'          0      1600          9.5         20;
        'D-76'          1      1600         12.25        20;
        'D-76'          0      3200         15.0         20;
        'D-76'          1      3200         16.0         20;
        'D-76'          1       200          8.0         20;
        'D-76'          1       800          9.75        20;
        'D-76'          0      3200         13.0         20;
        'D-76'          0      1600          9.5         20;
        'D-76'          0       800          8.0         20;
        'D-76'          1       400         10.0+(15/60) 20;
        'D-76'          0       200          6.5         20;
        'D-76'          1       320          9.5         20;
        'D-76'          1       400          9.0         20;
        'D-76'          1       250          8.5         20;
        'D-76'          1       320          9.0         20;
        'D-76'          0       400          6.75        20;
        'D-76'          0       400          7.0         20;
    };

    [results, meanalpha, developers] = plot_and_estimate('Tri-X 400', trix400)
    
    %{
    trix400_stand = { % TriX 400 in Rodinal (Standendwicklung)
    %   Name            1+n      ASA     Zeit   Temp      
        'Rodinal'       50       1600    18.5    20; % http://kzar.net/wiki/Photo/D%E9veloppement
        'Rodinal'       50       3200    33      20;
        'Rodinal'       50       12800   51      20;
        
        'Rodinal'       100      3200    120     20; % FilmDev
        'Rodinal'       100      1000     60     20;
        'Rodinal'       100       400     60     20;
        'Rodinal'       100      1600    120     20;
        'Rodinal'       100      1600     60     20;
        'Rodinal'       100       400     60     20;
        'Rodinal'       100      1250     60+(15/60)     20;
        'Rodinal'       100      3200     12*60  20;
        %'Rodinal'        50       400     10*60+(15/60)  20;
        'Rodinal'       100       400     60     20;
        'Rodinal'        50      3200     33     20;
        'Rodinal'       100       320     60     20;
        
    };
    plot_and_estimate('Tri-X 400 (Standendwicklung)', trix400_stand);
    %}

    
    % Gibt Plots zu Entwicklerlisten aus und ermittelt die Koeffizienten
    % alpha und beta, so dass gilt:
    % temperatur(empfindlichkeit) = empfindlichkeit^alpha + 10^beta
    %
    % Als Eingangsdaten werden folgende Parameter erwartet
    % filmname   - Der Name des Films für die Plots
    % data       - Ein Cell-Array mit folgendem Aufbau:
    %               + Name der Entwicklerchemie
    %               + Verdünnung n (in 1+n)
    %               + Zielempfindlichkeit
    %               + Entwicklungszeit in Minuten
    %                 Standentwicklungen sollten nicht zusammen mit
    %                 Kippentwicklungen abgelegt werden, da sonst die
    %                 Schätzung nicht korrekt arbeitet.
    %               + Temperatur
    %                 Diese sollte für alle Einträge identisch sein.
    %
    % Die Funktion gibt drei Arrays zurück:
    % results    - Beinhaltet die Koeffizienten
    % meanalpha  - Beinhaltet den Mittelwert des Koeffizienten alpha
    %              und die Standardabweichung
    % developers - Lookup-Tabelle für den jeweiligen Entwickler
    %
    % Exemplarische Eingangsdaten:
    % data = {
    %    'Rodinal'       50       1600   20.00    20;
    %    'Rodinal'       25        320    6.75    20;
    %    ...
    %    };
    %
    % Exemplarische Ergebnisse:
    %
    %     results =
    %         1.0000   25.0000    0.3230    0.0004
    %         1.0000   50.0000    0.3388    0.2147
    %         1.0000  100.0000    0.2841    0.5617
    %         2.0000         0    0.2291    0.2363
    %         2.0000    1.0000    0.2144    0.4040
    %         2.0000    2.0000    0.2218    0.4519
    %         2.0000    3.0000    0.2087    0.5588
    %                                       ^- Geschätztes beta
    %                             ^- Geschätztes alpha
    %                   ^- Verdünnung 1+n
    %           ^- Zeilenindex der Developers- und meanalpha-Matrix
    % 
    %     meanalpha =
    %         0.3153    0.0281
    %         0.2185    0.0089
    %                   ^- Standardabweichung alpha
    %         ^- Mittelwert alpha
    %
    %     developers = 
    %         'Rodinal'
    %         'Xtol'
    %         ^- Name der Entwicklerchemie
    %
    function [results, meanalpha, developers] = plot_and_estimate(filmname, data)

        %% Verdünnungen auswerten und plotten
        
        % Eingangsdaten umwandeln
        datacell = data;
        datamat = cell2mat(data(:,2:5));
        
        % Zeitachse für die Regressionskurven
        t = min(datamat(:,2)):10:max(datamat(:,2));

        % Entwickler auswerten
        developers = unique(datacell(:,1));
        
        % Ausgabe vorbereiten
        datacount = length(unique(datamat(:,1)));
        result_index = 1;
        developer_index = 1;
        results = zeros(datacount, 4);
        developers_out = cell(length(developers), 1);
        
        % Entwickler durchlaufen
        for d=1:length(developers)
            developer = cell2mat(developers(d));

            % Flags
            figure_created = false;
            
            % Zum Entwickler gehörige Zeilen finden
            indices = find(strcmp(datacell(:,1), developer));
            data = datamat(indices,:);
            if length(indices) == 1
                continue;
            end
            
            % Auswerten
            data = sortrows(data, 2); % Nach Empfindlichkeiten sortieren
            dilutions = unique(data(:,1));
            labels = cell(length(dilutions)*2, 1);
            real_dilution_index = 1;
            for i=1:length(dilutions)
                dilution = dilutions(i);

                % Indizes aller Einträge dieser Verdünnung in der Hauptliste ermitteln
                indices = find(data(:,1) == dilution);
                disp(['+ Auswertung: ' filmname ' in ' developer ' 1+' num2str(dilution) ' ...']);
                if length(indices) == 1
                    disp('  /!\ Überspringe wegen zu weniger Datenpunkte: Es werden mindestens zwei Punkte benötigt.');
                    disp(' ');
                    continue;
                end
                
                asa  = data(indices,2);
                zeit = data(indices,3);

                % Einträge mitteln
                original_asa = asa;
                for j=1:length(asa)
                   same = find(asa == original_asa(j));  % Elemente mit selber Empfindlichkeit
                   count = length(same);
                   if count == 1, continue, end;

                   % Zeiten mitteln
                   mittel = sum(zeit(same))/count;
                   zeit(same) = mittel;

                   % Überschüssige Elemente löschen
                   range = 2:length(same);
                   asa(same(range)) = [];
                   zeit(same(range)) = [];
                   indices(range) = [];
                end

                % Werte extrahieren
                values = zeros(length(indices), 2);
                values(:, 1) = asa;
                values(:, 2) = zeit;
                values = sortrows(values);
                asa  = values(:, 1);
                zeit = values(:, 2);

                % Notbremse.
                if length(asa) == 1
                    disp('  /!\ Überspringe wegen zu weniger Datenpunkte.');
                    disp(' ');
                    continue;
                elseif length(asa) < 4
                    disp('  Warnung: Weniger als 4 Datenpunkte. Ergebnis möglicherweise ungünstig.');
                end
                
                % Regressionskurve annähern
                disp(['  Starte Optimierung für 1+' num2str(dilution) ' (' num2str(length(asa)) ' Datenpunkte)...']);
                params = fitloglog(asa, zeit);
                m = params(1);
                b = params(2);
                x = t.^m * 10^b;

                % Ergebnis speichern
                result_row = [developer_index dilution m b];
                results(result_index, 1:4) = result_row; 
                result_index = result_index + 1;                
                
                % Bildschirmausgabe
                disp(['  Ermittelte Funktion:  ' sprintf('1+%-6d Zeit(ASA) = ASA^%f * 10^%f', dilution, m, b)]);
                disp(' ');
                
                % Legendeneintrag für die Regression
                %regression_label = sprintf('t_{\theta=%d}(\alpha) = \alpha^{%f} * 10^{%f}', dilution, m, b);
                regression_label = ['\theta_{' num2str(dilution) '}(\alpha) = \alpha^{' num2str(m) ' } * 10^{' num2str(b) '}'];

                if ~figure_created
                    
                    figure_title = sprintf('Entwicklungszeiten %s in %s', filmname, developer);
                    figure('Name', figure_title, 'NumberTitle', 'off');
                    figure_created = true;
                    
                end
                
                % Linear plotten.
                subplot(2,1,1);
                handle = plot(asa, zeit, '+-', 'LineWidth', 2);
                color = get(handle, 'Color');
                %newcolor = [min(1, color(1)+0.6) min(1, color(2)+0.6) min(1, color(3)+0.6)];
                %set(handle, 'Color', newcolor);
                hold all;
                handle = plot(t, x, ':', 'LineWidth', 2);
                set(handle, 'Color', color);

                % Logarithmisch plotten.
                subplot(2,1,2);
                handle = loglog(asa, zeit, '+-', 'LineWidth', 2);
                color = get(handle, 'Color');
                %newcolor = [min(1, color(1)+0.6) min(1, color(2)+0.6) min(1, color(3)+0.6)];
                %set(handle, 'Color', newcolor);
                hold all;
                handle = plot(t, x, ':', 'LineWidth', 2);
                set(handle, 'Color', color);

                % Legende ergänzen
                label = sprintf('Messwerte bei 1+%d', dilution);
                labels{2*(real_dilution_index-1)+1} = label;
                labels{2*(real_dilution_index-1)+2} = regression_label;
                real_dilution_index = real_dilution_index + 1;

            end % Verdünnungen

             % Plotkram überspringen
            if ~figure_created
                continue;
            end
            
            developers_out(developer_index) = {developer};
            developer_index = developer_index + 1;
            
            % Titel vorbereiten und Legende ausdünnen
            plottitle = sprintf('%s in %s', filmname, developer);
            labels = labels(1:(real_dilution_index-1)*2); % Für übersprungene Verdünnungen kompensieren

            % Legende und Achsenbeschriftungen
            subplot(2,1,1);
            title([plottitle ' (linear)']);
            %legend(labels, 'Location', 'SouthEast');
            %grid on; grid minor;
            xlabel('\alpha = Empfindlichkeit [ASA]');
            ylabel('\theta = Entwicklungszeit [Minuten]');

            % Legende und Achsenbeschriftungen
            subplot(2,1,2);
            title([plottitle ' (log-log)']);
            legend(labels, 'Location', 'SouthEast');
            %grid minor; grid on;
            xlabel('\alpha = Empfindlichkeit [ASA]');
            ylabel('\theta = Entwicklungszeit [Minuten]');

        end % Entwickler
    
        % Ergebnisse geradebiegen
        results = results(1:result_index-1, :);
        developers = developers_out(1:developer_index-1, :);
        meanalpha = zeros(length(developers), 2);

        % Mittelwerte bilden
        for d=1:length(developers)
            indices = find(results(:,1) == d);
            if isempty(indices), continue, end;
            meanalpha(d, 1) = mean(results(indices, 3));
            meanalpha(d, 2) = std(results(indices, 3));
        end
        
    end % plot_and_estimate
        
    function estimates = fitloglog(xdata, ydata)      
        % Zwei beliebige Indizes wählen
        count = length(xdata);
        index1 = min(max(1,ceil(rand(1)*count)),count);
        
        index2 = index1;
        while index2 == index1, index2 = min(max(1,ceil(randn(1)*count)),count); end;
        
        % Anstieg berechnen
        m_start = (log(ydata(index2)/ydata(index1)))/(log(xdata(index2)/xdata(index1)));
        b_start = 0;
        
        % Initialwerte setzen und schätzen
        initial = [m_start b_start];
        estimates = fminsearch(@loglogestimate, initial);
        
        % Erwartet Parameter m und b und liefert den quadratischen Fehler
        function sse = loglogestimate(params)
            m = params(1);
            b = params(2);

            FittedCurve = xdata.^m .* 10^b;
            ErrorVector = FittedCurve - ydata;
            sse = sum(ErrorVector .^ 2);
        end
    end
    
end