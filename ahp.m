clear,clc;
% Mass Cost Max Force of Thrust Volume Safety
% Options: Nitrogen/Pressurized Gas Solid Fuel  
%overall(1,:) = [1 ? ? ?]
%overall(2,:) = [? 1 ? ?]+
%overall(3,:) = [? ? 1 ?]
%overall(4,:) = [? ? ? 1]
%fprintf('Put variants with eigen last in overall criteria matrix \n');
%num = str2num(input('How many criteria: ','s'));
%num1 = str2num(input('How many variants (with matrix): ','s'));
%num2 = str2num(input('How many variants (with eigen): ','s'));
%for i = 1:num
%    overall(i,:) = str2num(input('Enter Line for criteria: ','s'))
%end

overall(1,:) = [1 1229.99*4 1 22*4 1];
overall(2,:) = [.8 100*4 1 35*4 .7];
overall(3,:) = [.8 269*4 .5 180*4 .7];
overall(4,:) = [1 329*4 .9 35*4 1];
overall(5,:) = [1 465 .7 135 1];
squaremat = overall*overall;
squaremat = squaremat*squaremat;
squaremat = squaremat*squaremat;
for i = 1:5
        row_sum(i) = sum(squaremat(i,:));
end
suma = sum(row_sum);
eig_over = row_sum./suma




for j = 1:num1
    for i = 1:num
    le(i,:) = str2num(input('Enter Line for variant: ','s'))
    end
    squaremat = le*le;
    squaremat = squaremat*squaremat;
    squaremat = squaremat*squaremat;
    for i = 1:num
            row_sum(i) = sum(squaremat(i,:));
    end
    suma = sum(row_sum);
    eig(j,:) = row_sum./suma
end

for j = 1:num2
    eig(num1+j,:) = str2num(input('Enter Eigen for variant: ','s'))
end

for j = 1:(num1+num2)
    MATRIX_A(:,j) = eig(j,:)';
end
final = MATRIX_A * eig_over'

