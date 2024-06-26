---
title: VOTING MACHINE ON BASYS3
---

> Github: <https://github.com/dhanush-271/Voting_Machine_Basys3>
>
> KOTHAPALLI DHANUSH

# INTRODUCTION

This Verilog module simulates a voting machine, managing vote counting
and confirmation for three categories: the Bharatiya Janata Party (BJP),
the Congress (CONG), and None of the Above (NOTA). The module interfaces
with a seven-segment display to show the vote count for each party and
confirms the vote cast for each option with LEDs.

# Working Principle

The design is composed of three main modules:

1.  # Voting Machine Module

    -   The module tracks the vote counts for each option: BJP, CONG,
        and NOTA using registers (BJP_COUNT, CONG_COUNT, NOTA_COUNT).

    -   When a voter presses one of the push buttons (BJP, CONG, NOTA),
        the respective count is incremented.

    -   A confirmation signal (BJP_CONF, CONG_CONF, NOTA_CONF) is
        asserted to indicate that the vote has been successfully cast.
        This signal activates an LED or another indicator to confirm the
        vote.

    -   The system can be reset at any time using the reset signal. When
        asserted, all vote counts are reset to zero, and the system
        returns to the initial state.

    -   The digits module is used to convert the vote counts into
        four-digit representations (ones, tens, hundreds, thousands)
        based on the selected figure (BJP_FIG, CONG_FIG, NOTA_FIG).
        These digit representations are then displayed on the seven-
        segment display through the seven_seg module.

2.  # Digits Module

The digits module converts the vote counts into four- digit
representations (ones, tens, hundreds, thousands). It operates as
follows:

-   The module receives three sets of vote counts as
    inputs:BJP_COUNT,CONG_COUNT, and NOTA_CO UNT.

-   Based on the figure select signals (BJP_FIG, CONG_FIG, NOTA_FIG),
    the module selects the appropriate count to display. For example, if
    BJP_FIG is asserted, the module selects BJP_COUNT as the input
    count. Similarly, for CONG_FIG and NOTA_FIG.

-   The selected count is then divided into its individual digits (ones,
    tens, hundreds, thousands) using simple

arithmetic operations. Each digit represents a place value in the count.

-   The four-digit representations (ones, tens, hundreds, thousands) are
    assigned to their respective output signals.

3.  # Seven Segment Display Module

    -   The module cycles through each of the four digits (thousands,
        hundreds, tens, ones) rapidly to give the appearance that all
        digits are being displayed simultaneously. This is done by
        enabling one digit at a time using a 2-bit counter
        (digit_select), which determines which digit is currently
        active.

    -   The digit selection changes at a rate determined by a timer
        (digit_timer). When the timer reaches its maximum count
        (99,999), it resets and increments the digit select counter,
        effectively refreshing each digit every 1 ms.

-   For each selected digit, the corresponding 4-bit binary value (ones,
    tens, hundreds, thousands) is decoded into the seven-segment display
    pattern (seg) using a case statement. This pattern is based on
    predefined constants for each numeral (0-9).

# Constraints on Board

-   **Push Buttons:** Used to cast votes for BJP, CONG, and NOTA. Each
    button press increments the respective vote count.

-   **LEDs**: Used to confirm that a vote has been cast for BJP, CONG,
    or NOTA.

-   **Switches**: Used to select which vote count (BJP, CONG, or NOTA)
    is displayed on the seven-segment display.

-   **Seven-Segment Display**: Digits (digit \[3:0\]) to select which
    digit to display. Segments (seg \[6:0\]) to display the
    corresponding value.

# Outputs on Basys3 Board Drive_link:

> <https://drive.google.com/file/d/1Y76oNxnDJjoEsB43o2L8kTeTl_UPACgI/view?usp=sharing>
