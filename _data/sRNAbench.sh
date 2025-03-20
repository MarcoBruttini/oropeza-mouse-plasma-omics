# Esegue la quantificazione con sRNAbench
for fastq in /shared/shared_folder/input/fastq/*.fastq.gz
do
  sample=$(basename "${fastq%%_S*}")
  sample="${sample%.fastq.gz}"
  echo "$sample"
  echo
	sRNAbench \
		p=12 \
		input="$fastq" \
		output=/shared/shared_folder/output/"$sample" \
		protocol=Q \
		species=GRCm39_mp \
		microRNA=mmu \
		libs=GRCm39_RNAcentral \
		libs=GRCm39_ncRNA \
		libs=GRCm39_cdna \
		tRNA=GRCm39_genomic_tRNA.fa
done

cd /bioinfo/pipelines/sRNAbench/output
for sample in `ls -d *`
 do
  echo -n "Compressing sample $sample..."
  zip -rmqT "/mnt/FdmComune/Progetti LAB/Beta-cell ablation in mice/Analysis/_data/sRNAbench/Experiment/$sample.zip" "$sample"
  echo " done."
 done
