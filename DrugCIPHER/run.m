addpath(genpath(pwd));
d2t_hash = getD2tHash('d2t_3545.txt');
disp('pre-processing ppi matrix...\n');
ppi_mat = preProcess('PPI_13388.txt');
disp('getting network matrix...\n');
network_mat = getNetworkMat(ppi_mat, @measureDistance);
disp('getting gene2drug closeness...\n');
g2d_closeness = getG2dCloseness(network_mat, d2t_hash, @measureCloseness);
disp('getting target profile...\n');
c2d_similarity = load('cs_3545.txt');
c2d_similarity = c2d_similarity./100;
c2d_similarity = c2d_similarity.^8;
profile = getProfile(g2d_closeness, c2d_similarity, @measureScore);