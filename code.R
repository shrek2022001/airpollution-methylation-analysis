# ==== Simulated DNA Methylation vs PM2.5 Project ====

set.seed(123)

# ---- Simulate CpG beta matrix ----
n_samples <- 500
n_cpgs <- 10000
beta <- matrix(rbeta(n_samples * n_cpgs, 2, 5), nrow = n_cpgs, ncol = n_samples)
rownames(beta) <- paste0("cg", sprintf("%06d", 1:n_cpgs))
colnames(beta) <- paste0("Sample", 1:n_samples)

# ---- Simulate PM2.5 exposure (mean ~20) ----
pm25 <- rnorm(n_samples, mean = 20, sd = 5)

# ---- Add effect to 200 CpGs ----
true_dmrs <- sample(1:n_cpgs, 200)
for (i in true_dmrs) {
  beta[i, ] <- beta[i, ] + 0.2 * scale(pm25)
}
beta <- pmin(pmax(beta, 0), 1)  # Clip to valid beta range

# ---- Convert to M-values ----
Mval <- log2(beta / (1 - beta + 1e-6) + 1e-6)

# ---- Run limma ----
library(limma)
design <- model.matrix(~ pm25)
fit <- lmFit(Mval, design)
fit <- eBayes(fit)
top_dmrs <- topTable(fit, coef = 2, number = 200)

# ---- Save top DMRs ----
write.csv(top_dmrs, "top_200_simulated_dmrs.csv")

# ---- Plot volcano ----
plot(
  fit$coefficients[, 2],
  -log10(fit$p.value[, 2]),
  pch = 20,
  main = "Simulated PM2.5 vs Methylation",
  xlab = "Effect Size", ylab = "-log10(p-value)"
)
abline(h = -log10(0.05), col = "red", lty = 2)

# ---- Fake GO Enrichment (using missMethyl, optional) ----
# You can simulate GO terms if needed, but here's placeholder for real data
