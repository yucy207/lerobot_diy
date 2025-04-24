python lerobot/scripts/control_robot.py  --robot.type=robopanoptes   --robot.cameras='{}'   --control.type=calibrate   --control.arms='[\"main_follower\"]'


python lerobot/scripts/configure_motor.py --port COM5 --brand feetech --model sts3215 --baudrate 1000000 --ID 1

python lerobot/scripts/control_robot.py  --robot.type=robopanoptes --robot.cameras='{}'  --control.type=teleoperate
python lerobot/scripts/control_robot.py  --robot.type=robopanoptes  --control.type=teleoperate
python lerobot/scripts/control_robot.py  --robot.type=robopanoptes --control.display_data=true  --control.type=teleoperate
python lerobot/common/robot_devices/cameras/opencv.py --images-dir outputs/images_from_opencv_cameras