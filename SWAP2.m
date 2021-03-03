function new = SWAP2(Test)

swap_index = ceil(rand*10);
swap_target = swap_index;

while swap_target == swap_index
    swap_target = ceil(rand*10);
end

temp = Test(swap_target);
Test(swap_target) = Test(swap_index);
Test(swap_index) = temp;
new = Test;