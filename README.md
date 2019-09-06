# Design A Bridge Beam

GITHUB link
https://github.com/mr-jameson/design_a_bridge_beam

## Statement of Purpose and Scope

This terminal application calculates the adequacy of a structural bridge beam. It takes user inputs for span length, load type and beam size. It returns an assessment of whether or not the beam is adequate. If the beam is not adequate, the user is presented with options to change the span, beam size or loading.

This is built for structural engineers to assist in selecting an initial beam size for their simply supported bridge design. The engineer will interact with the program by refining their inputs for span, beam-type and load-type until the capacity is the proposed beam is adequate to support the given load.

The application works by comparing the bending capacity of a selected beam to the bending action induced by the load for the given span. While this is a very simplified analysis, it is often the starting point for structural engineers to initially choose the size of a beam.

## Help

To run the application, change into the ./terminal_application directory.
Execute the program by typing ruby design_a_bridge_beam.rb into the terminal.
To exit the program prematurely, type ^C.

## Development Plan

### Features

#### Include self-weight?

The self weight feature asks the user whether or not they would like to include the self-weight of the beam in the capacity assessment. If yes, the self-weight of the beam is added to the loading applied to the beam. The user can only enter a yes or no answer.

#### Update parameters when beam size inadequate

When the beam is calculated to be inadequate, the user is prompted to update the beam-size, span length or load-type. This feature loops until the user has input a combination of parameters which allow the bending capacity to exceed the bendng action. Once this is achieved, the loop will break and the user will be taken to the optimisation loop.

#### Optimise beam size when adequate

When the initial beam size is calculated to be adequate, the user is asked whether they want to reduce the beam size. This function enables the structural engineer to design a more efficient beam. The loop is exited when the user inputs 'no' after being prompted to reduce the beam size.

### Implementation plan
Refer to link below for implementation plan spreadsheet.
https://docs.google.com/spreadsheets/d/1x8fl3CgVF5COaa2hRNPkyNvbJ_zVb0FZ2z-Vz6xG7Vo/edit?usp=sharing

### Testing Procedure
The application has been tested for beam configurations which are not adequate for the load and span, as well as for parameter configurations which are overdesigned and could be optimised by utilising a lighter beam. 
Refer to link below for testing log.
https://docs.google.com/spreadsheets/d/1q5jJ8jzO18O9azdHuJfD2PJaRS9XPx6oABJJf_b06-s/edit?usp=sharing

### Development Log

17:00 Tuesday 03/09/2019
- Basic code structure set-up
- User inputs error-proofed
- User interface flow improved

14:00 Wednesday 04/09/2019
- Currently working on logical operators to solve program if initial beam selection is inadequate.
- Would like to finish a draft of the program by the end of the day so that testing and documentation can be finalised tomorrow.

## User Interaction Outline
User experience has been a priority throughout writing this program. The termal screen is cleared, with pauses added, to generate a clean user interaction. After each time the user inputs a value, the parameters are displayed at the top of the screen. This way the user always knows what values they have entered at any given time.

The user will be prompted to input the following variables:

1. Enter span length
2. Enter load type
3. Select beam size

Each time the user is prompted for an input, a conditional statement and loop is setup to ensure the user enters an acceptable value. This prevents the program from returning an error.

If the combination of inputs results in the beam being inadequate, the user is prompted to adjust the inputs until an adequate solution is reached. Once the user has the smallest beam possible for the given span and load, the user can exit the program by selecting 'no' when prompted to reduce beam size.

