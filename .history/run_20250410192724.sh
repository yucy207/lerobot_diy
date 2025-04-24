python lerobot/scripts/control_robot.py  --robot.type=robopanoptes   --robot.cameras='{}'   --control.type=calibrate   --control.arms='[\"main_follower\"]'


python lerobot/scripts/configure_motor.py --port COM5 --brand feetech --model sts3215 --baudrate 1000000 --ID 1

python lerobot/scripts/control_robot.py  --robot.type=robopanoptes --robot.cameras='{}'  --control.type=teleoperate
python lerobot/scripts/control_robot.py  --robot.type=robopanoptes  --control.type=teleoperate
python lerobot/scripts/control_robot.py  --robot.type=robopanoptes --control.display_data=true  --control.type=teleoperate

python lerobot/common/robot_devices/cameras/opencv.py --images-dir outputs/images_from_opencv_cameras

huggingface-cli login --token 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 --add-to-git-credential

python lerobot/scripts/control_robot.py \
  --robot.type=so100 \
  --control.type=record \
  --control.fps=30 \
  --control.single_task="Grasp a lego block and put it in the bin." \
  --control.repo_id=${HF_USER}/so100_test \
  --control.tags='["so100","tutorial"]' \
  --control.warmup_time_s=5 \
  --control.episode_time_s=30 \
  --control.reset_time_s=30 \
  --control.num_episodes=2 \
  --control.push_to_hub=true

python lerobot/scripts/visualize_dataset_html.py  --repo-id ${HF_USER}/so100_test --local-files-only 1