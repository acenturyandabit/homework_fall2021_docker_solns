mkdir /root/.mujoco
cd /root/.mujoco
wget https://www.roboti.us/download/mujoco200_linux.zip
unzip mujoco200_linux.zip
mv mujoco200_linux mujoco200
rm mujoco200_linux.zip
mv /root/setupScripts/mjkey.txt .

export LD_LIBRARY_PATH=/root/.mujoco/mujoco200/bin/