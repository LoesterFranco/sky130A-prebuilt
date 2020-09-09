# Copyright 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import argparse
import re

parser = argparse.ArgumentParser(
    description='Fixes macros in positions specified by a config file')

parser.add_argument('--readme', '-r', required=True,
                    help='The README.md to change')

parser.add_argument('--makefile', '-m', required=True,
                help="The Makefile to change")

parser.add_argument('--open_pdks', '-o',required=False,
                     help='The commit of open_pdks')

parser.add_argument('--skywater', '-s', required=False,
                    help='The commit of skywater-pdk')



args = parser.parse_args()
readme_file_name = args.readme
makefile_file_name = args.makefile
open_pdks_commit = args.open_pdks
skywater_commit = args.skywater



readmeFileOpener = open(readme_file_name,"r")
if readmeFileOpener.mode == 'r':
    readmeContent =readmeFileOpener.read()
readmeFileOpener.close()

makefileFileOpener = open(makefile_file_name,"r")
if makefileFileOpener.mode == 'r':
    makefileContent =makefileFileOpener.read()
makefileFileOpener.close()

if skywater_commit is not None:
    pattern_skywater = re.compile(r'\s*skywater-pdk is [\S+]+\]')
    commit = re.findall(pattern_skywater, readmeContent)
    if len(commit) == 0:
        raise IOError("commit pattern not found \"skywater-pdk is\"")
    commit[0] = commit[0].strip().replace("skywater-pdk is [","")
    commit[0] = commit[0].strip().replace("]","")
    print (commit[0])
    readmeContent = readmeContent.replace(commit[0], skywater_commit)
    makefileContent = makefileContent.replace(commit[0], skywater_commit)
    

if open_pdks_commit is not None:
    pattern_open_pdks = re.compile(r'\s*open_pdks is [\S+]+\]')
    commit = re.findall(pattern_open_pdks, readmeContent)
    if len(commit) == 0:
        raise IOError("commit pattern not found \"skywater-pdk is\"")
    commit[0] = commit[0].strip().replace("open_pdks is [","")
    commit[0] = commit[0].strip().replace("]","")
    print (commit[0])
    readmeContent = readmeContent.replace(commit[0], open_pdks_commit)
    makefileContent = makefileContent.replace(commit[0], open_pdks_commit)
        
#write the readme
readmeFileOpener = open(readme_file_name, 'w+')
readmeFileOpener.write(readmeContent)
readmeFileOpener.close()

#write the Makefile
makefileFileOpener = open(makefile_file_name, 'w+')
makefileFileOpener.write(makefileContent)
makefileFileOpener.close()

