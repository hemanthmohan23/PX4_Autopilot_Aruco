#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/hemanth/aruco_ws/src/rotors_simulator/rqt_rotors"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/hemanth/aruco_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/hemanth/aruco_ws/install/lib/python3/dist-packages:/home/hemanth/aruco_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/hemanth/aruco_ws/build" \
    "/home/hemanth/anaconda3/bin/python3" \
    "/home/hemanth/aruco_ws/src/rotors_simulator/rqt_rotors/setup.py" \
     \
    build --build-base "/home/hemanth/aruco_ws/build/rotors_simulator/rqt_rotors" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/hemanth/aruco_ws/install" --install-scripts="/home/hemanth/aruco_ws/install/bin"
