classdef PSO < matlab.mixin.Copyable
    % PSO Particle Swarm Optimization for Formation Pathfinding.
    %
    % (c) https://github.com/clausqr for ECI2015
    properties (GetAccess = public, SetAccess = protected)
        
        Particle           % Array of Particles
        ParticlesCount     % Number of Particles
        CostFunction       % Cost function used to weight the fitness
        
    end
    
    methods (Access = public)
        
        function obj = PSO(Agent, ParticleCount, CostFunction)
            % PSO Constructor
            obj = obj.reset(Agent, ParticleCount, CostFunction);
        end
        
        function obj = AddParticle(obj, a)
            % PSO Constructor
            n = obj.ParticlesCount;
            if (n == 0)
                obj.Particle.Agent = a;
            else
                obj.Particle(n+1).Agent = a;
            end
            obj.ParticlesCount = n+1;
        end
        
    end
    
    methods (Access = private)
        function obj = reset(obj, Agent, ParticleCount, CostFunction)
            obj.CostFunction = CostFunction;
            obj.ParticlesCount = 0;
            for k = 1:ParticleCount
                obj.AddParticle(Agent)
            end
        end
    end
end