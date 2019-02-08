function switch_monitor --description 'Switch to a different monitor'
    if not lsmod | grep i2c_dev > /dev/null
        sudo modprobe i2c-dev
    end
    if not test -c /dev/i2c-7
        echo "Monitor isn't attached"
        exit
    end
    set write_val 18
    if test (count $argv) -gt  0
        if test $argv[1] = "disconnect"
            set write_val 16
        end
    end
    sudo ddccontrol -r 0x60 -w $write_val dev:/dev/i2c-7
    sudo ddccontrol -r 0x60 dev:/dev/i2c-7
end
