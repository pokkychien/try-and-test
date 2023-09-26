function output = merge(input ,level,HS)
L = length(input);

%disp(L);
M1=0;
M2=0;
    if L ~= 1 
        p = fix(L/2);
        arr1=[input(1:p)];
        arr2=[input(p+1:end)];
        M1 = merge(arr1, level+1, HS);
        M2 = merge(arr2, level+1, HS);
            y=1;  
            x=1;
            %{
            D0=['level : ', num2str(level)];
            D1=['Matrix1 = ', num2str(M1)];
            D2=['Matrix2 = ', num2str(M2)];
            disp(D0);
            disp(D1);
            disp(D2);
            fprintf(HS,'%s\n',D0,D1,D2);
            %}
            for i = 1 : length(input)
                if x > length(M1)
                    arr(x+y-1)=M2(y);
                    y=y+1;
                elseif y > length(M2)
                    arr(x+y-1)=M1(x);
                    x=x+1;
                else
                    if M1(x) < M2(y)
                        arr(x+y-1) = M1(x);
                        x=x+1;
                    else
                        arr(x+y-1) = M2(y);
                        y=y+1;
                    end
                end
            end
%             D3=['merge to : ', num2str(arr)];
%             disp(D3);
%             disp(newline);
            %fprintf(HS,'%s\n',D3);
            output=arr;
    else
        output = input;       
    end
end

