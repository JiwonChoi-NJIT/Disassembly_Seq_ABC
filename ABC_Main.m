close all
clear all
clc
input_data

seq = ['A';'B';'C';'D';'E';'F';'G';'H';'I';'J'];

n_E = 5; % number of employed bees
n_O = 10; % number of onlooker bees
n_S = 5; % number of scout bees
n = n_E + n_O + n_S; % total number of bees

for pop = 1:n
    Food(:,pop) = seq(randperm(10));
end

max_search = 200;


hWaitbar = waitbar(0, 'Artificial Bee Colony Algorithm Optimization in process... ');

for trials = 1:max_search
    fitness = [];
    for u = 1:size(Food,2)
        fitness(u) = cost2(Food(:,u),INPUT);
    end

    if trials == 1
        [dvals, dindex] = sort(fitness, 'descend');
        large = dvals(1:n_E);
        Index = dindex(1:n_E);
        super = Food(:,Index);
        super_f = large;
    else
        fitness = [fitness super_f];
        Food = [Food super];
        [dvals, dindex] = sort(fitness, 'descend');
        large = dvals(1:n_E);
        Index = dindex(1:n_E);
        super = Food(:,Index);
        super_f = large;
    end
    fitness_Max_history(trials) = max(fitness);
    fitness_Mean_history(trials) = mean(fitness);
    if ~any(super_f)
        super_f = [1:n_E];
    end
    Roulette = cumsum(super_f/sum(super_f));
    new = [];
    if trials ~=max_search  % to find new food sources
        for j = 1:n_E   % employed bees
            if rand>0.5
                new = [new SWAP2(super(:,j))];
            else
                new = [new Insertion(super(:,j))];
            end
        end
        for k = 1:n_O   % onlooker bees
            if rand>0.5
                new = [new SWAP2(super(:,find(Roulette>rand,1)))];
            else
                new = [new Insertion(super(:,find(Roulette>rand,1)))];
            end
        end
        for L = 1:n_S
            new = [new seq(randperm(10))];
        end
        Food = new;
    end
    waitbar(trials/max_search, hWaitbar, 'Artificial Bee Colony Algorithm Optimization in process... ');
end
close(hWaitbar)
superior_Food = super(:,1);

cost2(superior_Food,INPUT)

figure;
plot(fitness_Max_history);
% hold on;
% plot(fitness_Mean_history);
% legend('Maximum','Mean');
xlabel('number of iteration');
ylabel('fitness value');
title('Fitness value vs. Number of iterations');

super'
