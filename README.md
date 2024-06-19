# convertBmn

Converts 1 file dst format to 1 file the tree.root

change path in scripts:
1. `#SBATCH -o your_path/%A_%a.out` - log
2. `#SBATCH -e your_path/%A_%a.err` - errors 
3. `CONVERTER_MACRO` - path to macro

star: 
`sbatch name_scripts.sh path_to_lists/name_list.list out_dir part_to_run`

where `part_to_run` from 0 to N, and N = (number of .dst `files in name_list.list`) / 999; name_scripts = `run8_convert_nica.sh` for NICA claster or `run8_convert_hydra.sh` for hydra claster.

usage example:
`sbatch run8_convert_hydra.sh /lustre/home/user/a/ademanov/bmn/run8_24.04.0.list /lustre/home/user/a/ademanov/bmn/data/run8_vf_24.04.0/ 0`

