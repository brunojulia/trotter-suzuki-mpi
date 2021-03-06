*************************
Download and Installation
*************************
The package is available from the `Python Package Index <https://pypi.python.org/pypi/trottersuzuki>`_, containing the source code and examples, and also from the `conda-forge <http://anaconda.org/conda-forge/trottersuzuki>`_ channel. The documentation is hosted on `Read the Docs <https://trotter-suzuki-mpi.readthedocs.io/>`_.

The latest development version is available on `GitHub <https://github.com/trotter-suzuki-mpi/trotter-suzuki-mpi>`_.
Further examples are available in Jupyter `notebooks <http://nbviewer.jupyter.org/github/trotter-suzuki-mpi/notebooks/tree/master/>`_.

Dependencies
============
The module requires `Numpy <http://www.numpy.org/>`_. The code is compatible with both Python 2 and 3.

If you want to use the GPU kernel, ensure that CUDA is installed and set the `CUDAHOME` environment variable before you start.

Installation via conda
----------------------
The `conda-forge <http://anaconda.org/conda-forge/trottersuzuki>`_ channel provides packages for Linux and macOS that can be installed using `conda <https://conda.io/docs/>`_:

::

    $ conda install -c conda-forge cvxopt



Installation via pip
--------------------
The code is available on PyPI, hence it can be installed by

::

    $ sudo pip install trottersuzuki

Installation from source
------------------------

If you want the latest git version, first clone the repository and generate the Python version. Note that it requires autotools and swig.

::

    $ git clone https://github.com/trotter-suzuki-mpi/trotter-suzuki-mpi
    $ cd trotter-suzuki-mpi
    $ ./autogen.sh
    $ ./configure --without-mpi --without-cuda
    $ make python


Then follow the standard procedure for installing Python modules from the `src/Python` folder:

::
    $ sudo python setup.py install

Build on Mac OS X
--------------------
Before installing using pip or from source, gcc should be installed first. As of OS X 10.9, gcc is just symlink to clang. To build trottersuzuki and this extension correctly, it is recommended to install gcc using something like:
::

    $ brew install gcc48

and set environment using:
::

    export CC=/usr/local/bin/gcc
    export CXX=/usr/local/bin/g++
    export CPP=/usr/local/bin/cpp
    export LD=/usr/local/bin/gcc
    alias c++=/usr/local/bin/c++
    alias g++=/usr/local/bin/g++
    alias gcc=/usr/local/bin/gcc
    alias cpp=/usr/local/bin/cpp
    alias ld=/usr/local/bin/gcc
    alias cc=/usr/local/bin/gcc

Then you can issue
::

    $ sudo pip install trottersuzuki
