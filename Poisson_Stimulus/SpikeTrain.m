%% Simulation Methodology Explanation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The simulation assumes that the number of spikes being generated at every
%time step is a poisson distribution with the mean number of spikes
%generated per time step given by:
%
%lambda = (rate of spiking)*(length of time interval)
%
%The probability of more than 1 spike being generated in a small enough
%time interval will be negligible (because the value of 'lambda' will be
%small enough).
%
%A random number is generated from this Poisson distribution at every time 
%step. If the generated number is greater than zero, a spike is issued in
%the time step.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Set Pre-Defined Parameters of Simulation (User Input)
rate = 1/5; %spikes/ms
timeStep = 0.1; %ms
spikeTrainLength = 100; %ms


%% Generate Relevant Variables and Perform Simulation
t = (timeStep:timeStep:spikeTrainLength); %vector for time steps
lambda = timeStep*rate; %Poisson parameter to calculate probabilities
pd = makedist('Poisson', 'lambda', lambda); %Poisson distribution for sampling random number
spikeTrain = zeros(1,length(t)); %output variable

for i = 1:length(t)
    simStep = random(pd, 1);
    if(simStep<1) 
        spikeTrain(1,i)=0;
    else
        spikeTrain(1,i)=1;
    end
end


%% Generate plot of spike train
bar(t,spikeTrain);


