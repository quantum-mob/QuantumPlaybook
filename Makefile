# $Date: 2021-04-03 21:34:34+09 $
# $Revision: 1.7 $

# Top directory
SRC=${HOME}/Cafe/Quitty/QuantumWorkbook/QuantumWorkbook

# GitHub destination
GITHUB=/Users/Shared/GitHub

# Paclet
WORKBK=${GITHUB}/QuantumWorkbook

# Paclet server
SERVER=${GITHUB}/PacletServer

github:
	rsync -avP ${SRC}/ ${WORKBK}/

commit:
	cd ${WORKBK}/; \
	git add .; \
	git commit -m "Public release"; \
	git push origin main


paclet:
	./MakePaclet.wls

update-server:
	./UpdatePacletSite.wls

commit-server:
	cd ${SERVER}/; \
	git add .; \
	git commit -m "Public release"; \
	git push origin main

