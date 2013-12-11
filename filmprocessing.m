% $Id%
function filmprocessing2()
    clear; close all;   

    %% Filme definieren

    %{
    lucky = [ 
        'HC-110 1:49',          100,    13,     20;
        'ID-11 stock',          100,     6,     20;
        'XTOL 1+3',             400,    36,     20;
        'MicroMF stock',        100,     7,     20;
        'Ilfosol 3 1:9',        100,    7.5,    20;
        'MicroMF stock',        100,     8,     20;
        'MicroMF stock',        400,     16,    25;
        'MicroMF stock',        100,     7,     25;
        'MicroMF stock',        100,     14,    20;
        'HC-110 1:31',          100,    7.5,    20;
        'Agfa Rodinal 1:50',    100,     12,    20;
        'MicroMF stock',        100,     9.5,    20;
        'Microphen stock',      100,     6,     20;
        'Microphen stock',      100,     10,     20;
        'Fomadon R09 1:50',     100,     10,     20;
    ];

    lucky_stand = [
         'Agfa Rodinal 1:100',    50,     60,     20;
         'Spürsinn HCD 1:25',     800,    30.5,  20;
         'Agfa Rodinal 1:100',    100,    50,    20;         % Fehler! http://filmdev.org/recipe/show/5417
         'Agfa Rodinal 1:200',    50,     120,     20;
         ];
    %}

    data = [ % TriX 400 in Rodinal
    %   1+n      ASA     Zeit   Temp
        50       100     7.5     20;
        50       200     9       20;
        50       100     7.5     20;
    %    100      200     20      20;
         100      250     20      20;
        100      250     15      20;
    %    24       320     6       20;
    %    25       400     7       20;
    %    35       400     10      20;
        50       400     13      20;
    %    60       400     15      20;
    %    75       400     17.5    20;
        100      400     20      20;
        %100      400     24      21;
        50       640     15.5    20;
        50       800     16.5    20;
        %100      800     17.5    24;
        50       1600    18.5    20; % stand
        50       3200    33      20; % stand
        50       12800   51      20; % stand
    ];

    %% Verdünnungen auswerten und plotten
    figure('Name', 'Entwicklungszeiten', 'NumberTitle', 'off');

    % Zeitachse für die Regressionskurven
    t = min(data(:,2)):10:max(data(:,2));
    
    % Auswerten
    data = sortrows(data, 2);
    dilutions = unique(data(:,1));
    labels = cell(length(dilutions)*2, 1);
    for i=1:length(dilutions)
        dilution = dilutions(i);

        % Indizes aller Einträge dieser Verdünnung in der Hauptliste ermitteln
        indices = find(data(:,1) == dilution);
        asa  = data(indices,2);
        zeit = data(indices,3);
        
        % Einträge mitteln
        for j=1:length(asa)
           same = find(asa == asa(i));  % Elemente mit selber Empfindlichkeit
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

        % Regressionskurve annähern
        disp(['Starte Optimierung für 1+' num2str(dilution) '...']);
        params = fitloglog(asa, zeit);
        m = params(1);
        b = params(2);
        x = t.^m * 10^b;

        % Bildschirmausgabe
        disp(['Ermittelte Funktion:  ' sprintf('1+%-6d Zeit(ASA) = ASA^%f * 10^%f', dilution, m, b)]);

        % Legendeneintrag für die Regression
        regression_label = sprintf('t_{%d}(a) = a^{%f} * 10^{%f}', dilution, m, b);
        
        % Linear plotten.
        subplot(2,1,1);
        handle = plot(asa, zeit, '+-', 'LineWidth', 2);
        color = get(handle, 'Color');
        hold all;
        handle = plot(t, x, ':', 'LineWidth', 2);
        set(handle, 'Color', color);

        % Logarithmisch plotten.
        subplot(2,1,2);
        handle = loglog(asa, zeit, '+-', 'LineWidth', 2);
        color = get(handle, 'Color');
        hold all;
        handle = plot(t, x, ':', 'LineWidth', 2);
        set(handle, 'Color', color);
        
        % Legende ergänzen
        label = sprintf('Messwerte bei 1+%d', dilution);
        labels{2*(i-1)+1} = label;
        labels{2*(i-1)+2} = regression_label;
    end
    
    % Legende und Achsenbeschriftungen
    subplot(2,1,1);
    title('Tri-X in Rodinal 1+50 (linear)');
    legend(labels, 'Location', 'SouthEast');
    grid on; grid minor;
    xlabel('a = Empfindlichkeit [ASA]');
    ylabel('t = Entwicklungszeit [Minuten]');

    % Legende und Achsenbeschriftungen
    subplot(2,1,2);
    title('Tri-X in Rodinal 1+50 (log-log)');
    legend(labels, 'Location', 'SouthEast');
    grid minor; grid on;
    xlabel('a = Empfindlichkeit [ASA]');
    ylabel('t = Entwicklungszeit [Minuten]');

    
    function estimates = fitloglog(xdata, ydata)      
        % Zwei beliebige Indizes wählen
        index1 = ceil(rand(1)*length(xdata));
        while index1 == 0, index1 = floor(rand(1)*length(xdata)); end;
        
        index2 = ceil(rand(1)*length(xdata));
        while index2 == index1 || index2 == 0, index2 = floor(rand(1)*length(xdata)); end;
        
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