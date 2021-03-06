### PBS preamble

#PBS -N {{ name }}
#PBS -M tburgin@umich.edu
#PBS -m ae

#PBS -A hbmayes_fluxod
#PBS -l qos=flux
#PBS -q fluxod

#PBS -l nodes={{ nodes }}:ppn={{ taskspernode }},mem={{ mem }}
#PBS -l walltime={{ walltime }}
#PBS -j oe
#PBS -V

### End PBS preamble

if [ -s "$PBS_NODEFILE" ] ; then
    echo "Running on"
    cat $PBS_NODEFILE
fi

if [ -d "$PBS_O_WORKDIR" ] ; then
    cd $PBS_O_WORKDIR
    echo "Running from $PBS_O_WORKDIR"
fi

### Start job commands below this line

cd as_working

{{ solver }} -O -i {{ inp }} -o {{ out }} -p {{ prmtop }} -c {{ inpcrd }} -r {{ rst }} -x {{ nc }}
