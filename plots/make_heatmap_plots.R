library(reshape)
library(ggplot2)



# Time vs Strike
Times <- seq(1, 30, by=1)
Strikes <- seq(18, 78, by=1)

heat_matrix_EurCall <- as.matrix(read.csv("simulations/Strike_vs_time_EurCall_heatmap.csv", row.names = 1))
dimnames(heat_matrix_EurCall) <- list(Strikes, Times)
heat_df_strike_time <- cbind(melt(heat_matrix_EurCall, varnames = c("Strikes", "Times")), "continent" = "Europejskie", "verb" = "call")

# ggplot(heat_df_strike_time, aes(x = Strikes, y = Times, fill = value))+
#   geom_tile() +
#   # coord_fixed()+
#   scale_fill_viridis_c()+
#   theme_minimal()



# heatmap(heat_matrix_EurCall, Rowv=NA, Colv=NA)


heat_matrix_EurPut <- as.matrix(read.csv("simulations/Strike_vs_time_EurPut_heatmap.csv", row.names = 1))
dimnames(heat_matrix_EurPut) <- list(Strikes, Times)
heat_df_strike_time <- rbind(heat_df_strike_time,cbind(melt(heat_matrix_EurPut, varnames = c("Strikes", "Times")), "continent" = "Europejskie", "verb" = "put"))

# ggplot(heat_df_strike_time, aes(x = Strikes, y = Times, fill = value))+
#   geom_tile() +
#   # coord_fixed()+
#   scale_fill_viridis_c()+
#   theme_minimal()

heat_matrix_AmericaCall  <- as.matrix(read.csv("simulations/Strike_vs_time_AmericaCall_heatmap.csv", row.names = 1))
dimnames(heat_matrix_AmericaCall) <- list(Strikes, Times)
heat_df_strike_time <- rbind(heat_df_strike_time,cbind(melt(heat_matrix_AmericaCall, varnames = c("Strikes", "Times")), "continent" = "Amerykańskie", "verb" = "call"))

heat_matrix_AmericaPut <- as.matrix(read.csv("simulations/Strike_vs_time_AmerciaPut_heatmap.csv", row.names = 1))
dimnames(heat_matrix_AmericaPut) <- list(Strikes, Times)
heat_df_strike_time <- rbind(heat_df_strike_time,cbind(melt(heat_matrix_AmericaPut, varnames = c("Strikes", "Times")), "continent" = "Amerykańskie", "verb" = "put"))


g1 <- ggplot(heat_df_strike_time, aes(x = Strikes, y = Times, fill = value))+
  geom_tile() +
  facet_grid(continent~verb)+
  scale_fill_viridis_c()+
  theme_minimal()+
  guides(fill = guide_colorbar(title = "Cena"))+
  labs(x = "Strike", y = "T")

ggsave("plots/Heatmaps/Strike_vs_time.png", g1)

# png("plots/Heatmaps/Strike_vs_time.png")
# ggplot(heat_df_strike_time, aes(x = Strikes, y = Times, fill = value))+
#   geom_tile() +
#   facet_grid(continent~verb)+
#   scale_fill_viridis_c()+
#   theme_minimal()+
#   guides(fill = guide_colorbar(title = "Cena"))+
#   labs(x = "Strike", y = "T")
# dev.off()


# Time vs r
Times <- seq(1, 30, by=1)
rs <- seq(0.01, 0.2, by=0.01)

heat_matrix_EurCall <- as.matrix(read.csv("simulations/r_vs_Time_EurCall_heatmap.csv", row.names = 1))
dimnames(heat_matrix_EurCall) <- list(rs, Times)
heat_df_r_time <- cbind(melt(heat_matrix_EurCall, varnames = c("r", "Times")), "continent" = "Europejskie", "verb" = "call")


heat_matrix_EurPut <- as.matrix(read.csv("simulations/r_vs_Time_EurPut_heatmap.csv", row.names = 1))
dimnames(heat_matrix_EurPut) <- list(rs, Times)
heat_df_r_time <- rbind(heat_df_r_time,cbind(melt(heat_matrix_EurPut, varnames = c("r", "Times")), "continent" = "Europejskie", "verb" = "put"))


heat_matrix_AmericaCall  <- as.matrix(read.csv("simulations/r_vs_Time_AmericaCall_heatmap.csv", row.names = 1))
dimnames(heat_matrix_AmericaCall) <- list(rs, Times)
heat_df_r_time <- rbind(heat_df_r_time,cbind(melt(heat_matrix_AmericaCall, varnames = c("r", "Times")), "continent" = "Amerykańskie", "verb" = "call"))

heat_matrix_AmericaPut <- as.matrix(read.csv("simulations/r_vs_Time_AmerciaPut_heatmap.csv", row.names = 1))
dimnames(heat_matrix_AmericaPut) <- list(rs, Times)
heat_df_r_time <- rbind(heat_df_r_time,cbind(melt(heat_matrix_AmericaPut, varnames = c("r", "Times")), "continent" = "Amerykańskie", "verb" = "put"))



g2 <- ggplot(heat_df_r_time, aes(x = r, y = Times, fill = value))+
  geom_tile() +
  facet_grid(continent~verb)+
  scale_fill_viridis_c()+
  theme_minimal()+
  guides(fill = guide_colorbar(title = "Cena"))+
  labs(x = "r", y = "T")

ggsave("plots/Heatmaps/r_vs_time.png", g2)


# Sigma vs r
Sigmas <- seq(0.1, 0.6, by=0.01)
rs <- seq(0.001, 0.2, by=0.001)


heat_matrix_EurCall <- as.matrix(read.csv("simulations/r_vs_Sigma_EurCall_heatmap.csv", row.names = 1))
dimnames(heat_matrix_EurCall) <- list(rs, Sigmas)
heat_df_r_sigma <- cbind(melt(heat_matrix_EurCall, varnames = c("r", "Sigma")), "continent" = "Europejskie", "verb" = "call")


heat_matrix_EurPut <- as.matrix(read.csv("simulations/r_vs_Sigma_EurPut_heatmap.csv", row.names = 1))
dimnames(heat_matrix_EurPut) <- list(rs, Sigmas)
heat_df_r_sigma <- rbind(heat_df_r_sigma,cbind(melt(heat_matrix_EurPut, varnames = c("r", "Sigma")), "continent" = "Europejskie", "verb" = "put"))


heat_matrix_AmericaCall  <- as.matrix(read.csv("simulations/r_vs_Sigma_AmericaCall_heatmap.csv", row.names = 1))
dimnames(heat_matrix_AmericaCall) <- list(rs, Sigmas)
heat_df_r_sigma <- rbind(heat_df_r_sigma,cbind(melt(heat_matrix_AmericaCall, varnames = c("r", "Sigma")), "continent" = "Amerykańskie", "verb" = "call"))

heat_matrix_AmericaPut <- as.matrix(read.csv("simulations/r_vs_Sigma_AmerciaPut_heatmap.csv", row.names = 1))
dimnames(heat_matrix_AmericaPut) <- list(rs, Sigmas)
heat_df_r_sigma <- rbind(heat_df_r_sigma,cbind(melt(heat_matrix_AmericaPut, varnames = c("r", "Sigma")), "continent" = "Amerykańskie", "verb" = "put"))

g3 <- ggplot(heat_df_r_sigma, aes(x = r, y = Sigma, fill = value))+
  geom_tile() +
  facet_grid(continent~verb)+
  scale_fill_viridis_c()+
  theme_minimal()+
  guides(fill = guide_colorbar(title = "Cena"))+
  labs(x = "r", y = expression(sigma))

ggsave("plots/Heatmaps/r_vs_sigma.png", g3)


# Strike vs S0
Strikes <- seq(18, 78, by=1)
S0s <- seq(1, 100, by=1)



heat_matrix_EurCall <- as.matrix(read.csv("simulations/s0_vs_Strike_EurCall_heatmap.csv", row.names = 1))
dimnames(heat_matrix_EurCall) <- list(S0s, Strikes)
heat_df_strike_s0 <- cbind(melt(heat_matrix_EurCall, varnames = c("S0", "Strike")), "continent" = "Europejskie", "verb" = "call")


heat_matrix_EurPut <- as.matrix(read.csv("simulations/s0_vs_Strike_EurPut_heatmap.csv", row.names = 1))
dimnames(heat_matrix_EurPut) <- list(S0s, Strikes)
heat_df_strike_s0 <- rbind(heat_df_strike_s0,cbind(melt(heat_matrix_EurPut, varnames = c("S0", "Strike")), "continent" = "Europejskie", "verb" = "put"))



heat_matrix_AmericaCall  <- as.matrix(read.csv("simulations/s0_vs_Strike_AmericaCall_heatmap.csv", row.names = 1))
dimnames(heat_matrix_AmericaCall) <- list(S0s, Strikes)
heat_df_strike_s0 <- rbind(heat_df_strike_s0,cbind(melt(heat_matrix_AmericaCall, varnames = c("S0", "Strike")), "continent" = "Amerykańskie", "verb" = "call"))

heat_matrix_AmericaPut <- as.matrix(read.csv("simulations/s0_vs_Strike_AmerciaPut_heatmap.csv", row.names = 1))
dimnames(heat_matrix_AmericaPut) <- list(S0s, Strikes)
heat_df_strike_s0 <- rbind(heat_df_strike_s0,cbind(melt(heat_matrix_AmericaPut, varnames = c("S0", "Strike")), "continent" = "Amerykańskie", "verb" = "put"))


g4 <- ggplot(heat_df_strike_s0, aes(x = S0, y = Strike, fill = value))+
  geom_tile() +
  facet_grid(continent~verb)+
  scale_fill_viridis_c()+
  theme_minimal()+
  guides(fill = guide_colorbar(title = "Cena"))+
  labs(x = "S0", y = "Strike")

ggsave("plots/Heatmaps/S0_vs_strike.png", g4)



# Time vs S0
Times <- seq(1, 30, by=1)
S0s <- seq(1, 100, by=1)


heat_matrix_EurCall <- as.matrix(read.csv("simulations/s0_vs_time_EurCall_heatmap.csv", row.names = 1))
dimnames(heat_matrix_EurCall) <- list(S0s, Times)
heat_df_time_s0 <- cbind(melt(heat_matrix_EurCall, varnames = c("S0", "Time")), "continent" = "Europejskie", "verb" = "call")


heat_matrix_EurPut <- as.matrix(read.csv("simulations/s0_vs_time_EurPut_heatmap.csv", row.names = 1))
dimnames(heat_matrix_EurPut) <- list(S0s, Times)
heat_df_time_s0 <- rbind(heat_df_time_s0,cbind(melt(heat_matrix_EurPut, varnames = c("S0", "Time")), "continent" = "Europejskie", "verb" = "put"))


heat_matrix_AmericaCall  <- as.matrix(read.csv("simulations/s0_vs_time_AmericaCall_heatmap.csv", row.names = 1))
dimnames(heat_matrix_AmericaCall) <- list(S0s, Times)
heat_df_time_s0 <- rbind(heat_df_time_s0,cbind(melt(heat_matrix_AmericaCall, varnames = c("S0", "Time")), "continent" = "Amerykańskie", "verb" = "call"))

heat_matrix_AmericaPut <- as.matrix(read.csv("simulations/s0_vs_time_AmerciaPut_heatmap.csv", row.names = 1))
dimnames(heat_matrix_AmericaPut) <- list(S0s, Times)
heat_df_time_s0 <- rbind(heat_df_time_s0,cbind(melt(heat_matrix_AmericaPut, varnames = c("S0", "Time")), "continent" = "Amerykańskie", "verb" = "put"))

g5 <- ggplot(heat_df_time_s0, aes(x = S0, y = Time, fill = value))+
  geom_tile() +
  facet_grid(continent~verb)+
  scale_fill_viridis_c()+
  theme_minimal()+
  guides(fill = guide_colorbar(title = "Cena"))+
  labs(x = "S0", y = "Time")

ggsave("plots/Heatmaps/S0_vs_time.png", g5)


