
# Time vs Strike
Times <- seq(1, 30, by=1)
Strikes <- seq(18, 78, by=1)

heat_matrix_EurCall <- as.matrix(read.csv("simulations/Strike_vs_time_EurCall_heatmap.csv", row.names = 1))
heatmap(heat_matrix_EurCall, Rowv=NA, Colv=NA)


heat_matrix_EurPut <- as.matrix(read.csv("simulations/Strike_vs_time_EurPut_heatmap.csv", row.names = 1))
heatmap(heat_matrix_EurPut, Rowv=NA, Colv=NA)


heat_matrix_AmericaCall  <- as.matrix(read.csv("simulations/Strike_vs_time_AmericaCall_heatmap.csv", row.names = 1))
heatmap(heat_matrix_AmericaCall, Rowv=NA, Colv=NA)

heat_matrix_AmericaPut <- as.matrix(read.csv("simulations/Strike_vs_time_AmerciaPut_heatmap.csv", row.names = 1))
heatmap(heat_matrix_AmericaPut, Rowv=NA, Colv=NA)



# Time vs r
Times <- seq(1, 30, by=1)
rs <- seq(0.01, 0.2, by=0.01)

heat_matrix_EurCall <- as.matrix(read.csv("simulations/r_vs_Time_EurCall_heatmap.csv", row.names = 1))
heatmap(heat_matrix_EurCall, Rowv=NA, Colv=NA)


heat_matrix_EurPut <- as.matrix(read.csv("simulations/r_vs_Time_EurPut_heatmap.csv", row.names = 1))
heatmap(heat_matrix_EurPut, Rowv=NA, Colv=NA)


heat_matrix_AmericaCall  <- as.matrix(read.csv("simulations/r_vs_Time_AmericaCall_heatmap.csv", row.names = 1))
heatmap(heat_matrix_AmericaCall, Rowv=NA, Colv=NA)

heat_matrix_AmericaPut <- as.matrix(read.csv("simulations/r_vs_Time_AmerciaPut_heatmap.csv", row.names = 1))
heatmap(heat_matrix_AmericaPut, Rowv=NA, Colv=NA)


# Sigma vs r
Sigmas <- seq(0.01, 0.6, by=0.01)
rs <- seq(0.001, 0.2, by=0.001)


heat_matrix_EurCall <- as.matrix(read.csv("simulations/r_vs_Sigma_EurCall_heatmap.csv", row.names = 1))
heatmap(heat_matrix_EurCall, Rowv=NA, Colv=NA)


heat_matrix_EurPut <- as.matrix(read.csv("simulations/r_vs_Sigma_EurPut_heatmap.csv", row.names = 1))
heatmap(heat_matrix_EurPut, Rowv=NA, Colv=NA)


heat_matrix_AmericaCall  <- as.matrix(read.csv("simulations/r_vs_Sigma_AmericaCall_heatmap.csv", row.names = 1))
heatmap(heat_matrix_AmericaCall, Rowv=NA, Colv=NA)

heat_matrix_AmericaPut <- as.matrix(read.csv("simulations/r_vs_Sigma_AmerciaPut_heatmap.csv", row.names = 1))
heatmap(heat_matrix_AmericaPut, Rowv=NA, Colv=NA)




# Strike vs S0
Strikes <- seq(18, 78, by=1)
S0s <- seq(1, 100, by=1)



heat_matrix_EurCall <- as.matrix(read.csv("simulations/s0_vs_Strike_EurCall_heatmap.csv", row.names = 1))
heatmap(heat_matrix_EurCall, Rowv=NA, Colv=NA)


heat_matrix_EurPut <- as.matrix(read.csv("simulations/s0_vs_Strike_EurPut_heatmap.csv", row.names = 1))
heatmap(heat_matrix_EurPut, Rowv=NA, Colv=NA)


heat_matrix_AmericaCall  <- as.matrix(read.csv("simulations/s0_vs_Strike_AmericaCall_heatmap.csv", row.names = 1))
heatmap(heat_matrix_AmericaCall, Rowv=NA, Colv=NA)

heat_matrix_AmericaPut <- as.matrix(read.csv("simulations/s0_vs_Strike_AmerciaPut_heatmap.csv", row.names = 1))
heatmap(heat_matrix_AmericaPut, Rowv=NA, Colv=NA)



# Time vs S0
Times <- seq(1, 30, by=1)
S0s <- seq(1, 100, by=1)


heat_matrix_EurCall <- as.matrix(read.csv("simulations/s0_vs_time_EurCall_heatmap.csv", row.names = 1))
heatmap(heat_matrix_EurCall, Rowv=NA, Colv=NA)


heat_matrix_EurPut <- as.matrix(read.csv("simulations/s0_vs_time_EurPut_heatmap.csv", row.names = 1))
heatmap(heat_matrix_EurPut, Rowv=NA, Colv=NA)


heat_matrix_AmericaCall  <- as.matrix(read.csv("simulations/s0_vs_time_AmericaCall_heatmap.csv", row.names = 1))
heatmap(heat_matrix_AmericaCall, Rowv=NA, Colv=NA)

heat_matrix_AmericaPut <- as.matrix(read.csv("simulations/s0_vs_time_AmerciaPut_heatmap.csv", row.names = 1))
heatmap(heat_matrix_AmericaPut, Rowv=NA, Colv=NA)



