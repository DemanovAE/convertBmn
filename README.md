# convertBmn

Converts 1 file dst format to 1 file the tree.root 

change path in scripts:
`#SBATCH -o your_path/%A_%a.out` - log
`#SBATCH -e your_path/%A_%a.err` - errors 
`digi_directory` - path to digits files 
`dst_directory` - path to dst files 
`CONVERTER_MACRO` - path to macro

star: ```sbatch name.sh path_to_lists/name_list.list out_dir part_to_run ```, where `part_to_run` from 0 to N, and N = (number of .dst files in name_list.list) / 999;

usage example:
``` sbatch run8_convert.sh /lustre/home/user/a/ademanov/bmn/run8_24.04.0.list /lustre/home/user/a/ademanov/bmn/data/run8_vf_24.04.0/ 0 ```

