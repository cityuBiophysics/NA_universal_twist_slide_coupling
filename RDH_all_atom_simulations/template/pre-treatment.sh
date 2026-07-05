 gmx grompp -f em.mdp -c water.gro -p topol.top -o ions.tpr -maxwarn 1
 echo 4 | gmx genion -s ions.tpr -o ion.gro -p topol.top  -nname CL -nn 0 -pname NA -np 48
 cp topol.top ion.top
