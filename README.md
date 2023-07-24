## General
16-665 Air Mobility Assignment
Last Updated: 10 October 2019
Shubham Garg (ssgarg) and Hannah Lyness (hlyness)

## Structure
* main.m: central function that calls all other functions. Takes in question number. Make sure TAs can run your code by entering main(2), for example.
   * lookup_waypoints.m: write this file to store and retreive waypoints for each question
   * trajectory_planner.m: write this function to turn waypoints into a time-discritized trajectory
   * attitude_planner.m: write this function to plan attitude
   * position_controller.m: write this function to find desired acceleration
   * attitude_controller.m: write this funciton to find desired moment
   * motor_model.m: write this funciton to turn desired attributes into motor RPMS
   * dynamics.m: write this function to get the change in state given desired state
   * plot_quadrotor_errors.m: file given to you to plot desired, actual, and error values

## Definitions
* orientation
   * phi:   roll
   * theta: pitch
   * psi:   yaw
* state: quadrotor pose 
   * Size: 16x1
   * 1:3:   position              (x,y,z)
   * 4:6:   linear velocity       (xdot, ydot, zdot)
   * 7:9:   orientation           (phi, theta, psi)
   * 10:12: angular velocity      (phidot, thetadot, psidot)
   * 13:16: motor speeds          (rpm1, rpm2, rpm3, rpm4)
* trajectory_matrix: trajectory discritized by time step
   * Size: 15 x n where n is the number of time steps
   * 1:3:   position              (x,y,z)
   * 4:6:   linear velocity       (xdot, ydot, zdot)
   * 7:9:   orientation           (phi, theta, psi)
   * 10:12: angular velocity      (phidot, thetadot, psidot)
   * 13:15: linear accelerations  (xacc, yacc, zacc)
* actual_state_matrix: actual state discritized by time step
   * Size: 15 x n where n is the number of time steps
   * 1:3:   position              (x,y,z)
   * 4:6:   linear velocity       (xdot, ydot, zdot)
   * 7:9:   orientation           (phi, theta, psi)
   * 10:12: angular velocity      (phidot, thetadot, psidot)
   * 13:15: linear accelerations  (xacc, yacc, zacc)
* actual_desired_state_matrix: desired state discritized by time step (not just the trajectory, this is what the controllers plan for)
   * Size: 15 x n where n is the number of time steps
   * 1:3:   position              (x,y,z)
   * 4:6:   linear velocity       (xdot, ydot, zdot)
   * 7:9:   orientation           (phi, theta, psi)
   * 10:12: angular velocity      (phidot, thetadot, psidot)
   * 13:15: linear accelerations  (xacc, yacc, zacc)
* current_state: current struct, used to make feeding current state into control functions easier
   * Size: struct with 5 elements from state: 
   * pos:   x,y,z
   * vel:   xdot, ydot, zdot
   * rot:   phi, theta, psi
   * omega: phidot, thetadot, psidot
   * rpm:   rpm1, rpm2, rpm3, rpm4
* desired_state: desired struct, used to make feeding current state into control functions easier
   * Size: struct with 5 elements from trajectory_matrix:
   * pos:   x,y,z
   * vel:   xdot, ydot, zdot
   * rot:   phi, theta, psi
   * omega: phidot, thetadot, psidot
   * acc:   xacc, yacc, zacc
