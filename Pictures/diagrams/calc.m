% variables
testTime=1440;
x = 1:180;

% Generate addedConsumers - They switch on the tv and never turn it off
maxCostumersFluctuation = 3;
addedConsumers = zeros(1,testTime);
for a = 1:testTime
    
        change = round(maxCostumersFluctuation * rand(1));

        if(change>= 0)
            addedConsumers(a)=change;
        else
            addedConsumers(a)= 0;
        end

end

% Simulate the requests
for c = 1:180
    w = zeros(1,testTime);
    for i = 1:testTime
        w(i)=addedConsumers(i);
        for t = 1:i
            if(mod(t,c)==0 && t~=i)
                w(t)=w(t)+addedConsumers(t); 
            end
        end
    end
    y(c) = sum(w) ./testTime .*60 
end

% Plotting
plot(x,y,'Color','r','LineWidth',2)
title("Key-Anfragen pro Stunde");
subtitle("Simulation über 24 Stunden");
xlabel("Key-Rotationen pro x min")
ylabel("Anfragen pro Stunde")