# dinova_workflow
The workflow with the robot is the following:
1. ssh into the robot via <br> dingo1: `ssh lkehler@192.168.0.121` or dingo2: `ssh lkehler@192.168.0.122` <br> username: lkehler, passowrd: IchbinLeon
2. Stop current ros nodes `sudo systemctl stop ros.service`
3. On the robot: bring up the ros master `roslaunch dinova_bringup dinova.launch`
4. Check that the controller is connected to the robot!!!
5. On the local machine for every terminal, source ros, setup communication to the robot, and export its name via <br> `source ./robot_workflow/set_terminal_ros.sh`
6. In one terminal launch dinova utils: `code`
7. In another window launch the fabrics client: `code`
8. In anothe window launch what you want to do


* procedure for running a whole fabrics plan: 1) bringup 2) launch dinovas utils 3) launch fabrics command 4) action service 
specific on https://github.com/INTERACT-tud-amr/dinova_motion/tree/main/dinova_fabrics_wrapper

possibly change goal in https://github.com/INTERACT-tud-amr/dinova_motion/blob/main/dinova_fabrics_wrapper/scripts/dinova_pose_client.py
