#!/bin/bash

# exit if a command fails
set -e

#
# Required parameters
if [ -z "${app_path}" ] ; then
  echo " [!] Missing required input: app_path"
  exit 1
fi
if [ ! -f "${app_path}" ] ; then
  echo " [!] File doesn't exist at specified path: ${app_path}"
  exit 1
fi
if [ -z "${app_center_device_set}" ] ; then
  echo " [!] Missing required input: app_center_device_set"
  exit 1
fi
if [ -z "${app_center_app}" ] ; then
  echo " [!] Missing required input: app_center_app"
  exit 1
fi
if [ -z "${app_center_token}" ] ; then
  echo " [!] Missing required input: app_center_token"
  exit 1
fi
if [ -z "${app_center_test_series}" ] ; then
  echo " [!] Missing required input: app_center_test_series"
  exit 1
fi
if [ -z "${xamarin_ui_test_build_directory}" ] ; then
  echo " [!] Missing required input: xamarin_ui_test_build_directory"
  exit 1
fi
if [ ! -d "${xamarin_ui_test_build_directory}" ] ; then
  echo " [!] File doesn't exist at specified path: ${xamarin_ui_test_build_directory}"
  exit 1
fi


# ---------------------
# --- Configs:

echo " (i) Provided app path: ${app_path}"
echo " (i) Provided app center app: ${app_center_app}"
echo " (i) Provided app center device set: ${app_center_device_set}"
echo " (i) Provided app center test series: ${app_center_test_series}"
echo " (i) Provided Xamarin UI Test Path: ${xamarin_ui_test_build_directory}"

# ---------------------
# --- Main

npm install appcenter-cli@1.0.8 -g

appcenter test run uitest --app "${app_center_app}" --devices "${app_center_device_set}" --app-path "${app_path}" --test-series "${app_center_test_series}" --locale "en_US" --build-dir "${xamarin_ui_test_build_directory}"

#
# --- Exit codes:
# The exit code of your Step is very important. If you return
#  with a 0 exit code `bitrise` will register your Step as "successful".
# Any non zero exit code will be registered as "failed" by `bitrise`.