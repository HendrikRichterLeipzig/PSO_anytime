MATLAB files for calculating the results described in

Hendrik Richter, Is Chaotic Dynamics Enhancing Particle Swarm Optimization? An Anytime Performance Assessment. https://arxiv.org/abs/2611.34692


pso_exper_arcsine.m --> main file, calculates the PSO fitness for each iteration, each repetiton, each BBOB function and all arcsine values considered

pso_exper_uniform.m --> main file, calculates the PSO fitness for each iteration, each repetiton, each BBOB function and all uniform values considered



simple_pso1.m --> calculates the PSO run

bbob_problem_eval.m --> calculates the BBOB function handle

drive_schroeder.m --> calculates trajectory of the Schröder map 

drive_logistic.m --> calculates trajectory of the Logistic map 

drive_asym_tent.m --> calculates trajectory of the asymmetric tent map 

drive_schroeder_lyap.m --> calculates trajectory of the Schröder map and the Lyapunov exponent

drive_logistic_lyap.m --> calculates trajectory of the Logistic map and the Lyapunov exponent

drive_asym_tent_lyap.m --> calculates trajectory of the asymmetric tent map and the Lyapunov exponent

arcsine_dist_drive.m --> calculates Lyapunov exponents, mutual information and permutation entropy for the Schröder map, the Logistic map and Beta(0.5,0.5) random

uniform_dist_drive.m --> calculates Lyapunov exponents, mutual information and permutation entropy for the asymmetric tent map and Beta(1,1) random

mutual_information.m --> calculates the mutual information

permutation_entropy.m --> calculates permutation entropy
