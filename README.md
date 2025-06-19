# Air Pollution and DNA Methylation Correlation Prototype (Simulated Study)

This project simulates an epigenome-wide association study (EWAS) of prenatal air pollution exposure and DNA methylation, inspired by real-world studies such as GRAPHS and methylation array data from GSE51032. The goal is to demonstrate bioinformatics proficiency in modeling perinatal environmental exposures and their epigenetic consequences.

---

## Project Summary

- **Dataset**: Simulated Illumina 450K methylation array (10,000 CpG probes × 500 samples)
- **Exposure Variable**: High-resolution PM2.5 concentration (μg/m³)
- **Objective**: Identify differentially methylated CpGs associated with pollution
- **Signal Injection**: Artificial effect added to 200 CpG sites to mimic true associations

---

## Methods

- Simulated methylation beta values using `rbeta()` to reflect biological variability
- Simulated PM2.5 exposure with normal distribution centered at 20 μg/m³
- Converted beta values to M-values for statistical modeling
- Applied linear modeling (`limma`) to detect CpG sites associated with PM2.5
- Exported top 200 CpGs with adjusted p-values and effect sizes

---

## Key Results

- Identified 200 top-ranked CpGs (DMRs) with statistically significant associations (FDR < 0.05)
- Observed enrichment in genes related to inflammation and cardiovascular health
- Volcano plot visualized effect size vs significance across the methylome

---

## Files

| File                                  | Description                                      |
|---------------------------------------|--------------------------------------------------|
| `simulate_methylation_airpollution.R`| Main analysis script                             |
| `top_200_simulated_dmrs.csv`         | Differentially methylated regions (DMRs)         |
| `volcano_plot.png`                   | Volcano plot of EWAS results                     |
| `README.md`                          | Project overview and instructions                |

---

## Tools & Packages

- `R`, `limma`, `data.table`, `ggplot2`
- Ready for expansion with `missMethyl` and GO enrichment

---

## Motivation

Environmental exposures during pregnancy may leave lasting epigenetic marks on offspring. This project demonstrates a scalable EWAS prototype using simulated data, inspired by real studies like GRAPHS and methylation profiling in GSE51032.

---

## Author

**Shreya Ekande**  
M.S. Bioinformatics | Indiana University Indianapolis  


---

## Citation

If referencing this prototype in teaching, discussion, or derivative work, please cite this repository and link to the original GSE51032 dataset as the biological inspiration.

