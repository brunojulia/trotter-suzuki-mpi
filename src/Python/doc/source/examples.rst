********
Examples
********

Expectation values of the Hamiltonian and kinetic operators
-----------------------------------------------------------
The following code block gives a simple example of initializing a state and calculating the expectation values of the Hamiltonian and kinetic operators and the norm of the state after the evolution.

.. code-block:: python
		
    from __future__ import print_function
    import numpy as np
    import trottersuzuki as ts

    # lattice parameters
    dim = 200
    delta_x = 1.
    delta_y = 1.
    periods = [1, 1]

    # Hamiltonian parameter
    particle_mass = 1
    external_potential = np.zeros((dim, dim))

    # initial state
    p_real = np.ones((dim, dim))
    p_imag = np.zeros((dim, dim))
    for y in range(0, dim):
        for x in range(0, dim):
            p_real[y, x] = np.sin(2*np.pi*x / dim) * np.sin(2*np.pi*y / dim)

    # evolution parameters
    delta_t = 0.001
    iterations = 200

    # launch evolution
    ts.evolve(p_real, p_imag, particle_mass, external_potential, delta_x, delta_y,
              delta_t, iterations, periods=periods)

    # expectation values
    Energy = ts.calculate_total_energy(p_real, p_imag, particle_mass,
                                       external_potential, delta_x, delta_y)
    print(Energy)

    Kinetic_Energy = ts.calculate_kinetic_energy(p_real, p_imag, particle_mass,
                                                 delta_x, delta_y)
    print(Kinetic_Energy)

    Norm2 = ts.calculate_norm2(p_real, p_imag, delta_x, delta_y)
    print(Norm2)



Imaginary time evolution to approximate the ground-state energy
---------------------------------------------------------------
.. code-block:: python

    from __future__ import print_function
    import numpy as np
    import trottersuzuki as ts
    from matplotlib import pyplot as plt


    # lattice parameters
    dim = 200
    delta_x = 1.
    delta_y = 1.

    # Hamiltonian parameter
    particle_mass = 1
    external_potential = np.zeros((dim, dim))

    # initial state
    p_real = np.ones((dim, dim))
    p_imag = np.zeros((dim, dim))

    # evolution parameters
    delta_t = 0.1
    iterations = 2000

    for i in range(0, 15):
        # launch evolution
        ts.evolve(p_real, p_imag, particle_mass, external_potential,
                  delta_x, delta_y, delta_t, iterations, imag_time=True)
        print(ts.calculate_total_energy(p_real, p_imag, particle_mass,
                                        external_potential, delta_x, delta_y))
        print(ts.calculate_norm2(p_real, p_imag, delta_x, delta_y))

    heatmap = plt.pcolor(p_real)
    plt.show()