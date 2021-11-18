module use /mod/scgc
module load anaconda3/2019.07
module load bbmap

for i in *R1*.fastq.gz
do
export name1=$i
export name2=${i/R1/R2}
echo $name2
reformat.sh -Xmx20g threads=20 in=$name1 in2=$name2 out="5K_"$name1 out2="5K_"$name2 samplereadstarget=5000 sampleseed=7
done
