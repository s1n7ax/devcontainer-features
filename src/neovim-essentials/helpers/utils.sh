#!/bin/bash

set -eux

get_os_info() {
	if [ -f /etc/os-release ]; then
		. /etc/os-release
		echo "$ID" "$VERSION_ID"
	else
		echo "/etc/os-release file was not found in the container" >&2
		echo "Unable to install neovim without knowing the OS" >&2
		exit 1
	fi
}

has_matching_version() {
	IFS="." read -r -a start <<<"$1"
	IFS="." read -r -a end <<<"$2"
	IFS="." read -r -a version <<<"$3"

	if [ ${version[0]} -gt ${start[0]} ] && [ ${version[0]} -lt ${end[0]} ]; then
		echo 1
		return
	fi

	if [ ${version[0]} = ${start[0]} ]; then
		for ((i = 0; i < ${#version[@]}; i++)); do
			if [ ${version[i]} -lt ${start[i]} ]; then
				echo 0
				return
			fi
		done

		echo 1
		return
	fi

	if [ ${version[0]} = ${end[0]} ]; then
		for ((i = 0; i < ${#version[@]}; i++)); do
			if [ ${version[i]} -gt ${end[i]} ]; then
				echo 0
				return
			fi
		done

		echo 1
		return
	fi

	echo 0
}

get_os_info_from_path() {
	# extract the file name
	local path="$(basename $1)"

	# remove the file extension
	local path="${path%.*}"

	IFS="-" read -a info <<<"$path"

	echo "${info[0]}" "${info[1]}" "${info[2]}"
}

source_matching_installer() {
	read -r curr_os curr_os_version <<<"$(get_os_info)"

	for installer in "helpers/installers/$curr_os"*; do
		read -r ins_os ins_vstart ins_vend <<<"$(get_os_info_from_path $installer)"
		read -r is_match <<<"$(has_matching_version $ins_vstart $ins_vend $curr_os_version)"

		if [ $is_match -eq 1 ]; then
			. "$installer"
		else
			echo "No matching installer found for $curr_os $curr_os_version" >&2
			exit 1
		fi
	done
}
