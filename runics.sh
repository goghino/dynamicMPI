#!/bin/bash

nworkers=2
comp_nodes=$(($nworkers+1))

sbatch <<-_EOF
#!/bin/bash
#SBATCH --job-name=dynamicMPI
#SBATCH --nodes=${comp_nodes}
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:02:00
#SBATCH --output=out.o

#working only with openmpi build with PMI support
srun -n 1 ./manager ${nworkers}

#error on mpi init
#./manager ${nworkers}

#timeout
#/home/kardos/openmpi-2.0.1/bin/mpirun -np 1 ./manager ${nworkers}

#error on MPI_comm_spawn
#mpirun -np 1 ./manager ${nworkers}
_EOF
