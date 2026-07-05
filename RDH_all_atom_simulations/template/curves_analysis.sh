for i in `seq 1 60000`; do
  echo $i
  cp curves_twist_pdb/dnaMD$i.pdb dna.pdb
./../../../../../curves+/Cur+ <<!
&inp file=dna, lis=dnaout,
 lib=../../../../../curves+/standard, &end
2 1 -1 0 0
1:25
50:26
!

awk  '(NR>34 && NR<53){print $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9}' dnaout.lis >> curves_axis.txt
awk  '(NR>66 && NR<85){print $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10}' dnaout.lis >> curves_intra_bp.txt
awk  '(NR>96 && NR<115){print $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12}' dnaout.lis >> curves_inter_bp.txt
awk  '(NR>127 && NR<147){print $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12}' dnaout.lis >> curves_torsion_angle.txt
awk  '(NR>155 && NR<175){print $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10 "\t" $11 "\t" $12}' dnaout.lis >> curves_torsion_angle.txt
cut -c 18-30 dnaout.lis > c1.txt
cut -c 34-46 dnaout.lis > c2.txt
awk  '(NR>191 && NR<221){print $0}' c1.txt >> curves_minorgroove.txt
awk  '(NR>197 && NR<217){print $0}' c2.txt >> curves_majorgroove.txt
rm dna*
done
