# Copyright (C) 2015 SUSE Linux GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

use base "softwarebasetest";
use strict;
use testapi;
use deepinapi qw{ open_tty };

sub run {

    open_tty "f2";
    type_string "cat /etc/lsb-release\n";
    sleep 2;
    save_screenshot;
    sleep 3;
    send_key "ctrl-l";
    assert_screen "tty-ctrl-l", 5;
    type_string "grep DISTRIB_RELEASE /etc/lsb-release\n";
    assert_screen "release-infor-lsb", 10;

    send_key "ctrl-l";
    assert_screen "tty-ctrl-l", 5;
    type_string "cat /etc/os-release\n";
    assert_screen "release-infor-os", 10;
    
    type_string "logout\n";
    send_key "ctrl-alt-f7";
    assert_screen "desktop-default", 30;

}

1;

# vim: set sw=4 et:
