function f = cost2(seq,INPUT)

placement_order = ['A';'B';'C';'D';'E';'F';'G';'H';'I';'J'];

T = 0;

A = ismember(seq,'A');
B = ismember(seq,'B');
C = ismember(seq,'C');
D = ismember(seq,'D');
E = ismember(seq,'E');
F = ismember(seq,'F');
G = ismember(seq,'G');
H = ismember(seq,'H');
I = ismember(seq,'I');
J = ismember(seq,'J');

First = B + C;
Last  = E + F;
Middle = D + G;
Check = H + D + G + E + F;

if find(H == 1) > min(find(Middle+Last == 1)) || find(G == 1) > min(find(Last == 1)) || ~all(find(First == 1) < 3)
    f = 0;
else
    for i = 1:length(seq)
        c_number = ismember(placement_order,seq(i));
        if i ~= length(seq)
        c_next = ismember(placement_order,seq(i+1));
            if INPUT(4,c_number) == 2 && INPUT(4,c_next) == 2 && INPUT(5,c_number) == INPUT(5,c_next)
                T = T;
            else
                if INPUT(2,c_number) == INPUT(2,c_next) 
                    penalty_d = 0;
                else
                    if mod(INPUT(2,c_number),2) == 0 && INPUT(2,c_next) ~= INPUT(2,c_number)-1 || mod(INPUT(2,c_number),2) == 1 && INPUT(2,c_next) ~= INPUT(2,c_number)+1 
                        penalty_d = 1;
                    else
                        penalty_d = 2;
                    end
                end
                if INPUT(3,c_number) == INPUT(3,c_next) 
                    penalty_m = 0;
                else
                    penalty_m = 1;
                end
                T = T + INPUT(1,c_number) + penalty_d + penalty_m;
            end 
        else
            T = T + INPUT(1,c_number);
        end

    end
    f = 100-T;    
end

