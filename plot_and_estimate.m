% plot_and_estimate Shows plots for developer and determines the coefficients
% alpha und beta, such that:
% duration(sensitivity) = sensitivity^alpha + 10^beta
%
% Format:   [results, meanalpha, developers] = plot_and_estimate(title, data)
%
% Input:    title   - Title for the plots
%           data    - Cell array with the following strucure:
%                       + Name of the developer chemical
%                       + Dilution n (in 1+n)
%                       + Target sensitivity
%                       + Development time in minutes
%                         Note that stand development times should not be mixed with
%                         times for inversion development as the approximation
%                         will fail otherwise
%                       + Temperature
%                         The temperature SHOULD be the same for all entries
%                         in order to find a optimal solution.
%
% Output:   results    - An array of the coefficients
%           meanalpha  - An array of the mean values of the coefficients and their
%                        standard deviations
%           developers - A lookup table of all developers
%
% Example input data:
%
% data = {
%    'Rodinal'       50       1600   20.00    20;
%    'Rodinal'       25        320    6.75    20;
%    ...
%    };
%
% Example results:
%
%     results =
%         1.0000   25.0000    0.3230    0.0004
%         1.0000   50.0000    0.3388    0.2147
%         1.0000  100.0000    0.2841    0.5617
%         2.0000         0    0.2291    0.2363
%         2.0000    1.0000    0.2144    0.4040
%         2.0000    2.0000    0.2218    0.4519
%         2.0000    3.0000    0.2087    0.5588
%                                       ^- Estimated beta
%                             ^- Estimated alpha
%                   ^- Dilution 1+n
%           ^- Row index in developer and meanalpha arrays
% 
%     meanalpha =
%         0.3153    0.0281
%         0.2185    0.0089
%                   ^- standard deviation of alpha
%         ^- mean alpha
%
%     developers = 
%         'Rodinal'
%         'Xtol'
%         ^- Name of the developer
%
function [results, meanalpha, developers] = plot_and_estimate(filmname, data)

    %% Determine diltutions and plot

    % Convert input data
    datacell = data;
    datamat = cell2mat(data(:,2:5));

    % Create the time axis for the regression
    t = min(datamat(:,2)):10:max(datamat(:,2));

    % Determine developers
    developers = unique(datacell(:,1));

    % Prepare output
    datacount = length(unique(datamat(:,1)));
    result_index = 1;
    developer_index = 1;
    results = zeros(datacount, 4);
    developers_out = cell(length(developers), 1);

    % Iterate all developers
    for d=1:length(developers)
        developer = cell2mat(developers(d));

        % Flags
        figure_created = false;

        % Find all rows for the given developer chemical
        indices = find(strcmp(datacell(:,1), developer));
        data = datamat(indices,:);
        if length(indices) == 1
            continue;
        end

        % Mathify!
        data = sortrows(data, 2); % sort by sensitivity
        dilutions = unique(data(:,1));
        labels = cell(length(dilutions)*2, 1);
        real_dilution_index = 1;
        for i=1:length(dilutions)
            dilution = dilutions(i);

            % Find indices of all entries with the same dilution
            indices = find(data(:,1) == dilution);
            disp(['+ Evaluating: ' filmname ' in ' developer ' 1+' num2str(dilution) ' ...']);
            if length(indices) == 1
                disp('  /!\ Skipping because of too few data points: At least two data points are required.');
                disp(' ');
                continue;
            end

            asa  = data(indices,2);
            zeit = data(indices,3);

            % Average entries
            original_asa = asa;
            for j=1:length(asa)
               same = find(asa == original_asa(j));  % find elements with the same sensitivity
               count = length(same);
               if count == 1, continue, end;

               % Average times
               mittel = sum(zeit(same))/count;
               zeit(same) = mittel;

               % Remove remaining elements
               range = 2:length(same);
               asa(same(range)) = [];
               zeit(same(range)) = [];
               indices(range) = [];
            end

            % Extractify!
            values = zeros(length(indices), 2);
            values(:, 1) = asa;
            values(:, 2) = zeit;
            values = sortrows(values);
            asa  = values(:, 1);
            zeit = values(:, 2);

            % Handbreak in case of fire.
            if length(asa) == 1
                disp('  /!\ Skipping because of too few data points.');
                disp(' ');
                continue;
            elseif length(asa) < 4
                disp('  Warning: Less than 4 data points. Results are likely to be suboptimal.');
            end

            % Approximate regression
            disp(['  Starting optimization for 1+' num2str(dilution) ' (' num2str(length(asa)) ' data points)...']);
            params = fitloglog(asa, zeit);
            m = params(1);
            b = params(2);
            x = t.^m * 10^b;

            % Save..ify!
            result_row = [developer_index dilution m b];
            results(result_index, 1:4) = result_row; 
            result_index = result_index + 1;                

            % Output to screen
            disp(['  Approximated function:  ' sprintf('1+%-6d time(ASA) = ASA^%f * 10^%f', dilution, m, b)]);
            disp(' ');

            % Create legend entry for the regression
            %regression_label = sprintf('t_{\theta=%d}(\alpha) = \alpha^{%f} * 10^{%f}', dilution, m, b);
            regression_label = ['t_{' num2str(dilution) '}(\alpha) = \alpha^{' num2str(m) ' } * 10^{' num2str(b) '}'];

            if ~figure_created

                figure_title = sprintf('Development time %s in %s', filmname, developer);
                figure('Name', figure_title, 'NumberTitle', 'off');
                figure_created = true;

            end

            % Plot linear
            subplot(2,1,1);
            handle = plot(asa, zeit, '+-', 'LineWidth', 2);
            color = get(handle, 'Color');
            %newcolor = [min(1, color(1)+0.6) min(1, color(2)+0.6) min(1, color(3)+0.6)];
            %set(handle, 'Color', newcolor);
            hold all;
            handle = plot(t, x, ':', 'LineWidth', 2);
            set(handle, 'Color', color);

            % Plot logarithmic
            subplot(2,1,2);
            handle = loglog(asa, zeit, '+-', 'LineWidth', 2);
            color = get(handle, 'Color');
            %newcolor = [min(1, color(1)+0.6) min(1, color(2)+0.6) min(1, color(3)+0.6)];
            %set(handle, 'Color', newcolor);
            hold all;
            handle = plot(t, x, ':', 'LineWidth', 2);
            set(handle, 'Color', color);

            % Extend legend
            label = sprintf('Sample at 1+%d', dilution);
            labels{2*(real_dilution_index-1)+1} = label;
            labels{2*(real_dilution_index-1)+2} = regression_label;
            real_dilution_index = real_dilution_index + 1;

        end % Dilutions

         % Skip plot creation
        if ~figure_created
            continue;
        end

        developers_out(developer_index) = {developer};
        developer_index = developer_index + 1;

        % Prepare the title and clear the legend
        plottitle = sprintf('%s in %s', filmname, developer);
        labels = labels(1:(real_dilution_index-1)*2); % Compensate for skipped dilutions

        % Add legend and axis descriptions
        subplot(2,1,1);
        title([plottitle ' (linear)']);
        %legend(labels, 'Location', 'SouthEast');
        %grid on; grid minor;
        xlabel('\alpha = Sensitivity [ASA]');
        ylabel('t = Development time [minutes]');

        % Add legend and axis descriptions
        subplot(2,1,2);
        title([plottitle ' (log-log)']);
        legend(labels, 'Location', 'SouthEast');
        %grid minor; grid on;
        xlabel('\alpha = Sensitivity [ASA]');
        ylabel('t = Development time [minutes]');

    end % Developer

    % Cheat on the results
    results = results(1:result_index-1, :);
    developers = developers_out(1:developer_index-1, :);
    meanalpha = zeros(length(developers), 2);

    % Average...ify!
    for d=1:length(developers)
        indices = find(results(:,1) == d);
        if isempty(indices), continue, end;
        meanalpha(d, 1) = mean(results(indices, 3));
        meanalpha(d, 2) = std(results(indices, 3));
    end

end % plot_and_estimate

function estimates = fitloglog(xdata, ydata)      
    % Pick two unique random indices
    count = length(xdata);
    index1 = min(max(1,ceil(rand(1)*count)),count);

    index2 = index1;
    while index2 == index1, index2 = min(max(1,ceil(randn(1)*count)),count); end;

    % Calculate slope
    m_start = (log(ydata(index2)/ydata(index1)))/(log(xdata(index2)/xdata(index1)));
    b_start = 0;

    % Set initial values and find minimum
    initial = [m_start b_start];
    estimates = fminsearch(@loglogestimate, initial);

    % Determines squared error from parameters
    function sse = loglogestimate(params)
        m = params(1);
        b = params(2);

        FittedCurve = xdata.^m .* 10^b;
        ErrorVector = FittedCurve - ydata;
        sse = sum(ErrorVector .^ 2);
    end
end