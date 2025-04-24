python lerobot/scripts/control_robot.py  --robot.type=robopanoptes   --robot.cameras='{}'   --control.type=calibrate   --control.arms='[\"main_follower\"]'


python lerobot/scripts/configure_motor.py --port COM5 --brand feetech --model sts3215 --baudrate 1000000 --ID 1

python lerobot/scripts/control_robot.py  --robot.type=robopanoptes --robot.cameras='{}'  --control.type=teleoperate
python lerobot/scripts/control_robot.py  --robot.type=robopanoptes  --control.type=teleoperate
python lerobot/scripts/control_robot.py  --robot.type=robopanoptes --control.display_data=true  --control.type=teleoperate

python lerobot/common/robot_devices/cameras/opencv.py --images-dir outputs/images_from_opencv_cameras

huggingface-cli login --token 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 --add-to-git-credential
$HF_USER = (huggingface-cli whoami | Select-Object -First 1)
Write-Host "HF_USER: $HF_USER"
python lerobot/scripts/control_robot.py `
  --robot.type=robopanoptes `
  --control.type=record `
  --control.fps=30 `
  --control.single_task="Grasp a lego block and put it in the bin." `
  --control.repo_id="${HF_USER}/robopanoptes_test" `
  --control.tags='[\"robopanoptes\",\"tutorial\"]' `
  --control.warmup_time_s=5 `
  --control.episode_time_s=30 `
  --control.reset_time_s=30 `
  --control.num_episodes=1 `
  --control.push_to_hub=true

python lerobot/scripts/visualize_dataset.py `
  --repo-id "${HF_USER}/robopanoptes_test" `
  --episode-index 0
