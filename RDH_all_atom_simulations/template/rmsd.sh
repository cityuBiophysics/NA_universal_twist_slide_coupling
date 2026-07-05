echo "a P O1P O2P O5' C5' C4' O4' C3' O3' C2' C1' O2'" > tmpq
echo "r DA DC DG DT A C G U" >> tmpq
echo "a H*" >> tmpq
echo "15 & !16" >> tmpq
echo "q" >> tmpq
gmx make_ndx -f em.gro -o < tmpq
echo 14 14 | gmx rms -f traj3.xtc -s md.tpr -n -o -fit rot+trans
awk 'NR>19{print $2}' rmsd.xvg > rmsd_backbone.txt
echo 14 17 | gmx rms -f traj3.xtc -s md.tpr -n -o -fit rot+trans
awk 'NR>19{print $2}' rmsd.xvg > rmsd_heavy.txt
rm "#"*
