clear; clf;
% Specify file type, change to csv, xlsx if needed
file_type = 'csv'; 

% Specify the location of the Excel file(s)
fileFolder = '../auto_plot/autoplot_input/';
filePattern = fullfile(fileFolder,strcat('*.' , file_type));
files = dir(filePattern);

% Create a folder to store the output plots
outputFolder = '../auto_plot/autoplot_output/';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% Specify plot parameters
lineWidth = 1.5; % in points
fontName = 'Helvetica';
fontSize = 12; % in points
ylabelStr = 'Frequency (Hz)';
xlabelStr = 'S11 (dB)';
titleStr = 'S11 vs. freq';

% Loop through each Excel file
for i = 1:numel(files)
    % Get the file name
    filename = fullfile(files(i).folder, files(i).name);
    
    % Import the data from the sheet
    sheetData = readtable(filename);
    
    % Plot the data
    plot(sheetData{:, 2:end}, 'LineWidth', lineWidth);
    
    % Set font properties
    set(gca, 'FontName', fontName, 'FontSize', fontSize);

    % Customize the plot
    xlabel(xlabelStr);
    ylabel(ylabelStr);
    title(titleStr);
    grid on;  % Add grid lines
    % grid minor % If smaller grid, comment out grid on
    
    % Save the plot as a JPG file in the output folder
    outputFilename = fullfile(outputFolder, [files(i).name(1:end-5) '.jpg']);
    saveas(gcf, outputFilename);
end
