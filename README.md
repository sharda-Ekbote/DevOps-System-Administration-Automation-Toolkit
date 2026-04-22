## 🛠️ DevOps & System Administration Toolkit
This repository contains production-grade scripts designed to automate system monitoring, resource management, 
and infrastructure maintenance.

## Script Catalog & Skills Mapping


| Script Name | Production Use Case | Core Linux Skills |

| monitor_cpu.sh | Performance Guard: Alerts when CPU spikes and identifies "heavy" processes. | top, ps, awk, grep |

| monitor_memory.sh | Memory Watchdog: Prevents OOM (Out of Memory) crashes by tracking RAM/Swap. | free, bc, threshold logic |

| monitor_disk.sh | Storage Alert: Monitors root partition health to prevent system freezes. | df, sed, awk |

| manage_storage.sh | Infrastructure Setup: Automates EBS/Disk mounting with UUID persistence. | lsblk, blkid, fstab |

| archive_logs.sh | Cost Optimization: Compresses large logs to save space and reduce storage costs. | find, gzip, xargs |

| audit_ports.sh | Security & Network: Audits listening ports (80/443) and identifies active services. | ss, lsof, regex |

| bulk_cleanup.sh | Safe Maintenance: Safely deletes massive file lists with user confirmation. | xargs, read, file validation |

Prerequisites:

Ensure the scripts have execution permissions:
chmod +x scripts/*.sh

#Installation & Automation
To run these scripts as background monitors, add them to the system Crontab:

# Open crontab editor
crontab -e

# Run CPU monitor every 5 minutes
*/5 * * * * /path/to/monitor_cpu.sh >> /var/log/system_monitor.log
