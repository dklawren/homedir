# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# This Source Code Form is "Incompatible With Secondary Licenses", as
# defined by the Mozilla Public License, v. 2.0.

FROM fedora:30
MAINTAINER David Lawrence <dkl@mozilla.com>

ENV USER dkl

# Packages
RUN dnf -y -q install ansible git sudo aptitude & dnf clean all

# Ansible
COPY . /ansible
WORKDIR /ansible
RUN cd /ansible && ansible-playbook local.yml
