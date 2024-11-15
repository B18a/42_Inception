# # Ensure TimeoutStartSec is set to 60
# sed -i '/^TimeoutStartSec=/c TimeoutStartSec=60' /lib/systemd/system/redis-server.service || sed -i '/^\[Service\]/a TimeoutStartSec=60' /lib/systemd/system/redis-server.service

# # Ensure TimeoutStopSec is set to 60
# sed -i '/^TimeoutStopSec=/c TimeoutStopSec=60' /lib/systemd/system/redis-server.service || sed -i '/^\[Service\]/a TimeoutStopSec=60' /lib/systemd/system/redis-server.service



# Remove any duplicate lines for TimeoutStartSec or TimeoutStopSec
sed -i '/^TimeoutStartSec=/d' /lib/systemd/system/redis-server.service
sed -i '/^TimeoutStopSec=/d' /lib/systemd/system/redis-server.service

# Add or replace the lines
sed -i '/^\[Service\]/a TimeoutStartSec=60\nTimeoutStopSec=60' /lib/systemd/system/redis-server.service
