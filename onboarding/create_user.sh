#!/bin/bash
# ============================================================
# User Onboarding Script
# Author: Afzal Hazan
# Description: Creates a Linux user, sets password policy,
#              adds to groups, and creates home directory
# Usage: sudo ./create_user.sh <username> <fullname> <group>
# ============================================================

set -euo pipefail

USERNAME=$1
FULLNAME=$2
GROUP=$3
LOG="/var/log/user_onboarding.log"

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG"; }

# Validate input
if [[ $# -lt 3 ]]; then
  echo "Usage: $0 <username> <fullname> <group>"
  exit 1
fi

# Create user
log "Creating user: $USERNAME ($FULLNAME)"
useradd -m -c "$FULLNAME" -s /bin/bash "$USERNAME"

# Set temporary password + force change on first login
echo "$USERNAME:TempPass@$(date +%Y)!" | chpasswd
passwd --expire "$USERNAME"

# Add to group
usermod -aG "$GROUP" "$USERNAME"
log "Added $USERNAME to group: $GROUP"

# Set permissions
chmod 750 /home/"$USERNAME"

log "✅ User $USERNAME created successfully"
