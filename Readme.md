**Descriptions:**

This repository stores codes and data for the paper "Break down the Decentralization-Security-Privacy Trilemma in Management of Distributed Energy System"
https://www.nature.com/articles/s41467-024-48860-7

We provide scripts for simulations that can be run on a single PC without further preparation of the hardwares and their network connections, which can be found in directory "blockchain_preparations" and "blockchain".

We also provide scripts for simple simulations of the iterative procedure, which can be found in the "autonomous_optimization" directory. The data for the 60 node distribution grid in Yingkou city is also in this folder.

**Dependencies & Installation**

For the blockchain program, the following are necessary python packages that have been imported in our program for the miners:
httpx, aiohttp, socketio, flask, flask_socketio, flask_executor, OpenSSL, click, flask_sqlalchemy.

To successfully employ flask_sqlalchemy, one have to install databases on the computer. The authors used mysql and pymysql. As for the database username and password during installation, please refer to miner_main_template.py and personal_settings.ini.

The follow are necessary python packages for the workers to solve the subproblems:
cvxpy, gurobipy
please refer to "<https://cvxpy.org>" for  more information.

For the simulation in "autonomous_optimization", scipy, cvxpy & numpy are necessary.

As for the version, use pip tool to install the latest would be workable.

**Running**

**Blockchain Communication Test**

For the blockchain, the build.bat batch file calls the python scripts in blockchain_preparations to prepare necessary modelling and configuration data for DES owners, miners, and the computation parties.
build.bat for 10 DES test case and build37.bat for the modified IEEE 37 node test case.

In the folders named as blockchain/test-xxx, call start_miners.bat to start the miners to initialize the blockchain, call start_DESs.bat to simulate the DES owners, and call start_workers.bat to run the computation tasks. 

Finally, run start_iterations to send post messages to url "<https://127.0.0.1:5000/agent/doPrePrepareGenesis>" to start the iterative communications.

**Simulation of the iteration process**

Run python test_decentralized_optimization.py in "autonomous_optimization" to initiate the simulation test on the distribution grid in Yingkou City. 

Due to the memory usage and intensive calculation burden, the simulation time might be long. In this case, we advise to set T in formulation.py from 96 to 24 to simulate using a dispatch interval of 1 hour.

A typical output after convergence would be:

```
Simulation Start, timestamp:1707194696.4879556
Iteration: 1443:  Residual：9.9668335132308e-05,  6.706765707420459e-05  Worst simulation time of each DES: 0.015254735946655273:  Worst simulation time for DES:7 Time consumption for this iteration: 0.18224000930786133
Simulation End, timestamp:1707195050.84149
Time Consumption:354.35353446006775

```

There are other parameters in the codes that can be set for further simulations. Please refer to the source code and data.

Contact us if you have further questions on deployment of the code: chenqun@tsinghua.edu.cn, sqh20@mails.tsinghua.edu.cn


