#!/usr/bin/env bash
# Fastfetch-style banner for interactive Bash login shells.
[[ $- == *i* ]] || return 0
[[ -n "${DEBIAN_BANNER_SHOWN:-}" ]] && return 0
export DEBIAN_BANNER_SHOWN=1

C_BLUE=$'\033[1;34m'; C_CYAN=$'\033[1;36m'; C_GREEN=$'\033[1;32m'; C_RESET=$'\033[0m'
. /etc/os-release 2>/dev/null || true
OS_NAME="${PRETTY_NAME:-Debian GNU/Linux}"
ARCH="$(uname -m 2>/dev/null || echo unknown)"
KERNEL="$(uname -r 2>/dev/null || echo unknown)"
UPTIME="$(uptime -p 2>/dev/null | sed 's/^up //' || echo unknown)"
CPU_COUNT="$(nproc 2>/dev/null || echo unknown)"
MEM_TOTAL="$(awk '/MemTotal/ {printf "%.1f GiB", $2/1048576}' /proc/meminfo 2>/dev/null)"
MEM_AVAIL="$(awk '/MemAvailable/ {printf "%.1f GiB", $2/1048576}' /proc/meminfo 2>/dev/null)"
DISK_INFO="$(df -h /data 2>/dev/null | awk 'NR==2 {printf "%s used / %s (%s)", $3, $2, $5}')"
TZ_NAME="${TZ:-$(cat /etc/timezone 2>/dev/null || echo UTC)}"
HOST_NAME="$(hostname 2>/dev/null || echo railway-container)"
BASH_LABEL="Bash ${BASH_VERSION:-unknown}"

if command -v fastfetch >/dev/null 2>&1; then
  fastfetch
else
  printf '\n%s      .--.                 %s%s@%s%s\n' "$C_BLUE" "$C_GREEN" "${USER:-root}" "$HOST_NAME" "$C_RESET"
  printf '%s     |o_o |   %sOS:%s       %s\n' "$C_BLUE" "$C_CYAN" "$C_RESET" "$OS_NAME"
  printf '%s     |:_/ |   %sHost:%s     Railway Container\n' "$C_BLUE" "$C_CYAN" "$C_RESET"
  printf '%s    //   \\ \\  %sKernel:%s   %s\n' "$C_BLUE" "$C_CYAN" "$C_RESET" "$KERNEL"
  printf '%s   (|     | ) %sArch:%s     %s\n' "$C_BLUE" "$C_CYAN" "$C_RESET" "$ARCH"
  printf '%s  /' "$C_BLUE"; printf '%s  \\  %sUptime:%s   %s\n' "$C_BLUE" "$C_CYAN" "$C_RESET" "${UPTIME:-unknown}"
  printf '%s  _|  |_%s    %sShell:%s    %s\n' "$C_BLUE" "$C_RESET" "$C_CYAN" "$C_RESET" "$BASH_LABEL"
  printf '%s  | |  | |   %sCPU:%s      %s vCPU(s) detected\n' "$C_BLUE" "$C_CYAN" "$C_RESET" "$CPU_COUNT"
  printf '%s  |_|  |_|   %sMemory:%s   %s available / %s total\n' "$C_BLUE" "$C_CYAN" "$C_RESET" "${MEM_AVAIL:-unknown}" "${MEM_TOTAL:-unknown}"
  printf '%s             %sDisk:%s     %s\n' "$C_BLUE" "$C_CYAN" "$C_RESET" "${DISK_INFO:-unknown}"
  printf '%s             %sTimezone:%s %s\n' "$C_BLUE" "$C_CYAN" "$C_RESET" "$TZ_NAME"
fi
printf '%sStatus:%s   Debian terminal ready\n\n' "$C_GREEN" "$C_RESET"
