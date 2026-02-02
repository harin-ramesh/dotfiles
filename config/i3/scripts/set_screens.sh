#!/bin/bash

# Your laptop monitor name (change if different)
LAPTOP_OUTPUT="eDP-1"

# Get all connected outputs except the laptop screen
OTHER_OUTPUTS=$(xrandr | grep " connected" | grep -v "$LAPTOP_OUTPUT" | cut -d ' ' -f1)

# Get laptop screen resolution (width)
LAPTOP_RES=$(xrandr | grep "^$LAPTOP_OUTPUT connected" | grep -oP '\d+x\d+' | head -1)
LAPTOP_WIDTH=${LAPTOP_RES%x*}

# Start building xrandr command
CMD="xrandr --output $LAPTOP_OUTPUT --primary --mode $LAPTOP_RES --pos 0x0 --rotate normal"

# Position for the next screen
POS_X=$LAPTOP_WIDTH

for output in $OTHER_OUTPUTS; do
    # Get resolution for the output
    RES=$(xrandr | grep "^$output connected" | grep -oP '\d+x\d+' | head -1)
    # Add output to xrandr command
    CMD+=" --output $output --mode $RES --pos ${POS_X}x0 --rotate normal"
    # Update position for next screen (stack horizontally)
    WIDTH=${RES%x*}
    POS_X=$((POS_X + WIDTH))
done

# Run the command
echo "Running command:"
echo $CMD
$CMD

