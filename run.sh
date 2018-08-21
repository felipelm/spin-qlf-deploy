#!/bin/bash
export LANG=en_US.UTF-8  
export LANGUAGE=en_US:en  
export LC_ALL=en_US.UTF-8

export QLF_PROJECT=$(pwd)/framework/qlf
export QLF_ROOT=$(pwd)

export DESI_ROOT=$QLF_ROOT
export DESI_PRODUCT_ROOT=$QLF_ROOT

for package in desispec desiutil desimodel desisim desitarget specter; do
	echo "Setting $package..."
	export PATH=$QLF_ROOT/$package/bin:$PATH
	export PYTHONPATH=$QLF_ROOT/$package/py:$PYTHONPATH
done

export PYTHONPATH=$QLF_ROOT/framework/bin:$PYTHONPATH
export DESIMODEL=$QLF_ROOT/desimodel

python -Wi framework/qlf/manage.py migrate

echo "QLF Backend is running at http://$QLF_HOSTNAME:$QLF_PORT/dashboard/api"

python -u $QLF_PROJECT/manage.py runserver 0.0.0.0:$QLF_PORT
