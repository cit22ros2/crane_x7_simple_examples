#!/bin/bash
# SPDX-FileCopyrightText: 2023 Ryotaro Karikomi
# SPDX-License-Identifier: BSD-3-Clause

ng(){
  echo error
  res=1
}

res=0

colcon build
[ "${?}" = 0 ] || ng 
[ "${res}" = 0 ] && echo OK

exit ${res}
