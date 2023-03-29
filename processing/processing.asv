clear; clf;
% Specify file type
file_type = "xlsx";

% Specify the location of the Excel file(s)
fileFolder = '../processing/processing_input/';
filePattern = fullfile(fileFolder,strcat('*.' , file_type));
files = dir(filePattern);

% Create a folder to store the output plots
outputFolder = '../processing/processing_output/';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end


% Loop through each file
for i = 1:numel(files)
    % Get the file name
    filename = fullfile(files(i).folder, files(i).name);

    % Load the Excel file
    [~, sheet_names] = xlsfinfo(filename); % get the names of all sheets in the file

    % Load data from the two sheets
    data1 = readmatrix(filename, 'Sheet', sheet_names{1}); % read data from the first sheet
    data2 = readmatrix(filename, 'Sheet', sheet_names{2}); % read data from the second sheet
    freq = readmatrix(filename, 'Sheet', 1, 'Range', '1:1');
    
    % Find the maximum value in each cell of the two sheets
    max_values = zeros(size(data1)); % initialize max_values with zeros
    for row = 2:size(data1, 1)
        for col = 2:size(data1, 2)
            max_values(row, col) = max(data1(row, col), data2(row, col)); % compare corresponding cells in both sheets and find the maximum value
        end
    end
    
    processed_name = strcat('processed_',[files(i).name(1:end-5)],'.',file_type);

    % Write the two sheets to a new Excel file with the original sheet names
    writematrix(data1, processed_name, 'Sheet', sheet_names{1}); 
    writematrix(data2, processed_name, 'Sheet', sheet_names{2}); 
    
    % Write the maximum values to a new sheet in the new Excel file
    max_sheet = ["", num2cell(data1(1, 2:end)); num2cell(data1(2:end, 1)), num2cell(max_values(2:end, 2:end))]; 
    writematrix(str2double(max_sheet), processed_name, 'Sheet', 'max'); % write the maximum values to a new sheet named "max" in the new Excel file


    % Calculate the linear maximum combined values
    lin_max_values = 10.^(max_values(2:end, 2:end)./20); % calculate the linear maximum values
    lin_max_sheet = ["", num2cell(data1(1, 2:end)); num2cell(data1(2:end, 1)), num2cell(lin_max_values)]; % create a cell array with the first row and the linear maximum values
    writematrix(str2double(lin_max_sheet), processed_name, 'Sheet', 'LIN MAX COMB'); % write the linear maximum values to a new sheet named "LIN MAX COMB" in the new Excel file
    
    % Calculate the mean of each column in the max_sheet (ignoring the first row and column)
    mean_values = mean(lin_max_values, 1); 
    final_vals = 20*log10(mean_values); % calculate the logarithmic values of the mean values
    writematrix(freq, processed_name, 'Sheet', 'final', 'Range', 'B1');
    writematrix(final_vals, processed_name, 'Sheet', 'final','Range','B2'); % write the final values to a new sheet named "final" in the new Excel file
    
    % Write the final sheet
    x_var = "Freq (Hz)"; 
    y_var = "LAGc"; 
    writecell({x_var}, processed_name, 'Sheet', 'final','Range','A1'); 
    writecell({y_var}, processed_name, 'Sheet', 'final', 'Range', 'A2');
 

    %----------------------------------------------------------------------------------------------
    % read data from the "final" sheet
    final_data = readmatrix(processed_name, 'Sheet', 'final');
   
    % extract x and y data
    x_data = rmmissing(final_data(1,:)); 
    y_data = rmmissing(final_data(2,:));
    
    % plot the data
    disp(x_data(1));
    disp(y_data(1));
    disp(x_data(2));
    disp(y_data(2));
    % plot(x_data, y_data,'.', 'markersize', 28); % Another plotting style
    plot(x_data, y_data,'LineWidth', 1.5); 

    title("LAGc vs Freq")
    xlabel('Freq (Hz)');
    ylabel('LAGc');
    xlim auto
    ylim auto
    grid on;  % Add grid lines

     % Save the plot as a JPG file in the output folder
    outputFilename = fullfile(outputFolder, [files(i).name(1:end-5) '.jpg']);
    saveas(gcf, outputFilename);

    %----------------------------------------------------------------------------------------------
    % move file to a subfolder
    filename = processed_name;
    foldername = 'processing_output';
    movefile(filename, fullfile(foldername, filename));
    

end








