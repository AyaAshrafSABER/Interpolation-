function [final,final_Simplified_func,query_result] = LagrangeINT(order,p,y,query)
if(order > length(p))
    disp('wrong points number');
    return
end
syms term(x)
syms final(x)
syms final_Simplified_func(x)
final(x) = zeros(1,length(p));
term(x) = ones(1,length(p));
final(x) = 0;
 for i = 1:1:order
     term(x) = 1;
     for j= 1:1:order
         if(j ~= i)
             term(x) = term(x)*((x-p(j))/(p(i)-p(j)));
         end
     end
     final(x) = final(x)+ term(x)*y(i);
     disp(final(x));
 end
disp((final(x)));
final_Simplified_func = simplify(final(x));
disp(final_Simplified_func);
query_result = zeros(1,length(query));
 for i = 1:1:length(query_result)
     query_result(i) = feval(final,query(i));
     disp(query_result(i));
 end