#!/bin/sh
#
#SBATCH --job-name=concat.tree             # Job Name
#SBATCH --nodes=1             # 40 nodes
#SBATCH --ntasks-per-node=10              # 40 CPU allocation per Task
#SBATCH --partition=bi        # Name of the Slurm partition used
#SBATCH --chdir=/home/d669d153/work/Wphyllowgs/iqtree/mito    # Set working d$
#SBATCH --mem-per-cpu=1gb            # memory requested
#SBATCH --time=3000

##get conversion script
wget https://raw.githubusercontent.com/edgardomortiz/vcf2phylip/master/vcf2phylip.py
##load python
module load python
##covert file
python vcf2phylip.py -i /home/d669d153/work/Wphyllowgs/iqtree/mito/mitogenomes.vcf.gz

#-s specifies the input sequence data
#-m MFP specifies to perform model testing and use the best model of sequence evolution
#-bb specifies performing 1000 ultrafast bootstraps to assess support
#-nt AUTO allows the program to use the optimal number of threads (10 specified here)
#/home/d669d153/work/iqtree-2.3.1-Linux/bin/iqtree2 -s phyllo.autosomal.filtered.1kbthinned.SNPs.min4.phy -m MFP+ASC -bb 1000 -nt AUTO
/home/d669d153/work/iqtree-2.3.1-Linux/bin/iqtree2 -s mitogenomes.min4.phy -m MFP -bb 1000 -nt AUTO
