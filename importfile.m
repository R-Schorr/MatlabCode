function SpecimenRawData1 = importfile(filename, startRow, endRow,startColumn,endColumn)
%IMPORTFILE1 Import numeric data from a text file as a matrix.
%   SPECIMENRAWDATA1 = IMPORTFILE1(FILENAME) Reads data from text file
%   FILENAME for the default selection.
%
%   SPECIMENRAWDATA1 = IMPORTFILE1(FILENAME, STARTROW, ENDROW) Reads data
%   from rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   SpecimenRawData1 = importfile1('Specimen_RawData_1.csv', 3, 463);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2019/04/28 23:50:28

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 3;
    endRow = inf;
end
formatSpec='';
%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
for forspec=startColumn:endColumn
    formatSpec = ['%q',formatSpec];
end
formatSpec=[formatSpec,'%[^\n\r]'];
%% Open the text file.

fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'TextType', 'string', 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'TextType', 'string', 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = mat2cell(dataArray{col}, ones(length(dataArray{col}), 1));
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[startColumn:endColumn]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData(row), regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if numbers.contains(',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(char(strrep(numbers, ',', '')), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch
            raw{row, col} = rawData{row};
        end
    end
end


%% Create output variable
SpecimenRawData1 = table;
SpecimenRawData1.Time = cell2mat(raw(:, 1));
SpecimenRawData1.Extension = cell2mat(raw(:, 2));
SpecimenRawData1.Load = cell2mat(raw(:, 3));
if endColumn>3
    SpecimenRawData1.TensilestrainExtension = cell2mat(raw(:, 4));
    SpecimenRawData1.Tensilestress = cell2mat(raw(:, 5));
    SpecimenRawData1.Strainbyclipgage = cell2mat(raw(:, 6));
end