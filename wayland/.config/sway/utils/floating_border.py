#!/usr/bin/env python3
import i3ipc

i3 = i3ipc.Connection()


def on_window_event(i3, e):
    con = e.container
    if e.change == "floating" and con.name is not None:
        if con.name == "Emulator":
            con.command("border pixel 0")
            con.command("resize 61 512")
        elif con.name == "Bild-in-Bild":
            con.command("border pixel 0")
            con.command("sticky enable")
        else:
            con.command("border normal 2" if con.type == "floating_con" else "border pixel 2")

    # Handle windows that start out floating
    if e.change == "new" and con.floating == "user_on":
        con.command("border normal 2")


i3.on("window", on_window_event)
i3.main()
