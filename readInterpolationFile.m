function [interpolationType,order,Xs,Ys,Qs,msg]  = readInterpolationFile(filename)
fileID = fopen(filename);
line = fgetl(fileID);
counter = 1;
msg = '';
while ischar(line)
    if(counter == 1)
        interpolationType = line;
    elseif(counter == 2)
            order = line;
    elseif(counter == 3)
            Xs = line;
    elseif(counter == 4)
            Ys = line;
    else
        Qs = line;        
    end
    line = fgetl(fileID);
    counter = counter+1;
end
fclose(fileID);
interpolationType = str2num(interpolationType);
order = str2num(order);
Xs = str2num(Xs);
Ys = str2num(Ys);
Qs = str2num(Qs);
n = length(Xs);
for i = 1:1:(n-1)
   for j=1:1:(n-i)
       if (Xs(j) > Xs(j+1))
         temp = Xs(j);
         Xs(j) = Xs(j+1);
         Xs(j+1) = temp;
         temp = Ys(j);
         Ys(j) = Ys(j+1);
         Ys(j+1) = temp;
       end
   end
end
for i = 1:1:(length(Xs)-1)
    for j = i+1:1:length(Xs)
        if(Xs(i)==Xs(j))
            msg = 'Error !!!!!! Repeated Input';
            i = length(Xs)-1;
            break;
        end 
    end 
end
for i = 1:1:length(Qs) 
    if (Qs(i)< Xs(1) || Qs(i)>Xs((order+1)))
        msg = 'Query out of bound';
        break;
    end
end



         
         