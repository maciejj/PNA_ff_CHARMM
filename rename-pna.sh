#!/bin/bash
#use to rename atoms in PNA PDB to follow .str file

sed -e "s/C'/C /" $1 > $1.rename
sed -i -e "/PN/ s/C2'/C6'/" $1.rename
sed -i -e "/PN/ s/C5'/C2'/" $1.rename
sed -i -e "/PN/ s/C3'/C5'/" $1.rename
sed -i -e "/PN/ s/N4'/N2'/" $1.rename
sed -i -e "/PN/ s/N1'/N  /" $1.rename
sed -i -e "/PN/ s/C7'/C3'/" $1.rename
sed -i -e "/PN/ s/O7'/O3'/" $1.rename
sed -i -e "/PN/ s/C8'/C4'/" $1.rename
