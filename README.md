# Mouse plasma Omics after severe Insulin resistance (S961) and different levels of β-cell ablation (Diphtheria Toxin)

## Experimental design

**Daniel Oropeza**, (prof. Herrera lab, Université de Genève, collaborator of prof. Regazzi) tested in multiple omics two different murine models of:

- severe insulin resistance
  - IR Control (PBS)
  - S961
  
- and multiple grades of beta-cells ablation
  - BCA Control (DT 0ng)
  - DT 5ng
  - DT 15ng
  - DT 120ng.

Blood was taken from mice in quadruplicate for three timepoints of each condition:

1. Day 0
2. Day 4
3. Day 10

He made also two NovaSeq6000 runs with QIAseq miRNA library and tried to analyze data autonomously with QIAseq miRNA Quantification tool, but he’d like to repeat the analysis with our sRNAbench and DESeq2 pipeline.

**Experimental design summary:**

- 6 conditions
- 4 mice per condition
- 3 timepoints

## Aim

**Biological question:**

_Which miRNAs change expression (up or down) among timepoints by condition?_

_Additional: Longitudinal profiling of miRNA expression changes._

## NGS runs

_Test:_
- 0ngs DT
- 120ngs
- S961

_Experiment:_
- Silent diabetes (~25-35%)
- Pre-diabetes(~50%)
- Diabetes (>85%)
- Near total beta-cell loss (~99%)
- S961
- PBS

## Analysis

Raw FASTQ reads were analyzed with sRNAbench docker image v0.0.6 (ugrbioinfo/srnatoolbox) on our server and these settings:

```
protocol=Q
species=GRCm39_mp
microRNA=mmu
libs=GRCm39_RNAcentral
libs=GRCm39_ncRNA
libs=GRCm39_cdna
tRNA=GRCm39_genomic_tRNA.fa
```
 Then, miRNA count matrices of both runs were extracted with R v4.2.2 as shown in:
 
 - `2023-09-05 miRNA count matrix`
 - `2023-09-18 miRNA count matrix test experiment`

 to perform differential expression (DE) analyses with DESeq2 (BioConductor v3.16) as reported in:
 
- `2023-09-19 DE miRNAs`
- `2023-10-16 DE miRNAs by Timepoint`
- `2023-11-16 DE miRNAs test experiment`

